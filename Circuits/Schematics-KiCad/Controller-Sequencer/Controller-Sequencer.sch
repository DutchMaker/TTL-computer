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
LIBS:TTL-Computer-Components
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 14
Title "Controller & Sequencer"
Date ""
Rev ""
Comp "Ruud van Falier"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2700 1000 0    60   Input ~ 0
CTRL_Fc
Text HLabel 2700 1150 0    60   Input ~ 0
CTRL_Feq
Text HLabel 2700 1300 0    60   Input ~ 0
CTRL_Flt
Text HLabel 2700 1450 0    60   Input ~ 0
CTRL_Fgt
Text HLabel 2700 1600 0    60   Input ~ 0
CTRL_Fz
Text HLabel 2700 1900 0    60   Output ~ 0
CTRL_ALU_Cn
Text HLabel 2700 2050 0    60   Output ~ 0
CTRL_ALU_M
Text HLabel 2700 2200 0    60   Output ~ 0
CTRL_ALU_S0
Text HLabel 2700 2350 0    60   Output ~ 0
CTRL_ALU_S1
Text HLabel 2700 2500 0    60   Output ~ 0
CTRL_ALU_S2
Text HLabel 2700 2650 0    60   Output ~ 0
CTRL_ALU_S3
Text HLabel 2700 2800 0    60   Output ~ 0
CTRL_/ALU_OUT
Text HLabel 2700 2950 0    60   Output ~ 0
CTRL_/F_IN
Text HLabel 2700 3100 0    60   Output ~ 0
CTRL_/B_IN
Text HLabel 2700 3250 0    60   Output ~ 0
CTRL_/B_OUT
Text HLabel 2700 3400 0    60   Output ~ 0
CTRL_/A_IN
Text HLabel 2700 3550 0    60   Output ~ 0
CTRL_/A_OUT
Text HLabel 2700 3700 0    60   Output ~ 0
CTRL_/C_IN
Text HLabel 2700 3850 0    60   Output ~ 0
CTRL_/C_OUT
Text HLabel 2700 4000 0    60   Output ~ 0
CTRL_/C_PC-IN
Text HLabel 2700 4150 0    60   Output ~ 0
CTRL_/D_IN
Text HLabel 2700 4300 0    60   Output ~ 0
CTRL_/D_OUT
Text HLabel 2700 4450 0    60   Output ~ 0
CTRL_/D_PC-IN
Text HLabel 2700 4600 0    60   Output ~ 0
CTRL_/PC_D-IN
Text HLabel 2700 4750 0    60   Output ~ 0
CTRL_/PC_C-IN
Text HLabel 2700 4900 0    60   Output ~ 0
CTRL_PC_INC
Text HLabel 2700 5050 0    60   Output ~ 0
CTRL_PC_DEC
Text HLabel 2700 5200 0    60   Output ~ 0
CTRL_CLK_HLT
$Comp
L GND #PWR42
U 1 1 5AED67E0
P 2850 7050
F 0 "#PWR42" H 2850 6800 50  0001 C CNN
F 1 "GND" H 2850 6900 50  0000 C CNN
F 2 "" H 2850 7050 50  0001 C CNN
F 3 "" H 2850 7050 50  0001 C CNN
	1    2850 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR43
U 1 1 5AED6B09
P 3350 1600
F 0 "#PWR43" H 3350 1350 50  0001 C CNN
F 1 "GND" H 3350 1450 50  0000 C CNN
F 2 "" H 3350 1600 50  0001 C CNN
F 3 "" H 3350 1600 50  0001 C CNN
	1    3350 1600
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW8
U 1 1 5AED975A
P 3050 1000
F 0 "SW8" H 3100 1100 50  0000 L CNN
F 1 "SW_Push" H 3050 940 50  0000 C CNN
F 2 "" H 3050 1200 50  0001 C CNN
F 3 "" H 3050 1200 50  0001 C CNN
	1    3050 1000
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW9
U 1 1 5AED9786
P 3050 1150
F 0 "SW9" H 3100 1250 50  0000 L CNN
F 1 "SW_Push" H 3050 1090 50  0000 C CNN
F 2 "" H 3050 1350 50  0001 C CNN
F 3 "" H 3050 1350 50  0001 C CNN
	1    3050 1150
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW10
U 1 1 5AED979E
P 3050 1300
F 0 "SW10" H 3100 1400 50  0000 L CNN
F 1 "SW_Push" H 3050 1240 50  0000 C CNN
F 2 "" H 3050 1500 50  0001 C CNN
F 3 "" H 3050 1500 50  0001 C CNN
	1    3050 1300
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW11
U 1 1 5AED97BD
P 3050 1450
F 0 "SW11" H 3100 1550 50  0000 L CNN
F 1 "SW_Push" H 3050 1390 50  0000 C CNN
F 2 "" H 3050 1650 50  0001 C CNN
F 3 "" H 3050 1650 50  0001 C CNN
	1    3050 1450
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW12
U 1 1 5AED97DB
P 3050 1600
F 0 "SW12" H 3100 1700 50  0000 L CNN
F 1 "SW_Push" H 3050 1540 50  0000 C CNN
F 2 "" H 3050 1800 50  0001 C CNN
F 3 "" H 3050 1800 50  0001 C CNN
	1    3050 1600
	1    0    0    -1  
$EndComp
Text HLabel 3000 2800 2    60   Output ~ 0
CTRL_/ALU_IN
Text HLabel 2700 5350 0    60   Output ~ 0
CTRL_/RAM_IN
Text HLabel 2700 5500 0    60   Output ~ 0
CTRL_/MEM_OUT
Text HLabel 2700 800  0    60   Input ~ 0
CLOCK
$Comp
L SW_Push SW7
U 1 1 5AFC5CCD
P 3050 800
F 0 "SW7" H 3100 900 50  0000 L CNN
F 1 "SW_Push" H 3050 740 50  0000 C CNN
F 2 "" H 3050 1000 50  0001 C CNN
F 3 "" H 3050 1000 50  0001 C CNN
	1    3050 800 
	1    0    0    -1  
$EndComp
Text HLabel 2700 5650 0    60   Output ~ 0
CTRL_/IO_IN
Text HLabel 9150 1700 0    60   Input ~ 0
BUS_IO-CTRL[0..7]
Text Notes 7800 1550 0    60   ~ 12
Input from Instruction Op-Code Register
Wire Wire Line
	2850 1900 2850 7050
Wire Wire Line
	2850 1900 2700 1900
Wire Wire Line
	2700 2050 2850 2050
Connection ~ 2850 2050
Wire Wire Line
	2850 2200 2700 2200
Connection ~ 2850 2200
Wire Wire Line
	2700 2350 2850 2350
Connection ~ 2850 2350
Wire Wire Line
	2850 2500 2700 2500
Connection ~ 2850 2500
Wire Wire Line
	2700 2650 2850 2650
Connection ~ 2850 2650
Wire Wire Line
	2700 2800 3000 2800
Connection ~ 2850 2800
Wire Wire Line
	2700 2950 2850 2950
Connection ~ 2850 2950
Wire Wire Line
	2850 3100 2700 3100
Connection ~ 2850 3100
Wire Wire Line
	2700 3250 2850 3250
Connection ~ 2850 3250
Wire Wire Line
	2850 3400 2700 3400
Connection ~ 2850 3400
Wire Wire Line
	2700 3550 2850 3550
Connection ~ 2850 3550
Wire Wire Line
	2850 3700 2700 3700
Connection ~ 2850 3700
Wire Wire Line
	2700 3850 2850 3850
Connection ~ 2850 3850
Wire Wire Line
	2850 4000 2700 4000
Connection ~ 2850 4000
Wire Wire Line
	2700 4150 2850 4150
Connection ~ 2850 4150
Wire Wire Line
	2850 4300 2700 4300
Connection ~ 2850 4300
Wire Wire Line
	2700 4450 2850 4450
Connection ~ 2850 4450
Wire Wire Line
	2850 4600 2700 4600
Connection ~ 2850 4600
Wire Wire Line
	2700 4750 2850 4750
Connection ~ 2850 4750
Wire Wire Line
	2850 4900 2700 4900
Connection ~ 2850 4900
Wire Wire Line
	2700 5050 2850 5050
Connection ~ 2850 5050
Wire Wire Line
	2700 5200 2850 5200
Connection ~ 2850 5200
Wire Wire Line
	2700 1000 2850 1000
Wire Wire Line
	2850 1600 2700 1600
Wire Wire Line
	2700 1450 2850 1450
Connection ~ 2850 1450
Wire Wire Line
	2700 1300 2850 1300
Connection ~ 2850 1300
Wire Wire Line
	2700 1150 2850 1150
Connection ~ 2850 1150
Wire Wire Line
	3350 1600 3250 1600
Wire Wire Line
	3350 800  3350 1600
Wire Wire Line
	3350 1450 3250 1450
Wire Wire Line
	3350 1300 3250 1300
Connection ~ 3350 1450
Wire Wire Line
	3350 1150 3250 1150
Connection ~ 3350 1300
Wire Wire Line
	3350 1000 3250 1000
Connection ~ 3350 1150
Wire Wire Line
	2700 5350 2850 5350
Connection ~ 2850 5350
Wire Wire Line
	2850 5500 2700 5500
Connection ~ 2850 5500
Wire Wire Line
	2700 800  2850 800 
Wire Wire Line
	3250 800  3350 800 
Connection ~ 3350 1000
Wire Wire Line
	2700 5650 2850 5650
Connection ~ 2850 5650
Wire Bus Line
	9150 1700 9200 1700
Wire Bus Line
	9200 1700 9200 2900
NoConn ~ 9200 2900
Text HLabel 2700 5800 0    60   Output ~ 0
CTRL_STK_INC
Text HLabel 2700 5950 0    60   Output ~ 0
CTRL_STK_DEC
Wire Wire Line
	2700 5800 2850 5800
Connection ~ 2850 5800
Wire Wire Line
	2700 5950 2850 5950
Connection ~ 2850 5950
Text HLabel 2700 6100 0    60   Output ~ 0
CTRL_/MAR_C-IN
Text HLabel 2700 6250 0    60   Output ~ 0
CTRL_/MAR_D-IN
Text HLabel 2700 6400 0    60   Output ~ 0
CTRL_/MAR_PC-IN
Text HLabel 2700 6550 0    60   Output ~ 0
CTRL_/MAR_STK-IN
Wire Wire Line
	2700 6100 2850 6100
Connection ~ 2850 6100
Wire Wire Line
	2700 6250 2850 6250
Connection ~ 2850 6250
Wire Wire Line
	2700 6400 2850 6400
Connection ~ 2850 6400
Wire Wire Line
	2700 6550 2850 6550
Connection ~ 2850 6550
$Comp
L W27C512 U43
U 1 1 5B0FFD58
P 5250 1850
F 0 "U43" H 4950 2900 50  0000 C CNN
F 1 "W27C512" H 5250 1100 50  0000 C CNN
F 2 "" H 5250 1850 50  0001 C CNN
F 3 "" H 5250 1850 50  0001 C CNN
	1    5250 1850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
