PIO	EQU	30h 							;inicializa los registros a partir de la direccion 30h, tdos los registrs se almacenan en posiciones cnsecutivas

	ORG 	1000h 						;segmento de datosdefinido a partir de la direccion 1000h
DATO	DB	"hola mundo","$" ;
FIN	DB	?

	ORG	2000h	

	MOV 	AL, 0FDh					; inicializa PIO para impresora 0fdh indica valores de entrada cerrada
	OUT 	PIO+2, AL
	MOV 	AL, 0;		
	OUT	PIO+3, AL
	IN 	AL, PIO							; fin inicializacion
	AND 	AL, 0FDh
	OUT 	PIO, AL
	MOV	BX, OFFSET DATO 				; indicando la cadena de caracteres, imprimiend caracter por caracter
	MOV 	CL, OFFSET FIN-OFFSET DATO 	;averigua la longitud de la cadena

POLL:	IN	AL, PIO 					;ciclo de impresiòn
	AND	AL, 1
	JNZ	POLL
	MOV 	AL, [BX]
	OUT	PIO+1, AL
	IN 	AL, PIO							; pulso strobe
	OR	AL, 02h
	OUT	PIO, AL
	IN	AL, PIO
	AND 	AL, 0FDh
	OUT	PIO, AL							; fin pulso
	INC 	BX
	DEC	CL
	JNZ 	POLL

	INT 	0	
	END

	
