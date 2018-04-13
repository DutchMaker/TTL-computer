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
Sheet 5 5
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
L 74LS191-RESCUE-TTL-Computer U9
U 1 1 5ACF3420
P 6200 1650
AR Path="/5ACF3420" Ref="U9"  Part="1" 
AR Path="/5ACF340E/5ACF3420" Ref="U9"  Part="1" 
F 0 "U9" H 6200 1650 50  0000 C CNN
F 1 "74LS191" H 6250 1450 50  0000 C CNN
F 2 "" H 6200 1650 50  0001 C CNN
F 3 "" H 6200 1650 50  0001 C CNN
F 4 "Bit 0-3" H 6200 1807 60  0000 C BNN "Text"
	1    6200 1650
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U10
U 1 1 5ACF346D
P 6200 2950
AR Path="/5ACF346D" Ref="U10"  Part="1" 
AR Path="/5ACF340E/5ACF346D" Ref="U10"  Part="1" 
F 0 "U10" H 6200 2950 50  0000 C CNN
F 1 "74LS191" H 6250 2750 50  0000 C CNN
F 2 "" H 6200 2950 50  0001 C CNN
F 3 "" H 6200 2950 50  0001 C CNN
F 4 "Bit 4-7" H 6200 3107 60  0000 C BNN "Text"
	1    6200 2950
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U11
U 1 1 5ACF34C6
P 6200 4300
AR Path="/5ACF34C6" Ref="U11"  Part="1" 
AR Path="/5ACF340E/5ACF34C6" Ref="U11"  Part="1" 
F 0 "U11" H 6200 4300 50  0000 C CNN
F 1 "74LS191" H 6250 4100 50  0000 C CNN
F 2 "" H 6200 4300 50  0001 C CNN
F 3 "" H 6200 4300 50  0001 C CNN
F 4 "Bit 8-11" H 6200 4457 60  0000 C BNN "Text"
	1    6200 4300
	1    0    0    -1  
$EndComp
$Comp
L 74LS191-RESCUE-TTL-Computer U12
U 1 1 5ACF34F9
P 6200 5650
AR Path="/5ACF34F9" Ref="U12"  Part="1" 
AR Path="/5ACF340E/5ACF34F9" Ref="U12"  Part="1" 
F 0 "U12" H 6200 5650 50  0000 C CNN
F 1 "74LS191" H 6250 5450 50  0000 C CNN
F 2 "" H 6200 5650 50  0001 C CNN
F 3 "" H 6200 5650 50  0001 C CNN
F 4 "Bit 12-15" H 6200 5807 60  0000 C BNN "Text"
	1    6200 5650
	1    0    0    -1  
$EndComp
Text HLabel 4450 2100 0    60   Input ~ 0
CLOCK
Text HLabel 4450 1700 0    60   Input ~ 0
/PC_X-IN
Text HLabel 4450 4350 0    60   Input ~ 0
/PC_Y-IN
Text HLabel 1200 3250 0    60   Input ~ 0
PC_INC
Text HLabel 1200 3650 0    60   Input ~ 0
PC_DEC
NoConn ~ 1400 3250
NoConn ~ 1400 3650
Text HLabel 8000 1050 2    60   Output ~ 0
BUS_PC-X_OUT[0..7]
Text HLabel 8000 3750 2    60   BiDi ~ 0
BUS_PC-Y_OUT[0..7]
NoConn ~ 6900 5750
Text Notes 1350 3500 0    60   ~ 0
flip-flop??
Text GLabel 4450 1900 0    60   Input ~ 0
UP_DOWN
NoConn ~ 1800 3250
Text GLabel 2000 3250 2    60   Output ~ 0
UP_DOWN
Entry Wire Line
	7800 1250 7900 1150
Entry Wire Line
	7800 1350 7900 1250
Entry Wire Line
	7800 1450 7900 1350
Entry Wire Line
	7800 1550 7900 1450
Entry Wire Line
	7800 2550 7900 2450
Entry Wire Line
	7800 2650 7900 2550
Entry Wire Line
	7800 2750 7900 2650
Entry Wire Line
	7800 2850 7900 2750
Entry Wire Line
	7800 3900 7900 3800
Entry Wire Line
	7800 4000 7900 3900
Entry Wire Line
	7800 4100 7900 4000
Entry Wire Line
	7800 4200 7900 4100
Entry Wire Line
	7800 5250 7900 5150
Entry Wire Line
	7800 5350 7900 5250
Entry Wire Line
	7800 5450 7900 5350
Entry Wire Line
	7800 5550 7900 5450
NoConn ~ 6900 1950
NoConn ~ 6900 3250
NoConn ~ 6900 4600
NoConn ~ 6900 5950
Wire Wire Line
	1400 3650 1200 3650
Wire Wire Line
	1400 3250 1200 3250
Wire Wire Line
	4700 2050 5500 2050
Wire Wire Line
	4700 2050 4700 6050
Wire Wire Line
	4700 3350 5500 3350
Wire Wire Line
	4700 4700 5500 4700
Connection ~ 4700 3350
Wire Wire Line
	4700 6050 5500 6050
Connection ~ 4700 4700
Wire Wire Line
	6900 1750 7300 1750
Wire Wire Line
	7300 1750 7300 2300
Wire Wire Line
	7300 2300 4900 2300
Wire Wire Line
	4900 2300 4900 3250
Wire Wire Line
	4900 3250 5500 3250
Wire Wire Line
	6900 3050 7300 3050
Wire Wire Line
	7300 3050 7300 3600
Wire Wire Line
	7300 3600 4900 3600
Wire Wire Line
	6900 4400 7300 4400
Wire Wire Line
	7300 4400 7300 5000
Wire Wire Line
	7300 5000 4900 5000
Wire Wire Line
	4900 5000 4900 5950
Wire Wire Line
	4900 5950 5500 5950
Wire Notes Line
	1250 3100 1250 3800
Wire Notes Line
	1250 3800 1900 3800
Wire Notes Line
	1900 3800 1900 3100
Wire Notes Line
	1900 3100 1250 3100
Wire Wire Line
	4700 1800 5500 1800
Wire Wire Line
	4800 1800 4800 5800
Wire Wire Line
	4800 3100 5500 3100
Wire Wire Line
	4800 4450 5500 4450
Connection ~ 4800 3100
Wire Wire Line
	4900 4600 5500 4600
Wire Wire Line
	4900 3600 4900 4600
Wire Wire Line
	4800 5800 5500 5800
Connection ~ 4800 4450
Connection ~ 4800 1800
Wire Wire Line
	1800 3250 2000 3250
Wire Bus Line
	7900 1050 7900 2850
Wire Bus Line
	7900 3750 7900 5550
Wire Bus Line
	8000 1050 7900 1050
Wire Bus Line
	8000 3750 7900 3750
Wire Wire Line
	3800 5550 5500 5550
Wire Wire Line
	3800 5450 5500 5450
Wire Wire Line
	3800 5350 5500 5350
Wire Wire Line
	3800 5250 5500 5250
Wire Wire Line
	4450 4350 5500 4350
Wire Wire Line
	3800 4200 5500 4200
Wire Wire Line
	3800 4100 5500 4100
Wire Wire Line
	3800 4000 5500 4000
Wire Wire Line
	3800 3900 5500 3900
Wire Wire Line
	5000 3000 5500 3000
Wire Wire Line
	3800 2850 5500 2850
Wire Wire Line
	3800 2750 5500 2750
Wire Wire Line
	3800 2650 5500 2650
Wire Wire Line
	3800 2550 5500 2550
Wire Wire Line
	4450 1700 5500 1700
Wire Wire Line
	3800 1550 5500 1550
Wire Wire Line
	3800 1450 5500 1450
Wire Wire Line
	3800 1350 5500 1350
Wire Wire Line
	3800 1250 5500 1250
Wire Wire Line
	6900 1250 9400 1250
Wire Wire Line
	6900 1350 9400 1350
Wire Wire Line
	6900 1450 9400 1450
Wire Wire Line
	6900 1550 9400 1550
Wire Wire Line
	6900 2550 9400 2550
Wire Wire Line
	6900 2650 9400 2650
Wire Wire Line
	6900 2750 9400 2750
Wire Wire Line
	6900 2850 9400 2850
Wire Wire Line
	6900 3900 9400 3900
Wire Wire Line
	6900 4000 9400 4000
Wire Wire Line
	6900 4100 9400 4100
Wire Wire Line
	6900 4200 9400 4200
Wire Wire Line
	6900 5250 9400 5250
Wire Wire Line
	6900 5350 9400 5350
Wire Wire Line
	6900 5450 9400 5450
Wire Wire Line
	6900 5550 9400 5550
Text Label 7000 1250 0    60   ~ 0
BUS_PC-X_OUT0
Text Label 7000 1350 0    60   ~ 0
BUS_PC-X_OUT1
Text Label 7000 1450 0    60   ~ 0
BUS_PC-X_OUT2
Text Label 7000 1550 0    60   ~ 0
BUS_PC-X_OUT3
Text Label 7000 2550 0    60   ~ 0
BUS_PC-X_OUT4
Text Label 7000 2650 0    60   ~ 0
BUS_PC-X_OUT5
Text Label 7000 2750 0    60   ~ 0
BUS_PC-X_OUT6
Text Label 7000 2850 0    60   ~ 0
BUS_PC-X_OUT7
Text Label 7000 3900 0    60   ~ 0
BUS_PC-Y_OUT0
Text Label 7000 4000 0    60   ~ 0
BUS_PC-Y_OUT1
Text Label 7000 4100 0    60   ~ 0
BUS_PC-Y_OUT2
Text Label 7000 4200 0    60   ~ 0
BUS_PC-Y_OUT3
Text Label 7000 5250 0    60   ~ 0
BUS_PC-Y_OUT4
Text Label 7000 5350 0    60   ~ 0
BUS_PC-Y_OUT5
Text Label 7000 5450 0    60   ~ 0
BUS_PC-Y_OUT6
Text Label 7000 5550 0    60   ~ 0
BUS_PC-Y_OUT7
Wire Bus Line
	3700 1050 3700 2850
Wire Bus Line
	3700 3750 3700 5550
Text HLabel 3600 1050 0    60   Input ~ 0
BUS_PC-X_IN[0..7]
Wire Bus Line
	3700 1050 3600 1050
Text HLabel 3600 3750 0    60   Input ~ 0
BUS_PC-Y_IN[0..7]
Wire Bus Line
	3700 3750 3600 3750
Entry Wire Line
	3700 1150 3800 1250
Entry Wire Line
	3700 2450 3800 2550
Entry Wire Line
	3700 2550 3800 2650
Entry Wire Line
	3700 2650 3800 2750
Entry Wire Line
	3700 2750 3800 2850
Entry Wire Line
	3700 1250 3800 1350
Entry Wire Line
	3700 1350 3800 1450
Entry Wire Line
	3700 1450 3800 1550
Entry Wire Line
	3700 3800 3800 3900
Entry Wire Line
	3700 3900 3800 4000
Entry Wire Line
	3700 4000 3800 4100
Entry Wire Line
	3700 4100 3800 4200
Entry Wire Line
	3700 5150 3800 5250
Entry Wire Line
	3700 5250 3800 5350
Entry Wire Line
	3700 5350 3800 5450
Entry Wire Line
	3700 5450 3800 5550
Text Label 3800 1250 0    60   ~ 0
BUS_PC-X_IN0
Text Label 3800 1350 0    60   ~ 0
BUS_PC-X_IN1
Text Label 3800 1450 0    60   ~ 0
BUS_PC-X_IN2
Text Label 3800 1550 0    60   ~ 0
BUS_PC-X_IN3
Text Label 3800 2550 0    60   ~ 0
BUS_PC-X_IN4
Text Label 3800 2650 0    60   ~ 0
BUS_PC-X_IN5
Text Label 3800 2750 0    60   ~ 0
BUS_PC-X_IN6
Text Label 3800 2850 0    60   ~ 0
BUS_PC-X_IN7
Text Label 3800 3900 0    60   ~ 0
BUS_PC-Y_IN0
Text Label 3800 4000 0    60   ~ 0
BUS_PC-Y_IN1
Text Label 3800 4100 0    60   ~ 0
BUS_PC-Y_IN2
Text Label 3800 4200 0    60   ~ 0
BUS_PC-Y_IN3
Text Label 3800 5250 0    60   ~ 0
BUS_PC-Y_IN4
Text Label 3800 5350 0    60   ~ 0
BUS_PC-Y_IN5
Text Label 3800 5450 0    60   ~ 0
BUS_PC-Y_IN6
Text Label 3800 5550 0    60   ~ 0
BUS_PC-Y_IN7
Wire Bus Line
	9600 1050 9500 1050
Wire Bus Line
	9500 1050 9500 5550
Entry Wire Line
	9400 1250 9500 1150
Entry Wire Line
	9400 1350 9500 1250
Entry Wire Line
	9400 1450 9500 1350
Entry Wire Line
	9400 1550 9500 1450
Entry Wire Line
	9400 2550 9500 2450
Entry Wire Line
	9400 2650 9500 2550
Entry Wire Line
	9400 2750 9500 2650
Entry Wire Line
	9400 2850 9500 2750
Entry Wire Line
	9400 3900 9500 3800
Entry Wire Line
	9400 4000 9500 3900
Entry Wire Line
	9400 4100 9500 4000
Entry Wire Line
	9400 4200 9500 4100
Entry Wire Line
	9400 5250 9500 5150
Entry Wire Line
	9400 5350 9500 5250
Entry Wire Line
	9400 5450 9500 5350
Entry Wire Line
	9400 5550 9500 5450
Connection ~ 7800 5550
Connection ~ 7800 5450
Connection ~ 7800 5350
Connection ~ 7800 5250
Connection ~ 7800 4200
Connection ~ 7800 4100
Connection ~ 7800 4000
Connection ~ 7800 3900
Connection ~ 7800 2850
Connection ~ 7800 2750
Connection ~ 7800 2650
Connection ~ 7800 2550
Connection ~ 7800 1550
Connection ~ 7800 1450
Connection ~ 7800 1350
Connection ~ 7800 1250
Text HLabel 9600 1050 2    60   Output ~ 0
BUS_PC-MAR[0..15]
Text Label 9400 1250 2    60   ~ 0
BUS_PC-MAR0
Text Label 9400 1350 2    60   ~ 0
BUS_PC-MAR1
Text Label 9400 1450 2    60   ~ 0
BUS_PC-MAR2
Text Label 9400 1550 2    60   ~ 0
BUS_PC-MAR3
Text Label 9400 2550 2    60   ~ 0
BUS_PC-MAR4
Text Label 9400 2650 2    60   ~ 0
BUS_PC-MAR5
Text Label 9400 2750 2    60   ~ 0
BUS_PC-MAR6
Text Label 9400 2850 2    60   ~ 0
BUS_PC-MAR7
Text Label 9400 3900 2    60   ~ 0
BUS_PC-MAR8
Text Label 9400 4000 2    60   ~ 0
BUS_PC-MAR9
Text Label 9400 4100 2    60   ~ 0
BUS_PC-MAR10
Text Label 9400 4200 2    60   ~ 0
BUS_PC-MAR11
Text Label 9400 5250 2    60   ~ 0
BUS_PC-MAR12
Text Label 9400 5350 2    60   ~ 0
BUS_PC-MAR13
Text Label 9400 5450 2    60   ~ 0
BUS_PC-MAR14
Text Label 9400 5550 2    60   ~ 0
BUS_PC-MAR15
Wire Wire Line
	4700 1800 4700 1900
Wire Wire Line
	4700 1900 4450 1900
Wire Wire Line
	4450 2100 4700 2100
Connection ~ 4700 2100
Wire Wire Line
	5000 3000 5000 1700
Connection ~ 5000 1700
Wire Wire Line
	5500 5700 5000 5700
Wire Wire Line
	5000 5700 5000 4350
Connection ~ 5000 4350
Text HLabel 1200 2800 0    60   Input ~ 0
CLOCK
Wire Wire Line
	1200 2800 1600 2800
Wire Wire Line
	1600 2800 1600 3200
NoConn ~ 1600 3200
$Comp
L GND #PWR?
U 1 1 5AD12A7A
P 5350 1000
F 0 "#PWR?" H 5350 750 50  0001 C CNN
F 1 "GND" H 5350 850 50  0000 C CNN
F 2 "" H 5350 1000 50  0001 C CNN
F 3 "" H 5350 1000 50  0001 C CNN
	1    5350 1000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5500 1950 5350 1950
Wire Wire Line
	5350 1950 5350 1000
$EndSCHEMATC
