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
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74LS191 U9
U 1 1 5ACF3420
P 3000 2900
F 0 "U9" H 3000 2900 50  0000 C CNN
F 1 "74LS191" H 3050 2700 50  0000 C CNN
F 2 "" H 3000 2900 50  0001 C CNN
F 3 "" H 3000 2900 50  0001 C CNN
	1    3000 2900
	1    0    0    -1  
$EndComp
$Comp
L 74LS191 U10
U 1 1 5ACF346D
P 4900 2900
F 0 "U10" H 4900 2900 50  0000 C CNN
F 1 "74LS191" H 4950 2700 50  0000 C CNN
F 2 "" H 4900 2900 50  0001 C CNN
F 3 "" H 4900 2900 50  0001 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
$Comp
L 74LS191 U11
U 1 1 5ACF34C6
P 6800 2900
F 0 "U11" H 6800 2900 50  0000 C CNN
F 1 "74LS191" H 6850 2700 50  0000 C CNN
F 2 "" H 6800 2900 50  0001 C CNN
F 3 "" H 6800 2900 50  0001 C CNN
	1    6800 2900
	1    0    0    -1  
$EndComp
$Comp
L 74LS191 U12
U 1 1 5ACF34F9
P 8600 2900
F 0 "U12" H 8600 2900 50  0000 C CNN
F 1 "74LS191" H 8650 2700 50  0000 C CNN
F 2 "" H 8600 2900 50  0001 C CNN
F 3 "" H 8600 2900 50  0001 C CNN
	1    8600 2900
	1    0    0    -1  
$EndComp
Text HLabel 1200 750  0    60   Input ~ 0
CLOCK
Text HLabel 1200 1150 0    60   Input ~ 0
PC_X-IN
Text HLabel 1200 1550 0    60   Input ~ 0
PC_Y-IN
Text HLabel 1200 1950 0    60   Input ~ 0
PC_INC
Text HLabel 1200 2350 0    60   Input ~ 0
PC_DEC
NoConn ~ 1400 750 
NoConn ~ 1400 1150
NoConn ~ 1400 1550
NoConn ~ 1400 1950
NoConn ~ 1400 2350
Wire Wire Line
	1400 2350 1200 2350
Wire Wire Line
	1400 1950 1200 1950
Wire Wire Line
	1400 1550 1200 1550
Wire Wire Line
	1400 1150 1200 1150
Wire Wire Line
	1400 750  1200 750 
Text HLabel 2200 750  0    60   BiDi ~ 0
BUS_PC-X
Text HLabel 2200 1150 0    60   BiDi ~ 0
BUS_PC-X
Text HLabel 2200 1550 0    60   Output ~ 0
BUS_PC-MAR
NoConn ~ 2400 750 
NoConn ~ 2400 1150
NoConn ~ 2400 1550
Wire Bus Line
	2400 750  2200 750 
Wire Bus Line
	2400 1150 2200 1150
Wire Bus Line
	2400 1550 2200 1550
$EndSCHEMATC
