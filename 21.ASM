	ORG	1000H
rows	DB	2
cols	DB	3
cadena	DB	?

	ORG 	2000H
;	MOV BX, OFFSET rows
;	INT 6
;	MOV BX, OFFSET cols
;	INT 6

	MOV	CX, 0
	MOV 	CL, cols
	MOV	BX, OFFSET cadena	
fila:	MOV     BYTE PTR[BX], 2AH ; carga un asterisco
	INC	BX
	DEC	CX
	JNZ	fila
	
	MOV 	BX, OFFSET cadena	
	MOV 	AL, cols

	MOV 	CH, 0
	MOV	CL, rows

ciclo:  INT 	7
	DEC 	CX
	JNZ	ciclo
	
	INT 	0
	END

	
