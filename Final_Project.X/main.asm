;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NAMES: Justin Homme
; ASSIGNMENT: Final Project;
; DATE: 11/10/22;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;
PROCESSOR 18F57Q43
#include <xc.inc>


 // configuration word 1
CONFIG FEXTOSC=XT // crystal oscillator
CONFIG RSTOSC=EXTOSC // EXTOSC operating per FEXTOSC bits
CONFIG CLKOUTEN=OFF // CLKOUT function is disabled
CONFIG PR1WAY=ON // PRLOCK bit can be cleared and set only once
CONFIG CSWEN=ON // Writing to NOSC and NDIV is allowed
CONFIG FCMEN=ON // Fail-Safe Clock Monitor enabled
// configuration word 2
CONFIG MCLRE=EXTMCLR // If LVP=0, MCLR pin is MCLR; If LVP=1, RE3 pin function is MCLR
CONFIG PWRTS=PWRT_OFF // PWRT is disabled
CONFIG MVECEN=OFF // Vector table isn't used to prioritize interrupts
CONFIG IVT1WAY=ON // IVTLOCK bit can be cleared and set only once
CONFIG LPBOREN=OFF // ULPBOR disabled
CONFIG BOREN=SBORDIS // Brown-out Reset enabled, SBOREN bit is ignored
CONFIG BORV=VBOR_2P45 // Brown-out Reset Voltage (VBOR) set to 2.45V
CONFIG ZCD=OFF // ZCD disabled, enable by setting the ZCDSEN bit of ZCDCON
CONFIG PPS1WAY=ON // PPSLOCK cleared/set only once; PPS locked after clear/set cycle
CONFIG STVREN=ON // Stack full/underflow will cause Reset
CONFIG DEBUG=OFF // Background debugger disabled
CONFIG XINST=OFF // Extended Instruction Set and Indexed Addressing Mode disabled
// configuration word 3
CONFIG WDTCPS=WDTCPS_31 // Divider ratio 1:65536; software control of WDTPS
CONFIG WDTE=OFF // WDT Disabled; SWDTEN is ignored
CONFIG WDTCWS=WDTCWS_7 // window open 100%; software control; keyed access not required
CONFIG WDTCCS=SC // Software Control
// configuration word 4
CONFIG BBSIZE=BBSIZE_512 // Boot Block size is 512 words
CONFIG BBEN=OFF // Boot block disabled
CONFIG SAFEN=OFF // SAF disabled
CONFIG WRTAPP=OFF // Application Block not write protected
CONFIG WRTB=OFF // Configuration registers (300000-30000Bh) not write-protected
CONFIG WRTC=OFF // Boot Block (000000-0007FFh) not write-protected
CONFIG WRTD=OFF // Data EEPROM not write-protected
CONFIG WRTSAF=OFF // SAF not Write Protected
CONFIG LVP=ON // Low voltage programming enabled, MCLR pin, MCLRE ignored
FNCONF udata_acs,?au_,?pa_  ;  **** ADDED THIS LINE ON 10/19/20 to address error 474 *****
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Control bits in PORTB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LCD_RS	EQU 0x00    ; PORTB bit 0
LCD_EN	EQU 0x01    ; PORTB bit 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Data bits in PORTD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LCD_DB0	EQU 0x00    ; PORTD bit 0
LCD_DB1	EQU 0x01    ; PORTD bit 1
LCD_DB2	EQU 0x02    ; PORTD bit 2
LCD_DB3	EQU 0x03    ; PORTD bit 3
LCD_DB4	EQU 0x04    ; PORTD bit 4
LCD_DB5	EQU 0x05    ; PORTD bit 5
LCD_DB6	EQU 0x06    ; PORTD bit 6
LCD_DB7	EQU 0x07    ; PORTD bit 7

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Values for DELAY_MSEC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
R1  EQU	    0x01
R2  EQU	    0x02

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ASCII Characters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ASTRX	EQU 0x2A    ; *

CAP_A	EQU 0x41    ; A
CAP_B	EQU 0x42    ; B
CAP_C	EQU 0x43    ; C
CAP_D	EQU 0x44    ; D
CAP_E	EQU 0x45    ; E
CAP_F	EQU 0x46    ; F
CAP_G	EQU 0x47    ; G
CAP_H	EQU 0x48    ; H
CAP_I	EQU 0x49    ; I
CAP_J	EQU 0x4A    ; J
CAP_K	EQU 0x4B    ; K
CAP_L	EQU 0x4C    ; L
CAP_M	EQU 0x4D    ; M
CAP_N	EQU 0x4E    ; N
CAP_O	EQU 0x4F    ; O
CAP_P	EQU 0x50    ; P
CAP_Q	EQU 0x51    ; Q
CAP_R	EQU 0x52    ; R
CAP_S	EQU 0x53    ; S
CAP_T	EQU 0x54    ; T
CAP_U	EQU 0x55    ; U
CAP_V	EQU 0x56    ; V
CAP_W	EQU 0x57    ; W
CAP_X	EQU 0x58    ; X
CAP_Y	EQU 0x59    ; Y
CAP_Z	EQU 0x5A    ; Z
  
LOW_A	EQU 0x61    ; a
LOW_B	EQU 0x62    ; b
LOW_C	EQU 0x63    ; c
LOW_D	EQU 0x64    ; d
LOW_E	EQU 0x65    ; e
LOW_F	EQU 0x66    ; f
LOW_G	EQU 0x67    ; g
LOW_H	EQU 0x68    ; h
LOW_I	EQU 0x69    ; i
LOW_J	EQU 0x6A    ; j
LOW_K	EQU 0x6B    ; k
LOW_L	EQU 0x6C    ; l
LOW_M	EQU 0x6D    ; m
LOW_N	EQU 0x6E    ; n
LOW_O	EQU 0x6F    ; o
LOW_P	EQU 0x70    ; p
LOW_Q	EQU 0x71    ; q
LOW_R	EQU 0x72    ; r
LOW_S	EQU 0x73    ; s
LOW_T	EQU 0x74    ; t
LOW_U	EQU 0x75    ; u
LOW_V	EQU 0x76    ; v
LOW_W	EQU 0x77    ; w
LOW_X	EQU 0x78    ; x
LOW_Y	EQU 0x79    ; y
LOW_Z	EQU 0x7A    ; z
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Instruction data for PORTD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CLR_DSP	EQU 0x01    
R_HOME	EQU 0x02
DISP_ON	EQU 0x0E    ; Display on, cursor, no blink
FUN_SET	EQU 0x3C    ; 8 bit, 2 lines, 5x11

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Parameter for WRITE_CHAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHAR_REG EQU 0x01	

 // configuration word 5
CONFIG CP=OFF // PFM and Data EEPROM code protection disabled
;objects in common (Access bank) memory
PSECT udata_acs
max:
 DS 1 ;reserve 1 byte for max
tmp:
 DS 1 ;1 byte for tmp 
intsave_regs:
 DS 3
;this must be linked to the reset vector
 
 
ORG 0x00
GOTO	main

;ORG 0x0008
;GOTO intVecHi
 
COUNTR	EQU 0x60;
	
PSECT resetVec,class=CODE,reloc=2
resetVec:
 goto main
 
;PSECT hi_int_vec, reloc=2, class=CODE, delta=1
;intVecHi:
;    NOP
;    retfie
    
PSECT code

main:
    
    BANKSEL PORTD ;
    CLRF PORTD,	1 ;Clear PORTD
    BANKSEL LATD ;
    CLRF LATD,	1 ;Clear Data Latch
    BANKSEL ANSELD ;
    CLRF ANSELD, 1 ;Enable digital drivers
    BANKSEL TRISD ;
    MOVLW 0x00 ;Set RA[5:3] as inputs
    MOVWF TRISD, 1
    
    BANKSEL PORTB ;
    CLRF PORTB,	1 ;Clear PORTD
    BANKSEL LATB ;
    CLRF LATB,	1 ;Clear Data Latch
    BANKSEL ANSELB ;
    CLRF ANSELB, 1 ;Enable digital drivers
    BANKSEL TRISB ;
    MOVLW 0x00 ;Set RA[5:3] as inputs
    MOVWF TRISB, 1
    
HERE1:    
    // Setup
    ; Tell Controller: 4-bit data, 2-line display, 5x7 font
    // Wait some time for start-up
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    BANKSEL PORTD
    CLRF    PORTD, 1
    ; Function Set cmd
    MOVLW   FUN_SET
    MOVWF   PORTD, 1
    ; Pulse E
    BANKSEL PORTB
    CLRF    PORTB, 1
    BSF	    PORTB, LCD_EN,  1	; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTD, LCD_EN,  1	; Set E lo
    
    CALL    DELAY_MSEC		; TODO - change to lower delay
    
    BANKSEL PORTD

    ; Clear display
    CLRF    PORTD, 1		
    MOVLW   CLR_DSP
    MOVWF   PORTD, 1
    ; Pulse E
    BANKSEL PORTB
    CLRF    PORTB, 1
    BSF	    PORTB, LCD_EN, 1	; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTB, LCD_EN, 1	; Set E lo
    
    ; Longer Delay for this command
    CALL    DELAY_MSEC		; TODO - change to lower delay
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    BANKSEL PORTD

    ; Return home
    MOVLW   R_HOME
    MOVWF   PORTD, 1
    ; Pulse E
    BANKSEL PORTB
    CLRF    PORTB, 1
    BSF	    PORTB, LCD_EN,  1	; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTD, LCD_EN,  1	; Set E lo
    
    CALL    DELAY_MSEC		; TODO - change to lower delay
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    BANKSEL PORTD
    
    // Display on; cursor; no blink
    MOVLW   DISP_ON
    MOVWF   PORTD, 1
    ; Pulse E
    BANKSEL PORTB
    BSF	    PORTB, LCD_RS   ; Data entry mode
    BSF	    PORTB, LCD_EN   ; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTB, LCD_EN   ; Set E lo
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC

    ; Send Data Chararcter "H"
    MOVLB   0x09
    NOP
    MOVLW   CAP_H
    BANKSEL PORTD
    MOVWF   PORTD, 1
    BANKSEL PORTB
    BSF	    PORTB, LCD_RS   ; Data entry mode
    BSF	    PORTB, LCD_EN   ; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTB, LCD_EN   ; Set E lo
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    MOVLB   0x09
;    MOVWF   CHAR_REG, 1
;    CALL    WRITE_CHAR
    ; Send Data Character "i"
    MOVLW   LOW_I
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR

HERE2:    NOP
    
    BRA    HERE2

DELAY_MSEC:
    MOVLB   0x09
    MOVLW   0xFF
    MOVWF   R2,	1
L_1:	; MAIN loop in the subroutine to generate a delay of R2 msecs
    MOVLW   0xC7
    MOVWF   R1
L_2:	; inner loop generates a delay of 1 msecs
    NOP
    NOP
    DECF R1, F
    BNZ L_2	
    DECF R2, F
    BNZ L_1
    
    RETURN  ; End DELAY_MSEC
    
WRITE_CHAR:

    MOVLB  0x09
    MOVF   CHAR_REG, 0, 1
    
    BANKSEL PORTD
    CLRF    PORTD
    NOP
    
    MOVWF   PORTD, 1
    
    ; Toggle Enable Pin
    CALL    PULSE_E
    
    ; Clear PORTD before returning
    BANKSEL PORTD
    CLRF    PORTD, 1
    NOP
    
    ; Re-init the BSR
    MOVLB   0x09
    
    RETURN  ; End WRITE_CHAR
    
PULSE_E:
    
    ; Toggle Enable Pin
    BANKSEL PORTB
    BSF	    PORTB, LCD_RS   ; Data entry mode
    BSF	    PORTB, LCD_EN   ; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTB, LCD_EN   ; Set E lo
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    RETURN  ; End PULSE_E
    
 END resetVec
    