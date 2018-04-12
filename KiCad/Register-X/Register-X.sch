EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:TTL-Computer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1600 1250 0    60   BiDi ~ 0
BUS_PC-X
Wire Bus Line
	1600 1250 3650 1250
Text HLabel 1600 1600 0    60   BiDi ~ 0
BUS_DATA
Text HLabel 1600 1950 0    60   BiDi ~ 0
BUS_X-MAR
Wire Bus Line
	1600 1600 3650 1600
Wire Bus Line
	1600 1950 3650 1950
Text HLabel 1600 2300 0    60   Input ~ 0
CLOCK
Text HLabel 1600 2650 0    60   Input ~ 0
X_IN
Text HLabel 1600 3000 0    60   Input ~ 0
X_OUT
Text HLabel 1600 3350 0    60   Input ~ 0
X_PC-IN
NoConn ~ 3650 1250
NoConn ~ 3650 1600
NoConn ~ 3650 1950
NoConn ~ 1800 2300
NoConn ~ 1800 2650
NoConn ~ 1800 3000
NoConn ~ 1800 3350
Wire Wire Line
	1800 2300 1600 2300
Wire Wire Line
	1800 2650 1600 2650
Wire Wire Line
	1800 3000 1600 3000
Wire Wire Line
	1800 3350 1600 3350
$EndSCHEMATC
