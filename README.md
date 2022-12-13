# Micros_Final_Project
## Final Project for ENR436 Microprocessors. Written in assembly for the PIC18F57Q43.
Code formatted for MPLAB X IDE

### Overview
The goal for this project was to create a "safe" interface. The device prompts the user to enter a 4-digit passcode, using a push-button keypad; the LCD displays "Enter passcode:". The device responds to a button press by displaying a \'\*\' character on the device's LCD. After 4 digits are entered, the device compares the entered values to the correct passcode. Incorrect entries result in a "Try again" message, lasting 2 seconds, then returns to the user-entry mode. The correct passcode displays "Correct" on the LCD; the device then enters an infinite loop.

### Materials
* PIC18F57Q43 MCU
* Dragon 12 Light Board
* 16x2 LCD (Dragon 12 Light in 4-bit mode or external in 8-bit mode)
* Solderless breadboard or customized PCB
* Potentiometer or variable resistor for LCD brightness control (only if using external LCD)
* 10 1K&Omega pull-down resistors (external LCD only)
  * 8 data bits
  * 2 control bits
