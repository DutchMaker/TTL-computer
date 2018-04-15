EESchema Schematic File Version 2
LIBS:TTL-Computer-rescue
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
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 8700 1050 0    60   BiDi ~ 0
BUS_DATA[0..7]
Text HLabel 8700 1400 0    60   Output ~ 0
BUS_Y-MAR[0..7]
Wire Bus Line
	8700 1050 10750 1050
Wire Bus Line
	8700 1400 10750 1400
$Comp
L 74LS181 U?
U 1 1 5AD5D498
P 3000 2300
F 0 "U?" H 3260 3100 50  0000 C CNN
F 1 "74LS181" H 3290 1490 50  0000 C CNN
F 2 "" H 3000 2300 50  0001 C CNN
F 3 "" H 3000 2300 50  0001 C CNN
	1    3000 2300
	1    0    0    -1  
$EndComp
$Comp
L 74LS181 U?
U 1 1 5AD5D4CA
P 3000 4400
F 0 "U?" H 3260 5200 50  0000 C CNN
F 1 "74LS181" H 3290 3590 50  0000 C CNN
F 2 "" H 3000 4400 50  0001 C CNN
F 3 "" H 3000 4400 50  0001 C CNN
	1    3000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2450 1900 2450
Wire Wire Line
	1900 2450 1900 4550
Wire Wire Line
	1900 4550 2300 4550
Wire Wire Line
	2300 2550 1800 2550
Wire Wire Line
	1800 2550 1800 4650
Wire Wire Line
	1800 4650 2300 4650
Wire Wire Line
	1700 2650 2300 2650
Wire Wire Line
	1700 2650 1700 4750
Wire Wire Line
	1700 4750 2300 4750
Wire Wire Line
	2300 2750 1600 2750
Wire Wire Line
	1600 2750 1600 4850
Wire Wire Line
	1600 4850 2300 4850
Wire Wire Line
	3700 2550 4800 2550
Wire Wire Line
	4800 2550 4800 5350
Wire Wire Line
	4800 5350 2200 5350
Wire Wire Line
	2200 5350 2200 5100
Wire Wire Line
	2200 5100 2300 5100
$Comp
L GND #PWR?
U 1 1 5AD5DDB0
P 2100 2900
F 0 "#PWR?" H 2100 2650 50  0001 C CNN
F 1 "GND" H 2100 2750 50  0000 C CNN
F 2 "" H 2100 2900 50  0001 C CNN
F 3 "" H 2100 2900 50  0001 C CNN
	1    2100 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2900 2100 2900
$Comp
L GND #PWR?
U 1 1 5AD5DDEF
P 2050 5000
F 0 "#PWR?" H 2050 4750 50  0001 C CNN
F 1 "GND" H 2050 4850 50  0000 C CNN
F 2 "" H 2050 5000 50  0001 C CNN
F 3 "" H 2050 5000 50  0001 C CNN
	1    2050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5000 2300 5000
NoConn ~ 2300 3000
$EndSCHEMATC
