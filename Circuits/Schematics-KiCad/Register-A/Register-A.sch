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
LIBS:TTL-Computer-Components
LIBS:TTL-Computer-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 14
Title "A Register"
Date ""
Rev ""
Comp "Ruud van Falier"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6000 2650 0    60   Input ~ 0
/A_OUT
$Comp
L 74LS377 U28
U 1 1 5AECCA05
P 2750 4150
F 0 "U28" H 2750 4150 50  0000 C CNN
F 1 "74LS377" H 2850 3750 50  0000 C CNN
F 2 "" H 2750 4150 50  0001 C CNN
F 3 "" H 2750 4150 50  0001 C CNN
	1    2750 4150
	1    0    0    -1  
$EndComp
Text HLabel 1550 4850 0    60   Input ~ 0
CLOCK
$Comp
L 74LS245 U29
U 1 1 5AD25DD1
P 6800 1950
F 0 "U29" H 6900 2525 50  0000 L BNN
F 1 "74LS245" H 6850 1375 50  0000 L TNN
F 2 "" H 6800 1950 50  0001 C CNN
F 3 "" H 6800 1950 50  0001 C CNN
	1    6800 1950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR029
U 1 1 5AF5F7CA
P 6100 2350
F 0 "#PWR029" H 6100 2200 50  0001 C CNN
F 1 "+5V" H 6100 2490 50  0000 C CNN
F 2 "" H 6100 2350 50  0001 C CNN
F 3 "" H 6100 2350 50  0001 C CNN
	1    6100 2350
	0    -1   -1   0   
$EndComp
Text HLabel 8650 1250 0    60   BiDi ~ 0
BUS_DATA[0..7]
Entry Wire Line
	8700 1350 8600 1450
Entry Wire Line
	8700 1500 8600 1600
Entry Wire Line
	8700 1650 8600 1750
Entry Wire Line
	8700 1800 8600 1900
Entry Wire Line
	8700 1950 8600 2050
Entry Wire Line
	8700 2100 8600 2200
Entry Wire Line
	8700 2250 8600 2350
Entry Wire Line
	8700 2400 8600 2500
Text Label 8550 1450 2    60   ~ 0
BUS_DATA0
Text Label 8550 1600 2    60   ~ 0
BUS_DATA1
Text Label 8550 1750 2    60   ~ 0
BUS_DATA2
Text Label 8550 1900 2    60   ~ 0
BUS_DATA3
Text Label 8550 2050 2    60   ~ 0
BUS_DATA4
Text Label 8550 2200 2    60   ~ 0
BUS_DATA5
Text Label 8550 2350 2    60   ~ 0
BUS_DATA6
Text Label 8550 2500 2    60   ~ 0
BUS_DATA7
Text Notes 7800 1100 0    60   ~ 12
Output to DATA bus
Text GLabel 3850 3600 2    60   Input ~ 0
A_OUTPUT0
Text GLabel 3850 3750 2    60   Input ~ 0
A_OUTPUT1
Text GLabel 3850 3900 2    60   Input ~ 0
A_OUTPUT2
Text GLabel 3850 4050 2    60   Input ~ 0
A_OUTPUT3
Text GLabel 3850 4200 2    60   Input ~ 0
A_OUTPUT4
Text GLabel 3850 4350 2    60   Input ~ 0
A_OUTPUT5
Text GLabel 3850 4500 2    60   Input ~ 0
A_OUTPUT6
Text GLabel 3850 4650 2    60   Input ~ 0
A_OUTPUT7
Text GLabel 5500 1450 0    60   Input ~ 0
A_OUTPUT0
Text GLabel 5500 1600 0    60   Input ~ 0
A_OUTPUT1
Text GLabel 5500 1750 0    60   Input ~ 0
A_OUTPUT2
Text GLabel 5500 1900 0    60   Input ~ 0
A_OUTPUT3
Text GLabel 5500 2050 0    60   Input ~ 0
A_OUTPUT4
Text GLabel 5500 2200 0    60   Input ~ 0
A_OUTPUT5
Text GLabel 5500 2350 0    60   Input ~ 0
A_OUTPUT6
Text GLabel 5500 2500 0    60   Input ~ 0
A_OUTPUT7
Text GLabel 1550 3650 0    60   Input ~ 0
A_INPUT0
Text GLabel 1550 3800 0    60   Input ~ 0
A_INPUT1
Text GLabel 1550 3950 0    60   Input ~ 0
A_INPUT2
Text GLabel 1550 4100 0    60   Input ~ 0
A_INPUT3
Text GLabel 1550 4250 0    60   Input ~ 0
A_INPUT4
Text GLabel 1550 4400 0    60   Input ~ 0
A_INPUT5
Text GLabel 1550 4550 0    60   Input ~ 0
A_INPUT6
Text GLabel 1550 4700 0    60   Input ~ 0
A_INPUT7
Text HLabel 1000 1250 2    60   BiDi ~ 0
BUS_DATA[0..7]
Entry Wire Line
	950  1350 1050 1450
Entry Wire Line
	950  1500 1050 1600
Entry Wire Line
	950  1650 1050 1750
Entry Wire Line
	950  1800 1050 1900
Entry Wire Line
	950  1950 1050 2050
Entry Wire Line
	950  2100 1050 2200
Entry Wire Line
	950  2250 1050 2350
Entry Wire Line
	950  2400 1050 2500
Text Label 1100 1450 0    60   ~ 0
BUS_DATA0
Text Label 1100 1600 0    60   ~ 0
BUS_DATA1
Text Label 1100 1750 0    60   ~ 0
BUS_DATA2
Text Label 1100 1900 0    60   ~ 0
BUS_DATA3
Text Label 1100 2050 0    60   ~ 0
BUS_DATA4
Text Label 1100 2200 0    60   ~ 0
BUS_DATA5
Text Label 1100 2350 0    60   ~ 0
BUS_DATA6
Text Label 1100 2500 0    60   ~ 0
BUS_DATA7
Text Notes 1900 1100 2    60   ~ 12
Input from DATA bus
Text GLabel 1850 1450 2    60   Input ~ 0
A_INPUT0
Text GLabel 1850 1600 2    60   Input ~ 0
A_INPUT1
Text GLabel 1850 1750 2    60   Input ~ 0
A_INPUT2
Text GLabel 1850 1900 2    60   Input ~ 0
A_INPUT3
Text GLabel 1850 2050 2    60   Input ~ 0
A_INPUT4
Text GLabel 1850 2200 2    60   Input ~ 0
A_INPUT5
Text GLabel 1850 2350 2    60   Input ~ 0
A_INPUT6
Text GLabel 1850 2500 2    60   Input ~ 0
A_INPUT7
$Comp
L LED D61
U 1 1 5AD310E9
P 5650 3600
F 0 "D61" H 5650 3700 50  0000 C CNN
F 1 "LED" H 5650 3500 50  0000 C CNN
F 2 "" H 5650 3600 50  0001 C CNN
F 3 "" H 5650 3600 50  0001 C CNN
	1    5650 3600
	1    0    0    -1  
$EndComp
$Comp
L R R71
U 1 1 5AF5F7CB
P 5250 3600
F 0 "R71" V 5330 3600 50  0000 C CNN
F 1 "330" V 5250 3600 50  0000 C CNN
F 2 "" V 5180 3600 50  0001 C CNN
F 3 "" H 5250 3600 50  0001 C CNN
	1    5250 3600
	0    -1   -1   0   
$EndComp
$Comp
L LED D62
U 1 1 5AF5F7CC
P 5650 3950
F 0 "D62" H 5650 4050 50  0000 C CNN
F 1 "LED" H 5650 3850 50  0000 C CNN
F 2 "" H 5650 3950 50  0001 C CNN
F 3 "" H 5650 3950 50  0001 C CNN
	1    5650 3950
	1    0    0    -1  
$EndComp
$Comp
L R R72
U 1 1 5AF5F7CD
P 5250 3950
F 0 "R72" V 5330 3950 50  0000 C CNN
F 1 "330" V 5250 3950 50  0000 C CNN
F 2 "" V 5180 3950 50  0001 C CNN
F 3 "" H 5250 3950 50  0001 C CNN
	1    5250 3950
	0    -1   -1   0   
$EndComp
$Comp
L LED D63
U 1 1 5AECCA18
P 5650 4300
F 0 "D63" H 5650 4400 50  0000 C CNN
F 1 "LED" H 5650 4200 50  0000 C CNN
F 2 "" H 5650 4300 50  0001 C CNN
F 3 "" H 5650 4300 50  0001 C CNN
	1    5650 4300
	1    0    0    -1  
$EndComp
$Comp
L R R73
U 1 1 5AF5F7CF
P 5250 4300
F 0 "R73" V 5330 4300 50  0000 C CNN
F 1 "330" V 5250 4300 50  0000 C CNN
F 2 "" V 5180 4300 50  0001 C CNN
F 3 "" H 5250 4300 50  0001 C CNN
	1    5250 4300
	0    -1   -1   0   
$EndComp
$Comp
L LED D64
U 1 1 5AD3111F
P 5650 4650
F 0 "D64" H 5650 4750 50  0000 C CNN
F 1 "LED" H 5650 4550 50  0000 C CNN
F 2 "" H 5650 4650 50  0001 C CNN
F 3 "" H 5650 4650 50  0001 C CNN
	1    5650 4650
	1    0    0    -1  
$EndComp
$Comp
L R R74
U 1 1 5AECCA21
P 5250 4650
F 0 "R74" V 5330 4650 50  0000 C CNN
F 1 "330" V 5250 4650 50  0000 C CNN
F 2 "" V 5180 4650 50  0001 C CNN
F 3 "" H 5250 4650 50  0001 C CNN
	1    5250 4650
	0    -1   -1   0   
$EndComp
$Comp
L LED D65
U 1 1 5AF5F7D1
P 5650 5000
F 0 "D65" H 5650 5100 50  0000 C CNN
F 1 "LED" H 5650 4900 50  0000 C CNN
F 2 "" H 5650 5000 50  0001 C CNN
F 3 "" H 5650 5000 50  0001 C CNN
	1    5650 5000
	1    0    0    -1  
$EndComp
$Comp
L R R75
U 1 1 5AF5F7D2
P 5250 5000
F 0 "R75" V 5330 5000 50  0000 C CNN
F 1 "330" V 5250 5000 50  0000 C CNN
F 2 "" V 5180 5000 50  0001 C CNN
F 3 "" H 5250 5000 50  0001 C CNN
	1    5250 5000
	0    -1   -1   0   
$EndComp
$Comp
L LED D66
U 1 1 5AD31143
P 5650 5350
F 0 "D66" H 5650 5450 50  0000 C CNN
F 1 "LED" H 5650 5250 50  0000 C CNN
F 2 "" H 5650 5350 50  0001 C CNN
F 3 "" H 5650 5350 50  0001 C CNN
	1    5650 5350
	1    0    0    -1  
$EndComp
$Comp
L R R76
U 1 1 5AECCA2B
P 5250 5350
F 0 "R76" V 5330 5350 50  0000 C CNN
F 1 "330" V 5250 5350 50  0000 C CNN
F 2 "" V 5180 5350 50  0001 C CNN
F 3 "" H 5250 5350 50  0001 C CNN
	1    5250 5350
	0    -1   -1   0   
$EndComp
$Comp
L LED D67
U 1 1 5AECCA2F
P 5650 5700
F 0 "D67" H 5650 5800 50  0000 C CNN
F 1 "LED" H 5650 5600 50  0000 C CNN
F 2 "" H 5650 5700 50  0001 C CNN
F 3 "" H 5650 5700 50  0001 C CNN
	1    5650 5700
	1    0    0    -1  
$EndComp
$Comp
L R R77
U 1 1 5AF5F7D5
P 5250 5700
F 0 "R77" V 5330 5700 50  0000 C CNN
F 1 "330" V 5250 5700 50  0000 C CNN
F 2 "" V 5180 5700 50  0001 C CNN
F 3 "" H 5250 5700 50  0001 C CNN
	1    5250 5700
	0    -1   -1   0   
$EndComp
$Comp
L LED D68
U 1 1 5AF5F7D6
P 5650 6050
F 0 "D68" H 5650 6150 50  0000 C CNN
F 1 "LED" H 5650 5950 50  0000 C CNN
F 2 "" H 5650 6050 50  0001 C CNN
F 3 "" H 5650 6050 50  0001 C CNN
	1    5650 6050
	1    0    0    -1  
$EndComp
$Comp
L R R78
U 1 1 5AF5F7D7
P 5250 6050
F 0 "R78" V 5330 6050 50  0000 C CNN
F 1 "330" V 5250 6050 50  0000 C CNN
F 2 "" V 5180 6050 50  0001 C CNN
F 3 "" H 5250 6050 50  0001 C CNN
	1    5250 6050
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR030
U 1 1 5AECCA3B
P 5050 6250
F 0 "#PWR030" H 5050 6000 50  0001 C CNN
F 1 "GND" H 5050 6100 50  0000 C CNN
F 2 "" H 5050 6250 50  0001 C CNN
F 3 "" H 5050 6250 50  0001 C CNN
	1    5050 6250
	1    0    0    -1  
$EndComp
Text GLabel 5900 3600 2    60   Input ~ 0
A_OUTPUT0
Text GLabel 5900 3950 2    60   Input ~ 0
A_OUTPUT1
Text GLabel 5900 4300 2    60   Input ~ 0
A_OUTPUT2
Text GLabel 5900 4650 2    60   Input ~ 0
A_OUTPUT3
Text GLabel 5900 5000 2    60   Input ~ 0
A_OUTPUT4
Text GLabel 5900 5350 2    60   Input ~ 0
A_OUTPUT5
Text GLabel 5900 5700 2    60   Input ~ 0
A_OUTPUT6
Text GLabel 5900 6050 2    60   Input ~ 0
A_OUTPUT7
Wire Wire Line
	1950 4550 2050 4550
Wire Wire Line
	6100 2350 6100 2350
Wire Wire Line
	6100 2450 6050 2450
Wire Wire Line
	6050 2450 6050 2650
Wire Wire Line
	6050 2650 6000 2650
Wire Bus Line
	8650 1250 8700 1250
Wire Bus Line
	8700 1250 8700 2450
Wire Wire Line
	8600 1600 7850 1600
Wire Wire Line
	8600 1750 7800 1750
Wire Wire Line
	8600 1900 7750 1900
Wire Wire Line
	8600 2050 7700 2050
Wire Wire Line
	8600 2200 7650 2200
Wire Wire Line
	8600 2350 7600 2350
Wire Wire Line
	8600 2500 7550 2500
Wire Wire Line
	7500 1450 8600 1450
Wire Wire Line
	7500 1550 7850 1550
Wire Wire Line
	7850 1550 7850 1600
Wire Wire Line
	7500 1650 7800 1650
Wire Wire Line
	7800 1650 7800 1750
Wire Wire Line
	7500 1750 7750 1750
Wire Wire Line
	7750 1750 7750 1900
Wire Wire Line
	7500 1850 7700 1850
Wire Wire Line
	7700 1850 7700 2050
Wire Wire Line
	7500 1950 7650 1950
Wire Wire Line
	7650 1950 7650 2200
Wire Wire Line
	7500 2050 7600 2050
Wire Wire Line
	7600 2050 7600 2350
Wire Wire Line
	7500 2150 7550 2150
Wire Wire Line
	7550 2150 7550 2500
Wire Wire Line
	3450 3600 3850 3600
Wire Wire Line
	3450 3700 3800 3700
Wire Wire Line
	3800 3700 3800 3750
Wire Wire Line
	3800 3750 3850 3750
Wire Wire Line
	3450 3800 3750 3800
Wire Wire Line
	3750 3800 3750 3900
Wire Wire Line
	3750 3900 3850 3900
Wire Wire Line
	3450 3900 3700 3900
Wire Wire Line
	3700 3900 3700 4050
Wire Wire Line
	3700 4050 3850 4050
Wire Wire Line
	3450 4000 3650 4000
Wire Wire Line
	3650 4000 3650 4200
Wire Wire Line
	3650 4200 3850 4200
Wire Wire Line
	3450 4100 3600 4100
Wire Wire Line
	3600 4100 3600 4350
Wire Wire Line
	3600 4350 3850 4350
Wire Wire Line
	3450 4200 3550 4200
Wire Wire Line
	3550 4200 3550 4500
Wire Wire Line
	3550 4500 3850 4500
Wire Wire Line
	3450 4300 3500 4300
Wire Wire Line
	3500 4300 3500 4650
Wire Wire Line
	3500 4650 3850 4650
Wire Wire Line
	5500 1450 6100 1450
Wire Wire Line
	5550 1550 6100 1550
Wire Wire Line
	5550 1550 5550 1600
Wire Wire Line
	5550 1600 5500 1600
Wire Wire Line
	5600 1650 6100 1650
Wire Wire Line
	5600 1650 5600 1750
Wire Wire Line
	5600 1750 5500 1750
Wire Wire Line
	5650 1750 6100 1750
Wire Wire Line
	5650 1750 5650 1900
Wire Wire Line
	5650 1900 5500 1900
Wire Wire Line
	5700 1850 6100 1850
Wire Wire Line
	5700 1850 5700 2050
Wire Wire Line
	5700 2050 5500 2050
Wire Wire Line
	5750 1950 6100 1950
Wire Wire Line
	5750 1950 5750 2200
Wire Wire Line
	5750 2200 5500 2200
Wire Wire Line
	5800 2050 6100 2050
Wire Wire Line
	5800 2050 5800 2350
Wire Wire Line
	5800 2350 5500 2350
Wire Wire Line
	5850 2150 6100 2150
Wire Wire Line
	5850 2150 5850 2500
Wire Wire Line
	5850 2500 5500 2500
Wire Wire Line
	1550 3650 2050 3650
Wire Wire Line
	1600 3750 2050 3750
Wire Wire Line
	1600 3750 1600 3800
Wire Wire Line
	1600 3800 1550 3800
Wire Wire Line
	1650 3850 2050 3850
Wire Wire Line
	1650 3850 1650 3950
Wire Wire Line
	1650 3950 1550 3950
Wire Wire Line
	1700 3950 2050 3950
Wire Wire Line
	1700 3950 1700 4100
Wire Wire Line
	1700 4100 1550 4100
Wire Wire Line
	1750 4050 2050 4050
Wire Wire Line
	1750 4050 1750 4250
Wire Wire Line
	1750 4250 1550 4250
Wire Wire Line
	1800 4150 2050 4150
Wire Wire Line
	1800 4150 1800 4400
Wire Wire Line
	1800 4400 1550 4400
Wire Wire Line
	1850 4250 2050 4250
Wire Wire Line
	1850 4250 1850 4550
Wire Wire Line
	1850 4550 1550 4550
Wire Wire Line
	1900 4350 2050 4350
Wire Wire Line
	1900 4350 1900 4700
Wire Wire Line
	1900 4700 1550 4700
Wire Wire Line
	1950 4550 1950 4850
Wire Wire Line
	1950 4850 1550 4850
Wire Wire Line
	2050 4650 2000 4650
Wire Wire Line
	2000 4650 2000 5000
Wire Wire Line
	2000 5000 1550 5000
Wire Bus Line
	1000 1250 950  1250
Wire Bus Line
	950  1250 950  2450
Wire Wire Line
	1050 2500 1850 2500
Wire Wire Line
	1050 2350 1850 2350
Wire Wire Line
	1050 2200 1850 2200
Wire Wire Line
	1050 2050 1850 2050
Wire Wire Line
	1050 1900 1850 1900
Wire Wire Line
	1050 1750 1850 1750
Wire Wire Line
	1050 1600 1850 1600
Wire Wire Line
	1050 1450 1850 1450
Wire Wire Line
	5400 3600 5500 3600
Wire Wire Line
	5400 3950 5500 3950
Wire Wire Line
	5400 4300 5500 4300
Wire Wire Line
	5400 4650 5500 4650
Wire Wire Line
	5400 5000 5500 5000
Wire Wire Line
	5400 5350 5500 5350
Wire Wire Line
	5400 5700 5500 5700
Wire Wire Line
	5400 6050 5500 6050
Wire Wire Line
	5100 3600 5050 3600
Wire Wire Line
	5050 3950 5100 3950
Wire Wire Line
	5050 4300 5100 4300
Connection ~ 5050 3950
Wire Wire Line
	5050 4650 5100 4650
Connection ~ 5050 4300
Wire Wire Line
	5050 5000 5100 5000
Connection ~ 5050 4650
Wire Wire Line
	5050 5350 5100 5350
Connection ~ 5050 5000
Wire Wire Line
	5050 5700 5100 5700
Connection ~ 5050 5350
Wire Wire Line
	5050 6050 5100 6050
Connection ~ 5050 5700
Connection ~ 5050 6050
Wire Wire Line
	5800 3600 5900 3600
Wire Wire Line
	5900 3950 5800 3950
Wire Wire Line
	5800 4300 5900 4300
Wire Wire Line
	5900 4650 5800 4650
Wire Wire Line
	5800 5000 5900 5000
Wire Wire Line
	5900 5350 5800 5350
Wire Wire Line
	5800 5700 5900 5700
Wire Wire Line
	5900 6050 5800 6050
Wire Wire Line
	5050 3600 5050 6250
Text HLabel 1550 5000 0    60   Input ~ 0
/A_IN
$EndSCHEMATC
