	ORG	1000h	

	var_byte	DB	20h
    var_word	DW	?
	
	ORG	2000h	

	MOV AX, 1000h 
	MOV	BX, AX
	MOV	BL, var_byte
	MOV var_word, BX 
	HLT
	END