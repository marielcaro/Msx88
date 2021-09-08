; Observar como se guardan en memoria los datos.
; Observar como se realiza la suma (en la ALU) con direccionamiento inmediato e indirecto por registro.
; Observar la función del registro RI (encima de IP).

ORG 2000H
	MOV Al, 12H
	MOV AH, AL
 	MOV Dl, 10H
	MOV DH, DL
 	ADD Al, Dl
		
	MOV BX, 1010H
	MOV [BX], AX
	MOV BX, 1012H
	MOV [BX], DX
	ADD AX, DX
	MOV BX, 1015H
	MOV [BX], AX;

	HLT
	END

	