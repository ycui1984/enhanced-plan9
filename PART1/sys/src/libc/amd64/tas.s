/*
 * The kernel and the libc use the same constant for TAS
 */
TEXT	_tas(SB),1,$0

	MOVL	$0xdeaddead,AX
	XCHGL	AX,(RARG)
	RET
