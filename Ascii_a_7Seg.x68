*-----------------------------------------------------------
* Program    :  DIGITO EN ASCII A 7 SEGMENTOS
* Written by :  Fulgencio
* Date       :
* Description:  Pide un Dígito por teclado y lo representa en un visualizador 7 SEGMENTOS
*-----------------------------------------------------------
SEG1 EQU $E00000
SEG2 EQU $E00002
SEG3 EQU $E00004
SEG4 EQU $E00006
SEG5 EQU $E00008
SEG6 EQU $E0000A
SEG7 EQU $E0000C
SEG8 EQU $E0000E

  ORG	$1000
START	            * First instruction of program
	CLR.B SEG1      * Apaga todos los visualizadores 7SEG
	CLR.B SEG2
	CLR.B SEG3
	CLR.B SEG4
	CLR.B SEG5
	CLR.B SEG6
	CLR.B SEG7
	CLR.B SEG8

	MOVE.L #14,D0   * Mensaje por pantalla
	MOVE.L #PIDE,A1
	TRAP #15
    
	MOVE.L #5,D0    * Toma un valor del teclado en ASCII que se guarda en D1
	TRAP #15             
	
	SUB.L #$30,D1   * Convierte de ASCII a valor numérico (-$30)
	
	MOVE.L #TABLA,A1
	MOVE.B (A1,D1),SEG8     * Obtiene el valor de los segmentos de la tabla
	
	

FIN	
	SIMHALT		* halt simulator

	ORG $2000   * Origen de Datos

TABLA	DC.B %00111111 DIGITO 0
	DC.B %00000110 DIGITO 1
	DC.B %01011011 DIGITO 2
	DC.B %01001111 DIGITO 3
	DC.B %01100110 DIGITO 4
	DC.B %01101101 DIGITO 5
	DC.B %01111101 DIGITO 6
	DC.B %00000111 DIGITO 7
	DC.B %01111111 DIGITO 8
	DC.B %01101111 DIGITO 9
	DC.B %00000000 DIGITO OFF
	DC.B %10000000 PUNTO
	
PIDE	DC.B 'Pulsa un Dígito >',0

	END 	START		* last line of source
