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
L 74LS181 U21
U 1 1 5AD5D498
P 3800 2300
F 0 "U21" H 4060 3100 50  0000 C CNN
F 1 "74LS181" H 4090 1490 50  0000 C CNN
F 2 "" H 3800 2300 50  0001 C CNN
F 3 "" H 3800 2300 50  0001 C CNN
	1    3800 2300
	1    0    0    -1  
$EndComp
$Comp
L 74LS181 U22
U 1 1 5AD5D4CA
P 4250 4400
F 0 "U22" H 4510 5200 50  0000 C CNN
F 1 "74LS181" H 4540 3590 50  0000 C CNN
F 2 "" H 4250 4400 50  0001 C CNN
F 3 "" H 4250 4400 50  0001 C CNN
	1    4250 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2450 1900 2450
Wire Wire Line
	1900 2450 1900 4550
Wire Wire Line
	1900 4550 3550 4550
Wire Wire Line
	3100 2550 1800 2550
Wire Wire Line
	1800 2550 1800 4650
Wire Wire Line
	1800 4650 3550 4650
Wire Wire Line
	1700 2650 3100 2650
Wire Wire Line
	1700 2650 1700 4750
Wire Wire Line
	1700 4750 3550 4750
Wire Wire Line
	3100 2750 1600 2750
Wire Wire Line
	1600 2750 1600 4850
Wire Wire Line
	1600 4850 3550 4850
Wire Wire Line
	4500 2550 5800 2550
Wire Wire Line
	5800 2550 5800 5350
Wire Wire Line
	5800 5350 2650 5350
Wire Wire Line
	2650 5350 2650 5100
Wire Wire Line
	2650 5100 3550 5100
Wire Wire Line
	2300 2900 2350 2900
Wire Wire Line
	2350 2900 3100 2900
Wire Wire Line
	2350 5000 3550 5000
NoConn ~ 4500 2850
NoConn ~ 4500 2950
NoConn ~ 4950 4950
NoConn ~ 4950 5050
Text HLabel 3050 3000 0    60   Input ~ 0
ALU_C
Wire Wire Line
	3100 3000 3050 3000
Wire Wire Line
	2350 5000 2350 2900
Text HLabel 2300 2900 0    60   Input ~ 0
ALU_M
Connection ~ 2350 2900
Wire Bus Line
	3100 3500 3100 3600
Wire Bus Line
	3100 3600 3100 3700
Wire Bus Line
	3100 3700 3100 3800
Wire Bus Line
	3100 3800 3100 3900
Wire Bus Line
	3100 3900 3100 4000
Entry Wire Line
	3100 3600 3200 3700
Wire Bus Line
	3100 3500 3150 3500
Wire Wire Line
	3200 3700 3550 3700
Entry Wire Line
	3100 3700 3200 3800
Entry Wire Line
	3100 3800 3200 3900
Entry Wire Line
	3100 3900 3200 4000
Wire Wire Line
	3200 3800 3550 3800
Wire Wire Line
	3200 3900 3550 3900
Wire Wire Line
	3200 4000 3550 4000
Text HLabel 3150 3500 2    60   Input ~ 0
BUS_A-ALU
$EndSCHEMATC
