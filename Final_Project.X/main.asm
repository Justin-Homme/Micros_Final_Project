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
CONFIG FEXTOSC=LP // crystal oscillator
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
CR	EQU 0x0D    ; Carriage Return
C_SPACE	EQU 0x20    ; " "
ASTRX	EQU 0x2A    ; *
COLON	EQU 0x3A    ; :
	
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
DISP_ON	EQU 0x0C    ; Display on, no cursor, no blink
FUN_SET	EQU 0x3C    ; 8 bit, 2 lines, 5x11
LINE_2	EQU 0xC0    ; Go to Line 2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Parameter for WRITE_CHAR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHAR_REG EQU 0x01	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Keypad Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COL_0	EQU 0x0E    ; Selects column 0
COL_1	EQU 0x0D    ; Selects column 1
COL_2	EQU 0x0B    ; Selects column 2
COL_3	EQU 0x07    ; Selects column 3
 
B_K0	EQU 0xEE    ; Button for character: '1'
B_K1	EQU 0xED    ; Button for character: '2'
B_K2	EQU 0xEB    ; Button for character: '3'
B_K3	EQU 0xE7    ; Button for character: 'A'
	
B_K4	EQU 0xDE    ; Button for character: '4'
B_K5	EQU 0xDD    ; Button for character: '5'
B_K6	EQU 0xDB    ; Button for character: '6'
B_K7	EQU 0xD7    ; Button for character: 'B'
	
B_K8	EQU 0xEE    ; Button for character: '7'
B_K9	EQU 0xED    ; Button for character: '8'
B_K10	EQU 0xEB    ; Button for character: '3'
B_K11	EQU 0xE7    ; Button for character: 'A'
	
B_K4	EQU 0xDE    ; Button for character: '4'
B_K5	EQU 0xDD    ; Button for character: '5'
B_K6	EQU 0xDB    ; Button for character: '6'
B_K7	EQU 0xD7    ; Button for character: 'B'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; User Entered Values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UEV_0	EQU 0x0990
UEV_1	EQU 0x0991
UEV_2	EQU 0x0992
UEV_3	EQU 0x0993
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Answer Key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ANS_0	EQU B_K0    ; 1
ANS_1	EQU B_K1    ; 2
ANS_2	EQU B_K2    ; 3
ANS_3	EQU B_K4    ; 4
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Temporary Storage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
TEMP	EQU 0x30
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Counters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COUNTR		EQU 0x20    ; Counts how many digits have been entered
DELAY_COUNT	EQU 0x21    ; Counter for 1 second delay
	
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

ORG 0x0008
GOTO intVecHi
	
PSECT resetVec,class=CODE,reloc=2
resetVec:
 goto main
 
PSECT hi_int_vec, reloc=2, class=CODE, delta=1
intVecHi:
    NOP
    retfie
    
PSECT code

main:
    
    BANKSEL PORTC 
    CLRF PORTC,	1		; Clear PORTC
    BANKSEL LATC 
    CLRF LATC,	1		; Clear Data Latch
    BANKSEL ANSELC 
    CLRF ANSELC, 1		; Enable digital drivers
    BANKSEL INLVLC
    SETF INLVLC, 1		; Use TTL for port reads
    BANKSEL WPUC
    SETF WPUC, 1		; Enable Weak Pull Up
    BANKSEL ODCONC
    CLRF ODCONC, 1
    BANKSEL TRISC 
    MOVLW 0xF0			; Set RC[7:4] as inputs and RA[3:0] as outputs
    MOVWF TRISC, 1
    
    BANKSEL PORTD 
    CLRF PORTD,	1		; Clear PORTD
    BANKSEL LATD 
    CLRF LATD,	1		; Clear Data Latch
    BANKSEL ANSELD 
    CLRF ANSELD, 1		; Enable digital drivers
    BANKSEL TRISD 
    MOVLW 0x00			; Set RD[7:0] as outputs
    MOVWF TRISD, 1
    
    BANKSEL PORTB 
    CLRF PORTB,	1		; Clear PORTB
    BANKSEL LATB 
    CLRF LATB,	1		; Clear Data Latch
    BANKSEL ANSELB 
    CLRF ANSELB, 1		; Enable digital drivers
    BANKSEL TRISB 
    MOVLW 0x00			; Set RB[7:0] as outputs
    MOVWF TRISB, 1
    
HERE1:    

    // Wait some time for start-up
    CALL DELAY_20_MSEC
    
    ; Useful for "GOTO HERE1" ; Puts us in command mode
    BANKSEL PORTB
    CLRF    PORTB, 1
    
; Setup commands
    
    BANKSEL PORTD
    CLRF    PORTD, 1
    ; Function Set cmd
    MOVLW   FUN_SET
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E		
    
    BANKSEL PORTD

    ; Clear display
    CLRF    PORTD, 1		
    MOVLW   CLR_DSP
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    BANKSEL PORTD

    ; Return home
    MOVLW   R_HOME
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    BANKSEL PORTD
    
    // Display on; no cursor; no blink
    MOVLW   DISP_ON
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
; End of setup commands
    
; Data Entry

    ; Send Data Character "E"
    MOVLB   0x09
    MOVLW   CAP_E
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "n"
    MOVLB   0x09
    MOVLW   LOW_N
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "t"
    MOVLB   0x09
    MOVLW   LOW_T
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
   
    ; Send Data Character "e"
    MOVLB   0x09
    MOVLW   LOW_E
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "r"
    MOVLB   0x09
    MOVLW   LOW_R
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send a space
    MOVLB   0x09
    MOVLW   C_SPACE
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
     ; Send Data Character "p"
    MOVLB   0x09
    MOVLW   LOW_P
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "a"
    MOVLB   0x09
    MOVLW   LOW_A
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "s"
    MOVLB   0x09
    MOVLW   LOW_S
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
   
    ; Send Data Character "s"
    MOVLB   0x09
    MOVLW   LOW_S
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "c"
    MOVLB   0x09
    MOVLW   LOW_C
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "o"
    MOVLB   0x09
    MOVLW   LOW_O
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "d"
    MOVLB   0x09
    MOVLW   LOW_D
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
   
    ; Send Data Character "e"
    MOVLB   0x09
    MOVLW   LOW_E
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character ":"
    MOVLB   0x09
    MOVLW   COLON
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Go to Line 2
    BANKSEL PORTB
    CLRF    PORTB, 1
    
    BANKSEL PORTD
    CLRF    PORTD, 1
    ; Line 2 cmd
    MOVLW   LINE_2
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    
; End of data entry
    
    ; Set up LFSR0
    LFSR    0, UEV_0			; Point LFSR0 to first User
    BANKSEL PORTC			; Entered Value Position
    MOVLW   0xFF
    MOVWF   PORTC, 1
    
    MOVLB   0x09
    MOVLW   0x04
    MOVWF   COUNTR, 1
    
HERE2:    NOP
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    CHECK_B_PRESS
    GOTO    HERE2

DELAY_MSEC:
    MOVLB   0x09
    MOVLW   0x01
    MOVWF   R2,	1
L_1:				    ; MAIN loop in the subroutine 
    MOVLW   0xC7		    ; to generate a delay of R2 msecs
    MOVWF   R1
L_2:				    ; inner loop generates a delay of 1 msecs
    NOP
    NOP
    DECF R1, F
    BNZ L_2	
    DECF R2, F
    BNZ L_1
    
    RETURN			    ; End DELAY_MSEC
    
DELAY_20_MSEC:
    MOVLB   0x09
    MOVLW   0x14		    ; 20 Msec
    MOVWF   R2,	1
LOOP_1:				    ; MAIN loop in the subroutine
    MOVLW   0xC7		    ; to generate a delay of R2 msecs
    MOVWF   R1
LOOP_2:				    ; inner loop generates a delay of 1 msecs
    NOP
    NOP
    DECF R1, F
    BNZ LOOP_2	
    DECF R2, F
    BNZ LOOP_1
    
    RETURN			    ; End DELAY_20_MSEC

DELAY_1_SEC:
    MOVLB   0x09
    MOVLW   0x32
    MOVWF   DELAY_COUNT, 1
IN_LOOP:
    CALL    DELAY_20_MSEC
    DECF    DELAY_COUNT, 1	    ; Loop 50 times
    BNZ	    IN_LOOP
    
    RETURN
    
WRITE_CHAR:

    MOVLB  0x09
    MOVF   CHAR_REG, 0, 1
    
    BANKSEL PORTD
    CLRF    PORTD
    NOP
    
    MOVWF   PORTD, 1
    
    BANKSEL PORTB
    BSF	    PORTB, LCD_RS, 1	    ; Data entry mode
    
    ; Toggle Enable Pin
    CALL    PULSE_E
    
    ; Clear PORTD before returning
    BANKSEL PORTD
    CLRF    PORTD, 1
    NOP
    
    ; Re-init the BSR
    MOVLB   0x09
    
    RETURN			    ; End WRITE_CHAR
    
PULSE_E:
    
    ; Toggle Enable Pin
    BANKSEL PORTB
    BSF	    PORTB, LCD_EN	    ; Set E hi
    NOP
    NOP
    NOP
    BCF	    PORTB, LCD_EN	    ; Set E lo
    CALL    DELAY_MSEC
    
    RETURN			    ; End PULSE_E

CHECK_B_PRESS:
    
    BANKSEL PORTC
    MOVLW   COL_0		    ; Select Column 0
    MOVWF   PORTC, 1  
    CALL    ROW_CHECK

    BANKSEL PORTC 
    MOVLW   COL_1		    ; Select Column 1
    MOVWF   PORTC, 1  
    CALL    ROW_CHECK
    
    BANKSEL PORTC
    MOVLW   COL_2		    ; Select Column 2
    MOVWF   PORTC, 1   
    CALL    ROW_CHECK
    
    BANKSEL PORTC
    MOVLW   COL_3		    ; Select Column 0
    MOVWF   PORTC, 1 
    CALL    ROW_CHECK
    
SKIP_CBP:
    BANKSEL PORTC
    MOVLW   0xFF
    MOVWF   PORTC, 1 
    RETURN			    ; End CHECK_B_PRESS
    
ROW_CHECK:
    ; Check each row position
    BANKSEL PORTC
    MOVF    PORTC, 0, 1
    MOVWF   INDF0, 0
    ANDLW   0xF0		    ; ignore bits 3:0
    XORLW   0xF0		    ; invert bits 7:4
    BNZ	    INTERP_B
    RETURN			    ; End ROW_CHECK
    
INTERP_B:			    ; Interpret button presses
    MOVF    INDF0, 0, 0
    MOVWF   POSTINC0
    
    MOVLB   0x09
    
    ; Write a '*' to the LCD
    MOVLW   ASTRX
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    CALL    DELAY_MSEC
    
    MOVLB   0x09
    DECF    COUNTR, 1, 1
    BZ	    CHECK_CODE
    
    GOTO    SKIP_CBP		    ; Skip the rest of the columns
    
CHECK_CODE:
    MOVLB   0x09
    MOVLW   ANS_0
    CPFSEQ  0x90, 1
    GOTO    FAIL_MSG
    
    MOVLW   ANS_1
    CPFSEQ  0x91, 1
    GOTO    FAIL_MSG
    
    MOVLW   ANS_2
    CPFSEQ  0x92, 1
    GOTO    FAIL_MSG
    
    MOVLW   ANS_3
    CPFSEQ  0x93, 1
    GOTO    FAIL_MSG
    
    GOTO SUCCESS_MSG		    ; All the same - SUCCESS!
    
FAIL_MSG:
    ; Command mode
    BANKSEL PORTB
    CLRF    PORTB, 1
    
    BANKSEL PORTD

    ; Clear display
    CLRF    PORTD, 1		
    MOVLW   CLR_DSP
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    
    ; Send Data Character "T"
    MOVLB   0x09
    MOVLW   CAP_T
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "r"
    MOVLB   0x09
    MOVLW   LOW_R
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "y"
    MOVLB   0x09
    MOVLW   LOW_Y
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
   
    ; Space
    MOVLB   0x09
    MOVLW   C_SPACE
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "a"
    MOVLB   0x09
    MOVLW   LOW_A
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "g"
    MOVLB   0x09
    MOVLW   LOW_G
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
     ; Send Data Character "a"
    MOVLB   0x09
    MOVLW   LOW_A
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "i"
    MOVLB   0x09
    MOVLW   LOW_I
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "n"
    MOVLB   0x09
    MOVLW   LOW_N
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; TODO - fix this
    CALL    DELAY_1_SEC
    CALL    DELAY_1_SEC
    
    GOTO    HERE1
    
SUCCESS_MSG:
    ; Command mode
    BANKSEL PORTB
    CLRF    PORTB, 1
    
    BANKSEL PORTD

    ; Clear display
    CLRF    PORTD, 1		
    MOVLW   CLR_DSP
    MOVWF   PORTD, 1
    ; Pulse E
    CALL    PULSE_E
    CALL    DELAY_MSEC
    CALL    DELAY_MSEC
    
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    CALL    DELAY_20_MSEC
    
    ; Send Data Character "C"
    MOVLB   0x09
    MOVLW   CAP_C
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "o"
    MOVLB   0x09
    MOVLW   LOW_O
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "r"
    MOVLB   0x09
    MOVLW   LOW_R
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
   
    ; Send Data Character "r"
    MOVLB   0x09
    MOVLW   LOW_R
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "e"
    MOVLB   0x09
    MOVLW   LOW_E
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    ; Send Data Character "c"
    MOVLB   0x09
    MOVLW   LOW_C
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
     ; Send Data Character "t"
    MOVLB   0x09
    MOVLW   LOW_T
    MOVWF   CHAR_REG, 1
    CALL    WRITE_CHAR
    
    GOTO    INF_LOOP
    
INF_LOOP:
    GOTO    INF_LOOP
    
END resetVec
    