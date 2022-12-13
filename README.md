# Micros_Final_Project
* Final Project for ENR436 Microprocessors 
* Written in assembly for the PIC18F57Q43
* Code formatted for MPLAB X IDE

## Overview
### Goal
The goal for this project was to create a "safe" interface.
### Requirements
* The device shall accept user-input via a push-button keypad.
* The device shall display a visual response, via the LCD, to keypad button presses.
* The device shall compare a user-entered passcode against a stored passcode.
* The device shall not unlock when the user enters an incorrect passcode.
* A passcode shall only unlock the device if all characters match the characters of the stored passcode.
* A passcode shall only unlock the device if the order of user-entered characters match the order of the stored passcode characters.
* The length of the passcode should be at least 4 characters.
* The length of the passcode should not exceed 16 characters.
* The device shall check the passcode after the number of user-entered values matches the length of the passcode.
### Procedure
* The device prompts the user to enter a 4-digit passcode, using a push-button keypad; the LCD displays "Enter passcode:".
* The device responds to a button press by displaying a \'\*\' character on the device's LCD. 
* After 4 digits are entered, the device compares the entered values to the correct passcode. 
* Incorrect entries result in a "Try again" message, lasting 2 seconds, then returns to the user-entry mode. 
* The correct passcode displays "Correct" on the LCD; the device enters an infinite loop.

## Materials
* PIC18F57Q43 MCU
* Dragon 12 Light Board
* 16x2 LCD (Dragon 12 Light in 4-bit mode or external in 8-bit mode)
* Solderless breadboard or customized PCB
* Potentiometer or variable resistor for LCD brightness control (only if using external LCD)
* 10 1K&Omega; pull-down resistors (external LCD only)
  * 8 data bits
  * 2 control bits (R/S, E)
