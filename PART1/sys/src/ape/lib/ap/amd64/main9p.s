	TEXT	_mainp(SB), 1, $8

	MOVQ	AX, _clock(SB)
	CALL	_profmain(SB)
	MOVQ	__prof+8(SB), AX
	MOVQ	AX, __prof+0(SB)
	CALL	_envsetup(SB)
	MOVL	inargc-8(FP), RARG
	LEAQ	inargv+0(FP), AX
	MOVQ	AX, 8(SP)
	CALL	main(SB)

loop:
	MOVL	AX, RARG
	CALL	exit(SB)
	MOVQ	$_profin(SB), AX	/* force loading of profile */
	MOVL	$0, AX
	JMP	loop

TEXT	_savearg(SB), 1, $0
	RET

TEXT	_callpc(SB), 1, $0
	MOVQ	8(RARG), AX
	RET
