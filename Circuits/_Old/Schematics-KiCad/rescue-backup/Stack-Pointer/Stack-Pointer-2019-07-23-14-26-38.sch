EESchema Schematic File Version 2
LIBS:TTL-Computer-Components
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
Sheet 13 14
Title "Stack Pointer"
Date ""
Rev ""
Comp "Ruud van Falier"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1500 2000 0    60   Input ~ 0
CLOCK
Text HLabel 1500 1600 0    60   Input ~ 0
/STK_RESET
Text HLabel 1350 5200 0    60   Input ~ 0
STK_INC
Text HLabel 1350 6200 0    60   Input ~ 0
STK_DEC
Text GLabel 1600 1800 0    60   Input ~ 0
STK-/UP_DOWN
Text GLabel 2900 5300 2    60   Output ~ 0
STK-/UP_DOWN
NoConn ~ 4600 1850
NoConn ~ 4600 3150
Wire Wire Line
	1750 1950 3200 1950
Wire Wire Line
	1750 3250 3200 3250
Wire Wire Line
	5000 1650 5000 2200
Wire Wire Line
	5000 2200 2900 2200
Wire Wire Line
	2900 2200 2900 3150
Wire Wire Line
	2900 3150 3200 3150
Wire Wire Line
	1750 1700 3200 1700
Wire Wire Line
	1900 3000 3200 3000
Connection ~ 1900 1700
Wire Wire Line
	2050 2900 3200 2900
Wire Wire Line
	1500 1600 3200 1600
Wire Wire Line
	4600 1150 6450 1150
Wire Wire Line
	4600 1250 6450 1250
Wire Wire Line
	4600 1350 6450 1350
Wire Wire Line
	4600 1450 6450 1450
Wire Wire Line
	4600 2450 6450 2450
Wire Wire Line
	4600 2650 6450 2650
Wire Wire Line
	4600 2750 6450 2750
Wire Bus Line
	6500 950  6550 950 
Wire Bus Line
	6550 950  6550 4100
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
	6450 3250 6550 3150
Entry Wire Line
	6450 3350 6550 3250
Entry Wire Line
	6450 3450 6550 3350
Entry Wire Line
	6450 3550 6550 3450
Entry Wire Line
	6450 3650 6550 3550
Entry Wire Line
	6450 3750 6550 3650
Entry Wire Line
	6450 3850 6550 3750
Entry Wire Line
	6450 3950 6550 3850
Text HLabel 6500 950  0    60   Output ~ 0
BUS_STK-MAR[0..15]
Text Label 6450 1150 2    60   ~ 0
BUS_STK-MAR0
Text Label 6450 1250 2    60   ~ 0
BUS_STK-MAR1
Text Label 6450 1350 2    60   ~ 0
BUS_STK-MAR2
Text Label 6450 1450 2    60   ~ 0
BUS_STK-MAR3
Text Label 6450 2450 2    60   ~ 0
BUS_STK-MAR4
Text Label 6450 2550 2    60   ~ 0
BUS_STK-MAR5
Text Label 6450 2650 2    60   ~ 0
BUS_STK-MAR6
Text Label 6450 2750 2    60   ~ 0
BUS_STK-MAR7
Text Label 6450 3250 2    60   ~ 0
BUS_STK-MAR8
Text Label 6450 3350 2    60   ~ 0
BUS_STK-MAR9
Text Label 6450 3450 2    60   ~ 0
BUS_STK-MAR10
Text Label 6450 3550 2    60   ~ 0
BUS_STK-MAR11
Text Label 6450 3650 2    60   ~ 0
BUS_STK-MAR12
Text Label 6450 3750 2    60   ~ 0
BUS_STK-MAR13
Text Label 6450 3850 2    60   ~ 0
BUS_STK-MAR14
Text Label 6450 3950 2    60   ~ 0
BUS_STK-MAR15
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
	3200 1850 2200 1850
Wire Wire Line
	2200 1850 2200 1400
$Comp
L 7402 U20
U 2 1 5AD1DD32
P 2100 5300
F 0 "U20" H 2100 5350 50  0000 C CNN
F 1 "7402" H 2150 5250 50  0000 C CNN
F 2 "" H 2100 5300 50  0001 C CNN
F 3 "" H 2100 5300 50  0001 C CNN
	2    2100 5300
	1    0    0    -1  
$EndComp
$Comp
L 7402 U20
U 3 1 5AFD0506
P 2100 6100
F 0 "U20" H 2100 6150 50  0000 C CNN
F 1 "7402" H 2150 6050 50  0000 C CNN
F 2 "" H 2100 6100 50  0001 C CNN
F 3 "" H 2100 6100 50  0001 C CNN
	3    2100 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5300 2900 5300
Wire Wire Line
	1350 5750 1350 6000
Wire Wire Line
	1350 6000 1500 6000
Connection ~ 2800 5300
Wire Wire Line
	2800 6100 2800 5900
Wire Wire Line
	2800 5900 2550 5900
Wire Wire Line
	2550 5900 2550 5600
Wire Wire Line
	2550 5600 1350 5600
Wire Wire Line
	1350 5600 1350 5400
Wire Wire Line
	1350 5400 1500 5400
Wire Wire Line
	2800 5300 2800 5750
Wire Wire Line
	2800 5750 1350 5750
Wire Wire Line
	1350 5200 1500 5200
Wire Wire Line
	1350 6200 1500 6200
Text GLabel 1600 1400 0    60   Input ~ 0
/STK-CLK_EN
Wire Wire Line
	2200 1400 1600 1400
Wire Bus Line
	9050 950  9050 3800
Entry Wire Line
	8950 1200 9050 1100
$Comp
L LED D92
U 1 1 5AD1FE5C
P 8050 1200
F 0 "D92" H 8050 1300 50  0000 C CNN
F 1 "LED" H 8050 1100 50  0000 C CNN
F 2 "" H 8050 1200 50  0001 C CNN
F 3 "" H 8050 1200 50  0001 C CNN
	1    8050 1200
	1    0    0    -1  
$EndComp
Text Label 8950 1200 2    60   ~ 0
BUS_STK-MAR0
$Comp
L R R112
U 1 1 5AFD0509
P 7650 1200
F 0 "R112" V 7730 1200 50  0000 C CNN
F 1 "330" V 7650 1200 50  0000 C CNN
F 2 "" V 7580 1200 50  0001 C CNN
F 3 "" H 7650 1200 50  0001 C CNN
	1    7650 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 1200 7900 1200
Wire Wire Line
	8200 1200 8950 1200
Entry Wire Line
	8950 1550 9050 1450
$Comp
L LED D93
U 1 1 5AD20744
P 8050 1550
F 0 "D93" H 8050 1650 50  0000 C CNN
F 1 "LED" H 8050 1450 50  0000 C CNN
F 2 "" H 8050 1550 50  0001 C CNN
F 3 "" H 8050 1550 50  0001 C CNN
	1    8050 1550
	1    0    0    -1  
$EndComp
Text Label 8950 1550 2    60   ~ 0
BUS_STK-MAR1
$Comp
L R R113
U 1 1 5AFD050B
P 7650 1550
F 0 "R113" V 7730 1550 50  0000 C CNN
F 1 "330" V 7650 1550 50  0000 C CNN
F 2 "" V 7580 1550 50  0001 C CNN
F 3 "" H 7650 1550 50  0001 C CNN
	1    7650 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 1550 7900 1550
Wire Wire Line
	8200 1550 8950 1550
Entry Wire Line
	8950 1900 9050 1800
$Comp
L LED D94
U 1 1 5AD207C9
P 8050 1900
F 0 "D94" H 8050 2000 50  0000 C CNN
F 1 "LED" H 8050 1800 50  0000 C CNN
F 2 "" H 8050 1900 50  0001 C CNN
F 3 "" H 8050 1900 50  0001 C CNN
	1    8050 1900
	1    0    0    -1  
$EndComp
Text Label 8950 1900 2    60   ~ 0
BUS_STK-MAR2
$Comp
L R R114
U 1 1 5AD207D0
P 7650 1900
F 0 "R114" V 7730 1900 50  0000 C CNN
F 1 "330" V 7650 1900 50  0000 C CNN
F 2 "" V 7580 1900 50  0001 C CNN
F 3 "" H 7650 1900 50  0001 C CNN
	1    7650 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 1900 7900 1900
Wire Wire Line
	8200 1900 8950 1900
Entry Wire Line
	8950 2250 9050 2150
$Comp
L LED D95
U 1 1 5AD207D9
P 8050 2250
F 0 "D95" H 8050 2350 50  0000 C CNN
F 1 "LED" H 8050 2150 50  0000 C CNN
F 2 "" H 8050 2250 50  0001 C CNN
F 3 "" H 8050 2250 50  0001 C CNN
	1    8050 2250
	1    0    0    -1  
$EndComp
Text Label 8950 2250 2    60   ~ 0
BUS_STK-MAR3
$Comp
L R R115
U 1 1 5AFD050F
P 7650 2250
F 0 "R115" V 7730 2250 50  0000 C CNN
F 1 "330" V 7650 2250 50  0000 C CNN
F 2 "" V 7580 2250 50  0001 C CNN
F 3 "" H 7650 2250 50  0001 C CNN
	1    7650 2250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 2250 7900 2250
Wire Wire Line
	8200 2250 8950 2250
Entry Wire Line
	8950 2600 9050 2500
$Comp
L LED D96
U 1 1 5AFD0510
P 8050 2600
F 0 "D96" H 8050 2700 50  0000 C CNN
F 1 "LED" H 8050 2500 50  0000 C CNN
F 2 "" H 8050 2600 50  0001 C CNN
F 3 "" H 8050 2600 50  0001 C CNN
	1    8050 2600
	1    0    0    -1  
$EndComp
Text Label 8950 2600 2    60   ~ 0
BUS_STK-MAR4
$Comp
L R R116
U 1 1 5AFD0511
P 7650 2600
F 0 "R116" V 7730 2600 50  0000 C CNN
F 1 "330" V 7650 2600 50  0000 C CNN
F 2 "" V 7580 2600 50  0001 C CNN
F 3 "" H 7650 2600 50  0001 C CNN
	1    7650 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 2600 7900 2600
Wire Wire Line
	8200 2600 8950 2600
Entry Wire Line
	8950 2950 9050 2850
$Comp
L LED D97
U 1 1 5AD2096A
P 8050 2950
F 0 "D97" H 8050 3050 50  0000 C CNN
F 1 "LED" H 8050 2850 50  0000 C CNN
F 2 "" H 8050 2950 50  0001 C CNN
F 3 "" H 8050 2950 50  0001 C CNN
	1    8050 2950
	1    0    0    -1  
$EndComp
Text Label 8950 2950 2    60   ~ 0
BUS_STK-MAR5
$Comp
L R R117
U 1 1 5AD20971
P 7650 2950
F 0 "R117" V 7730 2950 50  0000 C CNN
F 1 "330" V 7650 2950 50  0000 C CNN
F 2 "" V 7580 2950 50  0001 C CNN
F 3 "" H 7650 2950 50  0001 C CNN
	1    7650 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 2950 7900 2950
Wire Wire Line
	8200 2950 8950 2950
Entry Wire Line
	8950 3300 9050 3200
$Comp
L LED D98
U 1 1 5AFD0514
P 8050 3300
F 0 "D98" H 8050 3400 50  0000 C CNN
F 1 "LED" H 8050 3200 50  0000 C CNN
F 2 "" H 8050 3300 50  0001 C CNN
F 3 "" H 8050 3300 50  0001 C CNN
	1    8050 3300
	1    0    0    -1  
$EndComp
Text Label 8950 3300 2    60   ~ 0
BUS_STK-MAR6
$Comp
L R R118
U 1 1 5AFD0515
P 7650 3300
F 0 "R118" V 7730 3300 50  0000 C CNN
F 1 "330" V 7650 3300 50  0000 C CNN
F 2 "" V 7580 3300 50  0001 C CNN
F 3 "" H 7650 3300 50  0001 C CNN
	1    7650 3300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 3300 7900 3300
Wire Wire Line
	8200 3300 8950 3300
Entry Wire Line
	8950 3650 9050 3550
$Comp
L LED D99
U 1 1 5AFD0516
P 8050 3650
F 0 "D99" H 8050 3750 50  0000 C CNN
F 1 "LED" H 8050 3550 50  0000 C CNN
F 2 "" H 8050 3650 50  0001 C CNN
F 3 "" H 8050 3650 50  0001 C CNN
	1    8050 3650
	1    0    0    -1  
$EndComp
Text Label 8950 3650 2    60   ~ 0
BUS_STK-MAR7
$Comp
L R R119
U 1 1 5AFD0517
P 7650 3650
F 0 "R119" V 7730 3650 50  0000 C CNN
F 1 "330" V 7650 3650 50  0000 C CNN
F 2 "" V 7580 3650 50  0001 C CNN
F 3 "" H 7650 3650 50  0001 C CNN
	1    7650 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7800 3650 7900 3650
Wire Wire Line
	8200 3650 8950 3650
Wire Wire Line
	7500 1200 7450 1200
Wire Wire Line
	7450 1550 7500 1550
Wire Wire Line
	7450 1900 7500 1900
Connection ~ 7450 1550
Wire Wire Line
	7450 2250 7500 2250
Connection ~ 7450 1900
Wire Wire Line
	7450 2600 7500 2600
Connection ~ 7450 2250
Wire Wire Line
	7450 2950 7500 2950
Connection ~ 7450 2600
Wire Wire Line
	7450 3300 7500 3300
Connection ~ 7450 2950
Wire Wire Line
	7450 3650 7500 3650
Connection ~ 7450 3300
Connection ~ 7450 3650
$Comp
L GND #PWR46
U 1 1 5AFD0518
P 7450 3800
F 0 "#PWR46" H 7450 3550 50  0001 C CNN
F 1 "GND" H 7450 3650 50  0000 C CNN
F 2 "" H 7450 3800 50  0001 C CNN
F 3 "" H 7450 3800 50  0001 C CNN
	1    7450 3800
	1    0    0    -1  
$EndComp
Text HLabel 8950 950  0    60   Output ~ 0
BUS_STK-MAR[0..15]
Wire Bus Line
	9050 950  8950 950 
Wire Wire Line
	2700 6100 2800 6100
Text Notes 5800 800  0    60   ~ 12
Output to MAR
Wire Wire Line
	5400 6100 5500 6100
$Comp
L 7402 U20
U 4 1 5AD1F60E
P 4800 6100
F 0 "U20" H 4800 6150 50  0000 C CNN
F 1 "7402" H 4850 6050 50  0000 C CNN
F 2 "" H 4800 6100 50  0001 C CNN
F 3 "" H 4800 6100 50  0001 C CNN
	4    4800 6100
	1    0    0    -1  
$EndComp
Text GLabel 5500 6100 2    60   Input ~ 0
/STK-CLK_EN
Wire Wire Line
	4100 6200 4200 6200
Wire Wire Line
	4100 6000 4200 6000
Text HLabel 4100 6200 0    60   Input ~ 0
STK_DEC
Text HLabel 4100 6000 0    60   Input ~ 0
STK_INC
Wire Wire Line
	1750 1950 1750 3250
Wire Wire Line
	1900 3000 1900 1700
NoConn ~ 4600 2950
Wire Wire Line
	4600 2550 6450 2550
Wire Wire Line
	4600 1650 5000 1650
$Comp
L GND #PWR44
U 1 1 5AFCE121
P 3100 950
F 0 "#PWR44" H 3100 700 50  0001 C CNN
F 1 "GND" H 3100 800 50  0000 C CNN
F 2 "" H 3100 950 50  0001 C CNN
F 3 "" H 3100 950 50  0001 C CNN
	1    3100 950 
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 950  3100 2750
Wire Wire Line
	3100 1150 3200 1150
Wire Wire Line
	3100 1250 3200 1250
Connection ~ 3100 1150
Wire Wire Line
	3100 1350 3200 1350
Connection ~ 3100 1250
Wire Wire Line
	3100 1450 3200 1450
Connection ~ 3100 1350
Wire Wire Line
	3100 2450 3200 2450
Connection ~ 3100 1450
Wire Wire Line
	3100 2550 3200 2550
Connection ~ 3100 2450
Wire Wire Line
	3100 2650 3200 2650
Connection ~ 3100 2550
Wire Wire Line
	3100 2750 3200 2750
Connection ~ 3100 2650
Wire Wire Line
	7450 1200 7450 3800
$Comp
L +5V #PWR45
U 1 1 5AFCF67E
P 5500 3950
F 0 "#PWR45" H 5500 3800 50  0001 C CNN
F 1 "+5V" H 5500 4090 50  0000 C CNN
F 2 "" H 5500 3950 50  0001 C CNN
F 3 "" H 5500 3950 50  0001 C CNN
	1    5500 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 3950 6450 3950
Wire Wire Line
	5500 3850 6450 3850
Wire Wire Line
	5500 3250 5500 3950
Wire Wire Line
	6450 3750 5500 3750
Connection ~ 5500 3850
Wire Wire Line
	6450 3650 5500 3650
Connection ~ 5500 3750
Wire Wire Line
	6450 3550 5500 3550
Connection ~ 5500 3650
Wire Wire Line
	6450 3450 5500 3450
Connection ~ 5500 3550
Wire Wire Line
	6450 3350 5500 3350
Connection ~ 5500 3450
Wire Wire Line
	6450 3250 5500 3250
Connection ~ 5500 3350
$Comp
L 74LS191 U?
U 1 1 5C89042D
P 3900 1550
AR Path="/5C89042D" Ref="U?"  Part="1" 
AR Path="/5AFCA082/5C89042D" Ref="U40"  Part="1" 
F 0 "U40" H 3900 1550 50  0000 C CNN
F 1 "74LS191" H 3950 1350 50  0000 C CNN
F 2 "" H 3900 1550 50  0001 C CNN
F 3 "" H 3900 1550 50  0001 C CNN
F 4 "Bit 0-3" H 3900 2050 60  0000 C CNN "Text"
	1    3900 1550
	1    0    0    -1  
$EndComp
$Comp
L 74LS191 U?
U 1 1 5C890478
P 3900 2850
AR Path="/5C890478" Ref="U?"  Part="1" 
AR Path="/5AFCA082/5C890478" Ref="U41"  Part="1" 
F 0 "U41" H 3900 2850 50  0000 C CNN
F 1 "74LS191" H 3950 2650 50  0000 C CNN
F 2 "" H 3900 2850 50  0001 C CNN
F 3 "" H 3900 2850 50  0001 C CNN
F 4 "Bit 4-7" H 3900 3350 60  0000 C CNN "Text"
	1    3900 2850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
