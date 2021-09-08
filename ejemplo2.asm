; Observar como se guardan los datos en la memoria.
; Aprender el uso de las instrucciones nuevas.

ORG	1000h	

	num1	DB	0Ah
		DB	0Bh
	num2	DW	13ABh
	lista	DB 	1, 2, 3, 4

ORG	2000h	

	MOV 	AX, 1234h 

	MOV	BL, num1 
	MOV	CL, num1+1 
        MOV 	DX, num2 

	MOV	BX, OFFSET lista ;offset toma la direccion de inicio de lista
	MOV 	AL, [BX] 
	MOV     BYTE PTR[BX], 0FDh  ;byte ptr -> apunta al byte (¿porque hay un 0 al inicio de OFDh?)
	MOV 	WORD PTR[BX], 1006h ;byte ptr -> apunta a la palabra

	HLT
	END