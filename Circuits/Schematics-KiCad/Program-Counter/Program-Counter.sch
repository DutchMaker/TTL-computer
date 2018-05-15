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
Sheet 5 14
Title "Program Counter"
Date ""
Rev ""
Comp "Ruud van Falier"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74LS191-RESCUE-TTL-Computer U16
U 1 1 5ACF3420
P 3250 1550
F 0 "U16" H 3250 1550 50  0000 C CNN
F 1 "74LS191" H 3300 1350 50  0000 C CNN
F 2 "" H 3250 1550 50  0001 C CNN
F 3 "" H 3250 1550 50  0001 C CNN
F 4 "Bit 0-3" H 3250 1707 60  0000 C BNN "Text"
	1    3250 1550
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U17
U 1 1 5ACF346D
P 3250 2850
F 0 "U17" H 3250 2850 50  0000 C CNN
F 1 "74LS191" H 3300 2650 50  0000 C CNN
F 2 "" H 3250 2850 50  0001 C CNN
F 3 "" H 3250 2850 50  0001 C CNN
F 4 "Bit 4-7" H 3250 3007 60  0000 C BNN "Text"
	1    3250 2850
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U18
U 1 1 5ACF34C6
P 3250 4200
F 0 "U18" H 3250 4200 50  0000 C CNN
F 1 "74LS191" H 3300 4000 50  0000 C CNN
F 2 "" H 3250 4200 50  0001 C CNN
F 3 "" H 3250 4200 50  0001 C CNN
F 4 "Bit 8-11" H 3250 4357 60  0000 C BNN "Text"
	1    3250 4200
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U19
U 1 1 5ACF34F9
P 3250 5550
F 0 "U19" H 3250 5550 50  0000 C CNN
F 1 "74LS191" H 3300 5350 50  0000 C CNN
F 2 "" H 3250 5550 50  0001 C CNN
F 3 "" H 3250 5550 50  0001 C CNN
F 4 "Bit 12-15" H 3250 5707 60  0000 C BNN "Text"
	1    3250 5550
	1    0    0    -1  
$EndComp
Text HLabel 1500 2000 0    60   Input ~ 0
CLOCK
Text HLabel 1500 1600 0    60   Input ~ 0
/PC_C-IN
Text HLabel 1500 4250 0    60   Input ~ 0
/PC_D-IN
Text HLabel 1300 6450 0    60   Input ~ 0
PC_INC
Text HLabel 1300 7450 0    60   Input ~ 0
PC_DEC
Text HLabel 4900 950  0    60   Output ~ 0
BUS_PC-C_OUT[0..7]
Text HLabel 4900 3650 0    60   BiDi ~ 0
BUS_PC-D_OUT[0..7]
NoConn ~ 3950 5650
Text GLabel 1600 1800 0    60   Input ~ 0
PC-/UP_DOWN
Text GLabel 2850 6550 2    60   Output ~ 0
PC-/UP_DOWN
Entry Wire Line
	4850 1150 4950 1050
Entry Wire Line
	4850 1250 4950 1150
Entry Wire Line
	4850 1350 4950 1250
Entry Wire Line
	4850 1450 4950 1350
Entry Wire Line
	4850 2450 4950 2350
Entry Wire Line
	4850 2550 4950 2450
Entry Wire Line
	4850 2650 4950 2550
Entry Wire Line
	4850 2750 4950 2650
Entry Wire Line
	4850 3800 4950 3700
Entry Wire Line
	4850 3900 4950 3800
Entry Wire Line
	4850 4000 4950 3900
Entry Wire Line
	4850 4100 4950 4000
Entry Wire Line
	4850 5150 4950 5050
Entry Wire Line
	4850 5250 4950 5150
Entry Wire Line
	4850 5350 4950 5250
Entry Wire Line
	4850 5450 4950 5350
NoConn ~ 3950 1850
NoConn ~ 3950 3150
NoConn ~ 3950 4500
NoConn ~ 3950 5850
Wire Wire Line
	1750 1950 2550 1950
Wire Wire Line
	1750 1950 1750 5950
Wire Wire Line
	1750 3250 2550 3250
Wire Wire Line
	1750 4600 2550 4600
Connection ~ 1750 3250
Wire Wire Line
	1750 5950 2550 5950
Connection ~ 1750 4600
Wire Wire Line
	3950 1650 4350 1650
Wire Wire Line
	4350 1650 4350 2200
Wire Wire Line
	4350 2200 1950 2200
Wire Wire Line
	1950 2200 1950 3150
Wire Wire Line
	1950 3150 2550 3150
Wire Wire Line
	3950 2950 4050 2950
Wire Wire Line
	3950 4300 4350 4300
Wire Wire Line
	4350 4300 4350 4900
Wire Wire Line
	4350 4900 1950 4900
Wire Wire Line
	1950 4900 1950 5850
Wire Wire Line
	1950 5850 2550 5850
Wire Wire Line
	1750 1700 2550 1700
Wire Wire Line
	1850 1700 1850 5700
Wire Wire Line
	1850 3000 2550 3000
Wire Wire Line
	1850 4350 2550 4350
Connection ~ 1850 3000
Wire Wire Line
	1950 4500 2550 4500
Wire Wire Line
	1950 3500 1950 4500
Wire Wire Line
	1850 5700 2550 5700
Connection ~ 1850 4350
Connection ~ 1850 1700
Wire Bus Line
	4950 950  4950 2750
Wire Bus Line
	4950 3650 4950 5450
Wire Bus Line
	4900 950  4950 950 
Wire Bus Line
	4900 3650 4950 3650
Wire Wire Line
	850  5450 2550 5450
Wire Wire Line
	850  5350 2550 5350
Wire Wire Line
	850  5250 2550 5250
Wire Wire Line
	850  5150 2550 5150
Wire Wire Line
	1500 4250 2550 4250
Wire Wire Line
	850  4100 2550 4100
Wire Wire Line
	850  4000 2550 4000
Wire Wire Line
	850  3900 2550 3900
Wire Wire Line
	850  3800 2550 3800
Wire Wire Line
	2050 2900 2550 2900
Wire Wire Line
	850  2750 2550 2750
Wire Wire Line
	850  2650 2550 2650
Wire Wire Line
	850  2550 2550 2550
Wire Wire Line
	850  2450 2550 2450
Wire Wire Line
	1500 1600 2550 1600
Wire Wire Line
	850  1450 2550 1450
Wire Wire Line
	850  1350 2550 1350
Wire Wire Line
	850  1250 2550 1250
Wire Wire Line
	850  1150 2550 1150
Wire Wire Line
	3950 1150 6450 1150
Wire Wire Line
	3950 1250 6450 1250
Wire Wire Line
	3950 1350 6450 1350
Wire Wire Line
	3950 1450 6450 1450
Wire Wire Line
	3950 2450 6450 2450
Wire Wire Line
	3950 2550 6450 2550
Wire Wire Line
	3950 2650 6450 2650
Wire Wire Line
	3950 2750 6450 2750
Wire Wire Line
	3950 3800 6450 3800
Wire Wire Line
	3950 3900 6450 3900
Wire Wire Line
	3950 4000 6450 4000
Wire Wire Line
	3950 4100 6450 4100
Wire Wire Line
	3950 5150 6450 5150
Wire Wire Line
	3950 5250 6450 5250
Wire Wire Line
	3950 5350 6450 5350
Wire Wire Line
	3950 5450 6450 5450
Text Label 4050 1150 0    60   ~ 0
BUS_PC-C_OUT0
Text Label 4050 1250 0    60   ~ 0
BUS_PC-C_OUT1
Text Label 4050 1350 0    60   ~ 0
BUS_PC-C_OUT2
Text Label 4050 1450 0    60   ~ 0
BUS_PC-C_OUT3
Text Label 4050 2450 0    60   ~ 0
BUS_PC-C_OUT4
Text Label 4050 2550 0    60   ~ 0
BUS_PC-C_OUT5
Text Label 4050 2650 0    60   ~ 0
BUS_PC-C_OUT6
Text Label 4050 2750 0    60   ~ 0
BUS_PC-C_OUT7
Text Label 4050 3800 0    60   ~ 0
BUS_PC-D_OUT0
Text Label 4050 3900 0    60   ~ 0
BUS_PC-D_OUT1
Text Label 4050 4000 0    60   ~ 0
BUS_PC-D_OUT2
Text Label 4050 4100 0    60   ~ 0
BUS_PC-D_OUT3
Text Label 4050 5150 0    60   ~ 0
BUS_PC-D_OUT4
Text Label 4050 5250 0    60   ~ 0
BUS_PC-D_OUT5
Text Label 4050 5350 0    60   ~ 0
BUS_PC-D_OUT6
Text Label 4050 5450 0    60   ~ 0
BUS_PC-D_OUT7
Wire Bus Line
	750  950  750  2750
Wire Bus Line
	750  3650 750  5450
Text HLabel 800  950  2    60   Input ~ 0
BUS_PC-C_IN[0..7]
Wire Bus Line
	750  950  800  950 
Text HLabel 800  3650 2    60   Input ~ 0
BUS_PC-D_IN[0..7]
Wire Bus Line
	750  3650 800  3650
Entry Wire Line
	750  1050 850  1150
Entry Wire Line
	750  2350 850  2450
Entry Wire Line
	750  2450 850  2550
Entry Wire Line
	750  2550 850  2650
Entry Wire Line
	750  2650 850  2750
Entry Wire Line
	750  1150 850  1250
Entry Wire Line
	750  1250 850  1350
Entry Wire Line
	750  1350 850  1450
Entry Wire Line
	750  3700 850  3800
Entry Wire Line
	750  3800 850  3900
Entry Wire Line
	750  3900 850  4000
Entry Wire Line
	750  4000 850  4100
Entry Wire Line
	750  5050 850  5150
Entry Wire Line
	750  5150 850  5250
Entry Wire Line
	750  5250 850  5350
Entry Wire Line
	750  5350 850  5450
Text Label 850  1150 0    60   ~ 0
BUS_PC-C_IN0
Text Label 850  1250 0    60   ~ 0
BUS_PC-C_IN1
Text Label 850  1350 0    60   ~ 0
BUS_PC-C_IN2
Text Label 850  1450 0    60   ~ 0
BUS_PC-C_IN3
Text Label 850  2450 0    60   ~ 0
BUS_PC-C_IN4
Text Label 850  2550 0    60   ~ 0
BUS_PC-C_IN5
Text Label 850  2650 0    60   ~ 0
BUS_PC-C_IN6
Text Label 850  2750 0    60   ~ 0
BUS_PC-C_IN7
Text Label 850  3800 0    60   ~ 0
BUS_PC-D_IN0
Text Label 850  3900 0    60   ~ 0
BUS_PC-D_IN1
Text Label 850  4000 0    60   ~ 0
BUS_PC-D_IN2
Text Label 850  4100 0    60   ~ 0
BUS_PC-D_IN3
Text Label 850  5150 0    60   ~ 0
BUS_PC-D_IN4
Text Label 850  5250 0    60   ~ 0
BUS_PC-D_IN5
Text Label 850  5350 0    60   ~ 0
BUS_PC-D_IN6
Text Label 850  5450 0    60   ~ 0
BUS_PC-D_IN7
Wire Bus Line
	6500 950  6550 950 
Wire Bus Line
	6550 950  6550 5450
Entry Wire Line
	6450 1150 6550 1050
Entry Wire Line
	6450 1250 6550 1150
Entry Wire Line
	6450 1350 6550 1250
Entry Wire Line
	6450 1450 6550 1350
Entry Wire Line
	6450 2450 6550 2350
Entry Wire Line
	6450 2550 6550 2450
Entry Wire Line
	6450 2650 6550 2550
Entry Wire Line
	6450 2750 6550 2650
Entry Wire Line
	6450 3800 6550 3700
Entry Wire Line
	6450 3900 6550 3800
Entry Wire Line
	6450 4000 6550 3900
Entry Wire Line
	6450 4100 6550 4000
Entry Wire Line
	6450 5150 6550 5050
Entry Wire Line
	6450 5250 6550 5150
Entry Wire Line
	6450 5350 6550 5250
Entry Wire Line
	6450 5450 6550 5350
Connection ~ 4850 5450
Connection ~ 4850 5350
Connection ~ 4850 5250
Connection ~ 4850 5150
Connection ~ 4850 4100
Connection ~ 4850 4000
Connection ~ 4850 3900
Connection ~ 4850 3800
Connection ~ 4850 2750
Connection ~ 4850 2650
Connection ~ 4850 2550
Connection ~ 4850 2450
Connection ~ 4850 1450
Connection ~ 4850 1350
Connection ~ 4850 1250
Connection ~ 4850 1150
Text HLabel 6500 950  0    60   Output ~ 0
BUS_PC-MAR[0..15]
Text Label 6450 1150 2    60   ~ 0
BUS_PC-MAR0
Text Label 6450 1250 2    60   ~ 0
BUS_PC-MAR1
Text Label 6450 1350 2    60   ~ 0
BUS_PC-MAR2
Text Label 6450 1450 2    60   ~ 0
BUS_PC-MAR3
Text Label 6450 2450 2    60   ~ 0
BUS_PC-MAR4
Text Label 6450 2550 2    60   ~ 0
BUS_PC-MAR5
Text Label 6450 2650 2    60   ~ 0
BUS_PC-MAR6
Text Label 6450 2750 2    60   ~ 0
BUS_PC-MAR7
Text Label 6450 3800 2    60   ~ 0
BUS_PC-MAR8
Text Label 6450 3900 2    60   ~ 0
BUS_PC-MAR9
Text Label 6450 4000 2    60   ~ 0
BUS_PC-MAR10
Text Label 6450 4100 2    60   ~ 0
BUS_PC-MAR11
Text Label 6450 5150 2    60   ~ 0
BUS_PC-MAR12
Text Label 6450 5250 2    60   ~ 0
BUS_PC-MAR13
Text Label 6450 5350 2    60   ~ 0
BUS_PC-MAR14
Text Label 6450 5450 2    60   ~ 0
BUS_PC-MAR15
Wire Wire Line
	1750 1700 1750 1800
Wire Wire Line
	1750 1800 1600 1800
Wire Wire Line
	1500 2000 1750 2000
Connection ~ 1750 2000
Wire Wire Line
	2050 2900 2050 1600
Connection ~ 2050 1600
Wire Wire Line
	2550 5600 2050 5600
Wire Wire Line
	2050 5600 2050 4250
Connection ~ 2050 4250
Wire Wire Line
	2550 1850 2400 1850
Wire Wire Line
	2400 1850 2400 900 
$Comp
L 7402 U9
U 3 1 5AFD0505
P 2050 6550
F 0 "U9" H 2050 6600 50  0000 C CNN
F 1 "7402" H 2100 6500 50  0000 C CNN
F 2 "" H 2050 6550 50  0001 C CNN
F 3 "" H 2050 6550 50  0001 C CNN
	3    2050 6550
	1    0    0    -1  
$EndComp
$Comp
L 7402 U9
U 4 1 5AD1DD73
P 2050 7350
F 0 "U9" H 2050 7400 50  0000 C CNN
F 1 "7402" H 2100 7300 50  0000 C CNN
F 2 "" H 2050 7350 50  0001 C CNN
F 3 "" H 2050 7350 50  0001 C CNN
	4    2050 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 6550 2850 6550
Wire Wire Line
	1300 7000 1300 7250
Wire Wire Line
	1300 7250 1450 7250
Connection ~ 2750 6550
Wire Wire Line
	2750 7350 2750 7150
Wire Wire Line
	2750 7150 2500 7150
Wire Wire Line
	2500 7150 2500 6850
Wire Wire Line
	2500 6850 1300 6850
Wire Wire Line
	1300 6850 1300 6650
Wire Wire Line
	1300 6650 1450 6650
Wire Wire Line
	2750 6550 2750 7000
Wire Wire Line
	2750 7000 1300 7000
Wire Wire Line
	1300 6450 1450 6450
Wire Wire Line
	1300 7450 1450 7450
Text GLabel 2450 900  2    60   Input ~ 0
/PC-CLK_EN
Wire Wire Line
	2400 900  2450 900 
Wire Bus Line
	10800 650  10800 6150
Entry Wire Line
	10700 900  10800 800 
$Comp
L LED D21
U 1 1 5AFD0508
P 9800 900
F 0 "D21" H 9800 1000 50  0000 C CNN
F 1 "LED" H 9800 800 50  0000 C CNN
F 2 "" H 9800 900 50  0001 C CNN
F 3 "" H 9800 900 50  0001 C CNN
	1    9800 900 
	1    0    0    -1  
$EndComp
Text Label 10700 900  2    60   ~ 0
BUS_PC-MAR0
$Comp
L R R31
U 1 1 5AD2050C
P 9400 900
F 0 "R31" V 9480 900 50  0000 C CNN
F 1 "330" V 9400 900 50  0000 C CNN
F 2 "" V 9330 900 50  0001 C CNN
F 3 "" H 9400 900 50  0001 C CNN
	1    9400 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 900  9650 900 
Wire Wire Line
	9950 900  10700 900 
Entry Wire Line
	10700 1250 10800 1150
$Comp
L LED D22
U 1 1 5AFD050A
P 9800 1250
F 0 "D22" H 9800 1350 50  0000 C CNN
F 1 "LED" H 9800 1150 50  0000 C CNN
F 2 "" H 9800 1250 50  0001 C CNN
F 3 "" H 9800 1250 50  0001 C CNN
	1    9800 1250
	1    0    0    -1  
$EndComp
Text Label 10700 1250 2    60   ~ 0
BUS_PC-MAR1
$Comp
L R R32
U 1 1 5AD2074B
P 9400 1250
F 0 "R32" V 9480 1250 50  0000 C CNN
F 1 "330" V 9400 1250 50  0000 C CNN
F 2 "" V 9330 1250 50  0001 C CNN
F 3 "" H 9400 1250 50  0001 C CNN
	1    9400 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 1250 9650 1250
Wire Wire Line
	9950 1250 10700 1250
Entry Wire Line
	10700 1600 10800 1500
$Comp
L LED D23
U 1 1 5AFD050C
P 9800 1600
F 0 "D23" H 9800 1700 50  0000 C CNN
F 1 "LED" H 9800 1500 50  0000 C CNN
F 2 "" H 9800 1600 50  0001 C CNN
F 3 "" H 9800 1600 50  0001 C CNN
	1    9800 1600
	1    0    0    -1  
$EndComp
Text Label 10700 1600 2    60   ~ 0
BUS_PC-MAR2
$Comp
L R R33
U 1 1 5AFD050D
P 9400 1600
F 0 "R33" V 9480 1600 50  0000 C CNN
F 1 "330" V 9400 1600 50  0000 C CNN
F 2 "" V 9330 1600 50  0001 C CNN
F 3 "" H 9400 1600 50  0001 C CNN
	1    9400 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 1600 9650 1600
Wire Wire Line
	9950 1600 10700 1600
Entry Wire Line
	10700 1950 10800 1850
$Comp
L LED D24
U 1 1 5AFD050E
P 9800 1950
F 0 "D24" H 9800 2050 50  0000 C CNN
F 1 "LED" H 9800 1850 50  0000 C CNN
F 2 "" H 9800 1950 50  0001 C CNN
F 3 "" H 9800 1950 50  0001 C CNN
	1    9800 1950
	1    0    0    -1  
$EndComp
Text Label 10700 1950 2    60   ~ 0
BUS_PC-MAR3
$Comp
L R R34
U 1 1 5AD207E0
P 9400 1950
F 0 "R34" V 9480 1950 50  0000 C CNN
F 1 "330" V 9400 1950 50  0000 C CNN
F 2 "" V 9330 1950 50  0001 C CNN
F 3 "" H 9400 1950 50  0001 C CNN
	1    9400 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 1950 9650 1950
Wire Wire Line
	9950 1950 10700 1950
Entry Wire Line
	10700 2300 10800 2200
$Comp
L LED D25
U 1 1 5AD2095A
P 9800 2300
F 0 "D25" H 9800 2400 50  0000 C CNN
F 1 "LED" H 9800 2200 50  0000 C CNN
F 2 "" H 9800 2300 50  0001 C CNN
F 3 "" H 9800 2300 50  0001 C CNN
	1    9800 2300
	1    0    0    -1  
$EndComp
Text Label 10700 2300 2    60   ~ 0
BUS_PC-MAR4
$Comp
L R R35
U 1 1 5AD20961
P 9400 2300
F 0 "R35" V 9480 2300 50  0000 C CNN
F 1 "330" V 9400 2300 50  0000 C CNN
F 2 "" V 9330 2300 50  0001 C CNN
F 3 "" H 9400 2300 50  0001 C CNN
	1    9400 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 2300 9650 2300
Wire Wire Line
	9950 2300 10700 2300
Entry Wire Line
	10700 2650 10800 2550
$Comp
L LED D26
U 1 1 5AFD0512
P 9800 2650
F 0 "D26" H 9800 2750 50  0000 C CNN
F 1 "LED" H 9800 2550 50  0000 C CNN
F 2 "" H 9800 2650 50  0001 C CNN
F 3 "" H 9800 2650 50  0001 C CNN
	1    9800 2650
	1    0    0    -1  
$EndComp
Text Label 10700 2650 2    60   ~ 0
BUS_PC-MAR5
$Comp
L R R36
U 1 1 5AFD0513
P 9400 2650
F 0 "R36" V 9480 2650 50  0000 C CNN
F 1 "330" V 9400 2650 50  0000 C CNN
F 2 "" V 9330 2650 50  0001 C CNN
F 3 "" H 9400 2650 50  0001 C CNN
	1    9400 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 2650 9650 2650
Wire Wire Line
	9950 2650 10700 2650
Entry Wire Line
	10700 3000 10800 2900
$Comp
L LED D27
U 1 1 5AD2097A
P 9800 3000
F 0 "D27" H 9800 3100 50  0000 C CNN
F 1 "LED" H 9800 2900 50  0000 C CNN
F 2 "" H 9800 3000 50  0001 C CNN
F 3 "" H 9800 3000 50  0001 C CNN
	1    9800 3000
	1    0    0    -1  
$EndComp
Text Label 10700 3000 2    60   ~ 0
BUS_PC-MAR6
$Comp
L R R37
U 1 1 5AD20981
P 9400 3000
F 0 "R37" V 9480 3000 50  0000 C CNN
F 1 "330" V 9400 3000 50  0000 C CNN
F 2 "" V 9330 3000 50  0001 C CNN
F 3 "" H 9400 3000 50  0001 C CNN
	1    9400 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 3000 9650 3000
Wire Wire Line
	9950 3000 10700 3000
Entry Wire Line
	10700 3350 10800 3250
$Comp
L LED D28
U 1 1 5AD2098A
P 9800 3350
F 0 "D28" H 9800 3450 50  0000 C CNN
F 1 "LED" H 9800 3250 50  0000 C CNN
F 2 "" H 9800 3350 50  0001 C CNN
F 3 "" H 9800 3350 50  0001 C CNN
	1    9800 3350
	1    0    0    -1  
$EndComp
Text Label 10700 3350 2    60   ~ 0
BUS_PC-MAR7
$Comp
L R R38
U 1 1 5AD20991
P 9400 3350
F 0 "R38" V 9480 3350 50  0000 C CNN
F 1 "330" V 9400 3350 50  0000 C CNN
F 2 "" V 9330 3350 50  0001 C CNN
F 3 "" H 9400 3350 50  0001 C CNN
	1    9400 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 3350 9650 3350
Wire Wire Line
	9950 3350 10700 3350
Entry Wire Line
	10700 3700 10800 3600
$Comp
L LED D29
U 1 1 5AD20CEA
P 9800 3700
F 0 "D29" H 9800 3800 50  0000 C CNN
F 1 "LED" H 9800 3600 50  0000 C CNN
F 2 "" H 9800 3700 50  0001 C CNN
F 3 "" H 9800 3700 50  0001 C CNN
	1    9800 3700
	1    0    0    -1  
$EndComp
Text Label 10700 3700 2    60   ~ 0
BUS_PC-MAR8
$Comp
L R R39
U 1 1 5AD20CF1
P 9400 3700
F 0 "R39" V 9480 3700 50  0000 C CNN
F 1 "330" V 9400 3700 50  0000 C CNN
F 2 "" V 9330 3700 50  0001 C CNN
F 3 "" H 9400 3700 50  0001 C CNN
	1    9400 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 3700 9650 3700
Wire Wire Line
	9950 3700 10700 3700
Entry Wire Line
	10700 4050 10800 3950
$Comp
L LED D30
U 1 1 5AD20CFA
P 9800 4050
F 0 "D30" H 9800 4150 50  0000 C CNN
F 1 "LED" H 9800 3950 50  0000 C CNN
F 2 "" H 9800 4050 50  0001 C CNN
F 3 "" H 9800 4050 50  0001 C CNN
	1    9800 4050
	1    0    0    -1  
$EndComp
Text Label 10700 4050 2    60   ~ 0
BUS_PC-MAR9
$Comp
L R R40
U 1 1 5AD20D01
P 9400 4050
F 0 "R40" V 9480 4050 50  0000 C CNN
F 1 "330" V 9400 4050 50  0000 C CNN
F 2 "" V 9330 4050 50  0001 C CNN
F 3 "" H 9400 4050 50  0001 C CNN
	1    9400 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4050 9650 4050
Wire Wire Line
	9950 4050 10700 4050
Entry Wire Line
	10700 4400 10800 4300
$Comp
L LED D31
U 1 1 5AD20D0A
P 9800 4400
F 0 "D31" H 9800 4500 50  0000 C CNN
F 1 "LED" H 9800 4300 50  0000 C CNN
F 2 "" H 9800 4400 50  0001 C CNN
F 3 "" H 9800 4400 50  0001 C CNN
	1    9800 4400
	1    0    0    -1  
$EndComp
Text Label 10700 4400 2    60   ~ 0
BUS_PC-MAR10
$Comp
L R R41
U 1 1 5AD20D11
P 9400 4400
F 0 "R41" V 9480 4400 50  0000 C CNN
F 1 "330" V 9400 4400 50  0000 C CNN
F 2 "" V 9330 4400 50  0001 C CNN
F 3 "" H 9400 4400 50  0001 C CNN
	1    9400 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4400 9650 4400
Wire Wire Line
	9950 4400 10700 4400
Entry Wire Line
	10700 4750 10800 4650
$Comp
L LED D32
U 1 1 5AD20D1A
P 9800 4750
F 0 "D32" H 9800 4850 50  0000 C CNN
F 1 "LED" H 9800 4650 50  0000 C CNN
F 2 "" H 9800 4750 50  0001 C CNN
F 3 "" H 9800 4750 50  0001 C CNN
	1    9800 4750
	1    0    0    -1  
$EndComp
Text Label 10700 4750 2    60   ~ 0
BUS_PC-MAR11
$Comp
L R R42
U 1 1 5AD20D21
P 9400 4750
F 0 "R42" V 9480 4750 50  0000 C CNN
F 1 "330" V 9400 4750 50  0000 C CNN
F 2 "" V 9330 4750 50  0001 C CNN
F 3 "" H 9400 4750 50  0001 C CNN
	1    9400 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 4750 9650 4750
Wire Wire Line
	9950 4750 10700 4750
Entry Wire Line
	10700 5100 10800 5000
$Comp
L LED D33
U 1 1 5AD20D2A
P 9800 5100
F 0 "D33" H 9800 5200 50  0000 C CNN
F 1 "LED" H 9800 5000 50  0000 C CNN
F 2 "" H 9800 5100 50  0001 C CNN
F 3 "" H 9800 5100 50  0001 C CNN
	1    9800 5100
	1    0    0    -1  
$EndComp
Text Label 10700 5100 2    60   ~ 0
BUS_PC-MAR12
$Comp
L R R43
U 1 1 5AD20D31
P 9400 5100
F 0 "R43" V 9480 5100 50  0000 C CNN
F 1 "330" V 9400 5100 50  0000 C CNN
F 2 "" V 9330 5100 50  0001 C CNN
F 3 "" H 9400 5100 50  0001 C CNN
	1    9400 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 5100 9650 5100
Wire Wire Line
	9950 5100 10700 5100
Entry Wire Line
	10700 5450 10800 5350
$Comp
L LED D34
U 1 1 5AD20D3A
P 9800 5450
F 0 "D34" H 9800 5550 50  0000 C CNN
F 1 "LED" H 9800 5350 50  0000 C CNN
F 2 "" H 9800 5450 50  0001 C CNN
F 3 "" H 9800 5450 50  0001 C CNN
	1    9800 5450
	1    0    0    -1  
$EndComp
Text Label 10700 5450 2    60   ~ 0
BUS_PC-MAR13
$Comp
L R R44
U 1 1 5AD20D41
P 9400 5450
F 0 "R44" V 9480 5450 50  0000 C CNN
F 1 "330" V 9400 5450 50  0000 C CNN
F 2 "" V 9330 5450 50  0001 C CNN
F 3 "" H 9400 5450 50  0001 C CNN
	1    9400 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 5450 9650 5450
Wire Wire Line
	9950 5450 10700 5450
Entry Wire Line
	10700 5800 10800 5700
$Comp
L LED D35
U 1 1 5AD20D4A
P 9800 5800
F 0 "D35" H 9800 5900 50  0000 C CNN
F 1 "LED" H 9800 5700 50  0000 C CNN
F 2 "" H 9800 5800 50  0001 C CNN
F 3 "" H 9800 5800 50  0001 C CNN
	1    9800 5800
	1    0    0    -1  
$EndComp
Text Label 10700 5800 2    60   ~ 0
BUS_PC-MAR14
$Comp
L R R45
U 1 1 5AD20D51
P 9400 5800
F 0 "R45" V 9480 5800 50  0000 C CNN
F 1 "330" V 9400 5800 50  0000 C CNN
F 2 "" V 9330 5800 50  0001 C CNN
F 3 "" H 9400 5800 50  0001 C CNN
	1    9400 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 5800 9650 5800
Wire Wire Line
	9950 5800 10700 5800
Entry Wire Line
	10700 6150 10800 6050
$Comp
L LED D36
U 1 1 5AD20D5A
P 9800 6150
F 0 "D36" H 9800 6250 50  0000 C CNN
F 1 "LED" H 9800 6050 50  0000 C CNN
F 2 "" H 9800 6150 50  0001 C CNN
F 3 "" H 9800 6150 50  0001 C CNN
	1    9800 6150
	1    0    0    -1  
$EndComp
Text Label 10700 6150 2    60   ~ 0
BUS_PC-MAR15
$Comp
L R R46
U 1 1 5AD20D61
P 9400 6150
F 0 "R46" V 9480 6150 50  0000 C CNN
F 1 "330" V 9400 6150 50  0000 C CNN
F 2 "" V 9330 6150 50  0001 C CNN
F 3 "" H 9400 6150 50  0001 C CNN
	1    9400 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 6150 9650 6150
Wire Wire Line
	9950 6150 10700 6150
Wire Wire Line
	9250 900  9200 900 
Wire Wire Line
	9200 900  9200 6250
Wire Wire Line
	9200 1250 9250 1250
Wire Wire Line
	9200 1600 9250 1600
Connection ~ 9200 1250
Wire Wire Line
	9200 1950 9250 1950
Connection ~ 9200 1600
Wire Wire Line
	9200 2300 9250 2300
Connection ~ 9200 1950
Wire Wire Line
	9200 2650 9250 2650
Connection ~ 9200 2300
Wire Wire Line
	9200 3000 9250 3000
Connection ~ 9200 2650
Wire Wire Line
	9200 3350 9250 3350
Connection ~ 9200 3000
Wire Wire Line
	9200 3700 9250 3700
Connection ~ 9200 3350
Wire Wire Line
	9200 4050 9250 4050
Connection ~ 9200 3700
Wire Wire Line
	9200 4400 9250 4400
Connection ~ 9200 4050
Wire Wire Line
	9200 4750 9250 4750
Connection ~ 9200 4400
Wire Wire Line
	9200 5100 9250 5100
Connection ~ 9200 4750
Wire Wire Line
	9200 5450 9250 5450
Connection ~ 9200 5100
Wire Wire Line
	9200 5800 9250 5800
Connection ~ 9200 5450
Wire Wire Line
	9200 6150 9250 6150
Connection ~ 9200 5800
$Comp
L GND #PWR023
U 1 1 5AD227AC
P 9200 6250
F 0 "#PWR023" H 9200 6000 50  0001 C CNN
F 1 "GND" H 9200 6100 50  0000 C CNN
F 2 "" H 9200 6250 50  0001 C CNN
F 3 "" H 9200 6250 50  0001 C CNN
	1    9200 6250
	1    0    0    -1  
$EndComp
Connection ~ 9200 6150
Text HLabel 10700 650  0    60   Output ~ 0
BUS_PC-MAR[0..15]
Wire Bus Line
	10800 650  10700 650 
Wire Wire Line
	2650 7350 2750 7350
Text Notes 850  800  0    60   ~ 12
Input from C register
Text Notes 750  3500 0    60   ~ 12
Input from D register
Text Notes 3950 800  0    60   ~ 12
Output to C register
Text Notes 3900 3550 0    60   ~ 12
Output to D register
Text Notes 5600 800  0    60   ~ 12
Output to MAR
Wire Wire Line
	4050 2950 4050 3350
Wire Wire Line
	4050 3350 3750 3350
Wire Wire Line
	3750 3350 3750 3500
Wire Wire Line
	3750 3500 1950 3500
Wire Wire Line
	5350 7350 5450 7350
$Comp
L 7402 U20
U 1 1 5AFD0507
P 4750 7350
F 0 "U20" H 4750 7400 50  0000 C CNN
F 1 "7402" H 4800 7300 50  0000 C CNN
F 2 "" H 4750 7350 50  0001 C CNN
F 3 "" H 4750 7350 50  0001 C CNN
	1    4750 7350
	1    0    0    -1  
$EndComp
Text GLabel 5450 7350 2    60   Input ~ 0
/PC-CLK_EN
Wire Wire Line
	4050 7450 4150 7450
Wire Wire Line
	4050 7250 4150 7250
Text HLabel 4050 7450 0    60   Input ~ 0
PC_DEC
Text HLabel 4050 7250 0    60   Input ~ 0
PC_INC
$EndSCHEMATC
