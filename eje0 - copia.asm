	
	org 1000h 				;directiva donde guardo datos   
    var_bytes DB 20h 	;numero en hexadecimal
    car_word  DW ?   	;reservo espacio de memora con el ?
    

	org 2000h 				 ;directiva de segmento de codigo
    mov ax , 1000h 		 ;muevo al ax la direccion donde empiezan los datos
                         ;se tienen que mover entre registros o entre registro en variable
    mov bx , ax 
	
    mov bl, var_bytes
	
    mov car_word, bx   

    
	end 
  
    