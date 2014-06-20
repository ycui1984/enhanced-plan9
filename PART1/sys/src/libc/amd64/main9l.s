/*
 * version of main9.s for use in Linux64 test environment with 6load
 */
#define NPRIVATES	16

/*
 * abi expects 	rbx, rsp, rbp, r12-r15 to be preserved
 */

TEXT	_main(SB), 1, $-1
	PUSHQ	$0	/* freeze frame */
	MOVQ	SP, _origsp(SB)
	MOVQ	BX, _origbx(SB)
	MOVQ	BP, _origbp(SB)
	MOVQ	R12, _origr12(SB)
	MOVQ	R13, _origr13(SB)
	MOVQ	R14, _origr14(SB)
	MOVQ	R15, _origr15(SB)

	MOVQ	SP, _tos(SB)
	SUBQ	$16384, SP
	MOVQ	SP, _privates(SB)
	MOVL	$NPRIVATES, _nprivates(SB)
	SUBQ	$16, SP
	MOVQ	DI, 0(SP)	/* argc */
	MOVQ	DI, RARG
	MOVQ	SI, 8(SP)	/* argv */
	MOVQ	DX, _svc(SB)
	CALL	main(SB)

loop:
	MOVQ	$_exits<>(SB), RARG
	CALL	exits(SB)
	JMP	loop

TEXT _callsys(SB), $0
	MOVQ	SP, _newsp(SB)
	MOVQ	_origsp(SB), SP
	MOVQ	_svc(SB), R8
	MOVQ	_sysargs(SB), DI
	MOVQ	_sysargs+8(SB), SI
	MOVQ	_sysargs+16(SB), DX
	MOVQ	_sysargs+24(SB), CX
	MOVQ	_origbx(SB), BX
	MOVQ	_origbp(SB), BP
	MOVQ	_origr12(SB), R12
	MOVQ	_origr13(SB), R13
	MOVQ	_origr14(SB), R14
	MOVQ	_origr15(SB), R15
	CALL	R8
	/* result in RAX */
	MOVQ	_newsp(SB), SP
	RET

DATA	_exits<>+0(SB)/4, $"main"
GLOBL	_exits<>+0(SB), $5

GLOBL	_origsp(SB), $8
GLOBL	_origbx(SB), $8
GLOBL	_origbp(SB), $8
GLOBL	_origr12(SB), $8
GLOBL	_origr13(SB), $8
GLOBL	_origr14(SB), $8
GLOBL	_origr15(SB), $8
GLOBL	_newsp(SB), $8
GLOBL	_sysargs(SB), $64
GLOBL	_svc(SB), $8
