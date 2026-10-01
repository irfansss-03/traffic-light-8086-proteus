#make_bin#

; BIN is plain binary format similar to .com format, but not limited to 1 segment;
; All values between # are directives, these values are saved into a separate .binf file.
; Before loading .bin file emulator reads .binf file with the same file name.

; All directives are optional, if you don't need them, delete them.

; set loading address, .bin file will be loaded to this address:
#LOAD_SEGMENT=0500h#
#LOAD_OFFSET=0000h#

; set entry point:
#CS=0500h#	; same as loading segment
#IP=0000h#	; same as loading offset

; set segment registers
#DS=0500h#	; same as loading segment
#ES=0500h#	; same as loading segment

; set stack
#SS=0500h#	; same as loading segment
#SP=FFFEh#	; set to top of loading segment

; set general registers (optional)
#AX=0000h#
#BX=0000h#
#CX=0000h#
#DX=0000h#
#SI=0000h#
#DI=0000h#
#BP=0000h#

; add your code here
DATA SEGMENT
    PORTA EQU 00H
    PORTB EQU 02H
    PORTC EQU 04H
    PORT_CON EQU 06H
DATA ENDS

CODE SEGMENT
    MOV AX,DATA
    MOV DS,AX
    
org 0000h

; add your code here
START:

    MOV DX, PORT_CON
    MOV AL, 10000000B; PORT A as Output
    OUT DX, AL
    
    JMP SEG
    
DELAY9:
    DELAY91: loop DELAY91
RET        
    
    SEG:
    
;-------------------------CLASS-----------------------------------    

;-------------------------BASE A MATI--------------------------------------- 
    MOV AL, 00000000B
    MOV DX, PORTA
    OUT DX,AL
    CALL AMATI 
;-------------------------BASE A HIDUP---------------------------------------    
    MOV AL, 01111111B
    MOV DX, PORTA
    OUT DX,AL
    CALL A 
;-------------------------BASE A MATI--------------------------------------- 
    MOV AL, 00000000B
    MOV DX, PORTA
    OUT DX,AL
;-------------------------BASE B MATI----------------------------------------      
    MOV AL, 00000000B
    MOV DX, PORTB
    OUT DX,AL
    CALL BMATI 
;-------------------------BASE B HIDUP---------------------------------------       
    MOV AL, 01111111B
    MOV DX, PORTB
    OUT DX,AL
    CALL B
;-------------------------BASE B MATI----------------------------------------      
    MOV AL, 00000000B
    MOV DX, PORTB
    OUT DX,AL
;-------------------------BASE C MATI-----------------------------------------           
    MOV AL, 00000000B
    MOV DX, PORTC
    OUT DX,AL     
    CALL CMATI 
;-------------------------BASE C HIDUP----------------------------------------
    MOV AL, 01111111B
    MOV DX, PORTC
    OUT DX,AL
    CALL C
;-------------------------BASE C MATI-----------------------------------------           
    MOV AL, 00000000B
    MOV DX, PORTC
    OUT DX,AL     
      
    JMP SEG

;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------PANGGIL---------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------A HIDUP---------------------------------------
A proc near

MOV AL, 01100110B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
    MOV AL, 01001111B ; displaying 3
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 01011011B ; displaying 2
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 00000110B ; displaying 1
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
A ENDP
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------B HIDUP---------------------------------------
B proc near

MOV AL, 01100110B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
    MOV AL, 01001111B ; displaying 3
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 01011011B ; displaying 2
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 00000110B ; displaying 1
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
B ENDP
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------C HIDUP---------------------------------------
C proc near

MOV AL, 01100110B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
    MOV AL, 01001111B ; displaying 3
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 01011011B ; displaying 2
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

    MOV AL, 00000110B ; displaying 1
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
C ENDP
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------A MATI---------------------------------------
AMATI proc near

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTA
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
AMATI ENDP
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------B MATI---------------------------------------
BMATI proc near

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
MOV AL, 00000000B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTB
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
BMATI ENDP
;------------------------------------------------------------------
;------------------------------------------------------------------
;---------------------------C MATI---------------------------------------
CMATI proc near

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9
    
MOV AL, 00000000B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

MOV AL, 00000000B ; displaying 4
    MOV DX, PORTC
    OUT DX,AL
    MOV CX,0DF36H; Delay
CALL DELAY9

RET
CMATI ENDP


CODE ENDS
END


HLT           ; halt!


