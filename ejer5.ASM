PIC	EQU	20h
HAND	EQU	40h
DMA	EQU	50h
NDMA	EQU	20

	ORG 	80
IPDMA	DW	RUTDMA	

	ORG 	1000h
DATO	DB	"hola mundo"
FIN	DB	?
FLAG	DB	0

; rutina de atenciom de la interrupcion de DMA
	ORG	3000h
RUTDMA:	MOV	AL, 0h		; inhabilita int de hand
	OUT	HAND+1, AL
	MOV 	FLAG, 1
	MOV	AL, 0FFh	; inhabilita int del pic	
	OUT	PIC+1, AL
	MOV 	AL, 20h
	OUT 	PIC, AL		; eoi
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
	MOV	AL, 4		; inicializa dma	
	OUT 	DMA+6, AL	
	MOV	AL, 0F7h
	OUT 	PIC+1, AL	; habilita int3
	OUT	DMA+7, 	al	; inicia transferencia
	MOV	AL, 80h
	OUT	HAND+1, AL	; interrupcion de hand
	STI

CICLO:	CMP 	FLAG, 1
	JNZ	CICLO

	INT 	0	
	END

	
