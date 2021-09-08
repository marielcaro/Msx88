PIC		EQU	20h
HAND	EQU	40h
NHAND	EQU	10 

		ORG 40 ;vector de interrupcion
IPHAND	DW	RUTHAND	

		ORG 	1000h  ; declaracion de variables
DATO	DB	"hola mundo"
FIN		DB	?

		ORG		3000h 	
RUTHAND:PUSH	AX
		MOV	AL, [BX]	
		OUT	HAND, AL
		INC BX
		DEC	CL
		MOV	AL, 20h  ; preparar fin de interrupcion
		OUT	PIC, AL
		POP	AX
		IRET	 ; retorno al programa principal

		ORG	2000h	

		MOV	BX, OFFSET DATO
		MOV CL, OFFSET FIN - OFFSET DATO
		CLI ; deshabilito interrupciones
		MOV AL, 0FBh ;carga de interrupcion
		OUT	PIC+1, AL
		MOV AL, NHAND
		OUT	PIC+6, AL
		MOV AL, 80h 
		OUT	HAND+1, AL
		STI ; vuelvo a habilitar interrupciones
CICLO:	CMP	CL, 0 
		JNZ	CICLO
		IN 	AL, HAND+1 
		AND	AL, 7Fh
		OUT HAND+1, AL

		INT 0	
		END

	
