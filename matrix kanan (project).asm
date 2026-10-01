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
    
    ORG 0000H
    
START:
    MOV DX,PORT_CON
    MOV AL, 10000000B
    OUT DX,AL
    JMP XX
    
DELAY:
    MOV CX,0FFH
DELAY9:LOOP DELAY9
RET

XX: 

;panggil kanan
    MOV BX, 1EH
    LOOP1:
        CALL KANAN
        DEC BX
        JNZ LOOP1
     
    JMP XX 
    
    
KANAN:        
       ;BARIS 7
    MOV AX,1           ;7
    OUT PORTA, AX
    
    MOV AX,11110011B
    NOT AX
    OUT PORTB, AX 
    CALL DELAY
                
                
    ;BARIS 6                
    MOV AX,2
    OUT PORTA, AX
    
    MOV AX,11110001B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY  
    
    
    ;BARIS 5               
    MOV AX,4
    OUT PORTA, AX
    
    MOV AX,00000000B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY
    
    
    ;BARIS 4              
    MOV AX,8
    OUT PORTA, AX
    
    MOV AX,00000000B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY
    
    
    ;BARIS 3               
    MOV AX,16
    OUT PORTA, AX
    
    MOV AX,11110001B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY 
    
    
    ;BARIS 2               
    MOV AX,32
    OUT PORTA, AX
    
    MOV AX,11110011B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY 
    
    
    ;BARIS 1               
    MOV AX,64
    OUT PORTA, AX
    
    MOV AX,11110111B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY
    
    
    ;BARIS 8               
    MOV AX,128
    OUT PORTA, AX
    
    MOV AX,11110111B 
    NOT AX
    OUT PORTB, AX 
    CALL DELAY
  RET
  
       
    
    JMP XX
CODE ENDS    
    
              

HLT           ; halt!




HLT           ; halt!


