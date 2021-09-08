PIC	EQU	20h
DMA	EQU	50h
NDMA	EQU	20

	ORG 	80
IPDMA	DW	RUTDMA	

	ORG 	1000h
DATO	DB	"hola mundo"
FIN	DB	?
NCHAR	DB	?

	ORG	1500h
COPIA	DB	?

; rutina de atenciom de la interrupcion de DMA
	ORG	3000h
RUTDMA:	MOV	AL, 0FFh	; inhabilita
	OUT	PIC+1, AL	; interrupcion de PIC
	MOV	BX, OFFSET COPIA
	MOV	AL, NCHAR
	INT 	7
	MOV 	AL, 20h
	OUT	PIC, AL		; fin interrupcion
	IRET	

	ORG	2000h	
	CLI
	MOV	AL, NDMA
	OUT	PIC+7, AL	; registro INT3 del PIC
	MOV	AX, OFFSET DATO	
	OUT	DMA, AL		; direccion inicio del bloque a transferir
	MOV	AL, AH
	OUT	DMA+1, AL
	MOV	AX, OFFSET FIN - OFFSET DATO
	OUT	DMA+2, AL	; cantidad a transferir
	MOV	AL, AH
	OUT	DMA+3, AL
	MOV	AX, OFFSET COPIA
	OUT 	DMA+4, AL	; direccion destino del bloque a transferir
	MOV	AL, AH
	OUT	DMA+5, AL
	MOV	AL, 0Ah
	OUT 	DMA+6, AL	
	MOV	AL, 0F7h
	OUT 	PIC+1, AL	; habilita int3
	STI
	MOV	BX, OFFSET DATO
	MOV	AL, OFFSET FIN - OFFSET DATO
	MOV	NCHAR, AL
	INT 	7		; original
	MOV	AL, 7h
	OUT	DMA+7, AL	; comienza transferencia

	INT 	0	
	END

	
