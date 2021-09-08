PA	EQU	30h                  
PB	EQU	31h
CA	EQU	32h
CB 	EQU	33h

	ORG	2000h	

	MOV 	AL, 0FFh ; 	PA entrada microconmutadores
	OUT 	CA, AL
	MOV 	AL, 0;		PB salida luces 
	OUT	CB, AL

POLL:	IN	AL, PA
	OUT	PB, AL
	JMP	POLL

	END

	
