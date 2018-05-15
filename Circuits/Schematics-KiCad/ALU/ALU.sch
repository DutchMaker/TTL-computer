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
$Descr A3 16535 11693
encoding utf-8
Sheet 6 14
Title "Arithmetic Logic Unit"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74LS181 U21
U 1 1 5AD5D498
P 3550 2250
F 0 "U21" H 3810 3050 50  0000 C CNN
F 1 "74LS181" H 3840 1440 50  0000 C CNN
F 2 "" H 3550 2250 50  0001 C CNN
F 3 "" H 3550 2250 50  0001 C CNN
	1    3550 2250
	1    0    0    -1  
$EndComp
$Comp
L 74LS181 U22
U 1 1 5AD5D4CA
P 3550 4350
F 0 "U22" H 3810 5150 50  0000 C CNN
F 1 "74LS181" H 3840 3540 50  0000 C CNN
F 2 "" H 3550 4350 50  0001 C CNN
F 3 "" H 3550 4350 50  0001 C CNN
	1    3550 4350
	1    0    0    -1  
$EndComp
NoConn ~ 4250 2800
NoConn ~ 4250 2900
NoConn ~ 4250 4900
NoConn ~ 4250 5000
Text HLabel 1100 2950 0    60   Input ~ 0
ALU_Cn
Text HLabel 1100 2850 0    60   Input ~ 0
ALU_M
Text HLabel 1950 1050 2    60   Input ~ 0
BUS_B-ALU[0..7]
Entry Wire Line
	1900 1850 2000 1950
Entry Wire Line
	1900 1950 2000 2050
Entry Wire Line
	1900 2050 2000 2150
Entry Wire Line
	1900 2150 2000 2250
Entry Wire Line
	1900 3950 2000 4050
Entry Wire Line
	1900 4050 2000 4150
Entry Wire Line
	1900 4150 2000 4250
Entry Wire Line
	1900 4250 2000 4350
Text Label 2300 1950 0    60   ~ 0
BUS_B-ALU0
Text Label 2300 2050 0    60   ~ 0
BUS_B-ALU1
Text Label 2300 2150 0    60   ~ 0
BUS_B-ALU2
Text Label 2300 2250 0    60   ~ 0
BUS_B-ALU3
Text Label 2300 4050 0    60   ~ 0
BUS_B-ALU4
Text Label 2300 4150 0    60   ~ 0
BUS_B-ALU5
Text Label 2300 4250 0    60   ~ 0
BUS_B-ALU6
Text Label 2300 4350 0    60   ~ 0
BUS_B-ALU7
Text HLabel 1100 2400 0    60   Input ~ 0
ALU_S0
Text HLabel 1100 2500 0    60   Input ~ 0
ALU_S1
Text HLabel 1100 2600 0    60   Input ~ 0
ALU_S2
Text HLabel 1100 2700 0    60   Input ~ 0
ALU_S3
Text HLabel 6650 2700 2    60   Output ~ 0
ALU_Feq
$Comp
L 74LS32 U4
U 4 1 5AE84D12
P 5950 1900
F 0 "U4" H 5950 1950 50  0000 C CNN
F 1 "74LS32" H 5950 1850 50  0000 C CNN
F 2 "" H 5950 1900 50  0001 C CNN
F 3 "" H 5950 1900 50  0001 C CNN
	4    5950 1900
	1    0    0    -1  
$EndComp
$Comp
L 74LS08 U5
U 4 1 5AE84F46
P 6000 2700
F 0 "U5" H 6000 2750 50  0000 C CNN
F 1 "74LS08" H 6000 2650 50  0000 C CNN
F 2 "" H 6000 2700 50  0001 C CNN
F 3 "" H 6000 2700 50  0001 C CNN
	4    6000 2700
	1    0    0    -1  
$EndComp
$Comp
L 74LS00 U24
U 1 1 5AE84FA7
P 6000 3450
F 0 "U24" H 6000 3500 50  0000 C CNN
F 1 "74LS00" H 6000 3350 50  0000 C CNN
F 2 "" H 6000 3450 50  0001 C CNN
F 3 "" H 6000 3450 50  0001 C CNN
	1    6000 3450
	1    0    0    -1  
$EndComp
Text HLabel 6650 1900 2    60   Output ~ 0
ALU_Flt
Text HLabel 6650 3450 2    60   Output ~ 0
ALU_Fgt
Text GLabel 4250 1750 2    60   Output ~ 0
ALU_OUT0
Text GLabel 4250 1850 2    60   Output ~ 0
ALU_OUT1
Text GLabel 4250 1950 2    60   Output ~ 0
ALU_OUT2
Text GLabel 4250 2050 2    60   Output ~ 0
ALU_OUT3
Text GLabel 4250 3850 2    60   Output ~ 0
ALU_OUT4
Text GLabel 4250 3950 2    60   Output ~ 0
ALU_OUT5
Text GLabel 4250 4050 2    60   Output ~ 0
ALU_OUT6
Text GLabel 4250 4150 2    60   Output ~ 0
ALU_OUT7
Text GLabel 8000 1550 0    60   Input ~ 0
ALU_OUT0
Text GLabel 8000 1650 0    60   Input ~ 0
ALU_OUT1
Text GLabel 8000 1750 0    60   Input ~ 0
ALU_OUT2
Text GLabel 8000 1850 0    60   Input ~ 0
ALU_OUT3
Text GLabel 8000 1950 0    60   Input ~ 0
ALU_OUT4
Text GLabel 8000 2050 0    60   Input ~ 0
ALU_OUT5
Text GLabel 8000 2150 0    60   Input ~ 0
ALU_OUT6
Text GLabel 8000 2250 0    60   Input ~ 0
ALU_OUT7
$Comp
L +5V #PWR024
U 1 1 5AE884B9
P 7850 2450
F 0 "#PWR024" H 7850 2300 50  0001 C CNN
F 1 "+5V" H 7850 2590 50  0000 C CNN
F 2 "" H 7850 2450 50  0001 C CNN
F 3 "" H 7850 2450 50  0001 C CNN
	1    7850 2450
	0    -1   -1   0   
$EndComp
Text HLabel 7900 2700 0    60   Input ~ 0
/ALU_OUT
$Comp
L LED D37
U 1 1 5AE89385
P 7350 5100
F 0 "D37" H 7350 5200 50  0000 C CNN
F 1 "LED" H 7350 5000 50  0000 C CNN
F 2 "" H 7350 5100 50  0001 C CNN
F 3 "" H 7350 5100 50  0001 C CNN
	1    7350 5100
	1    0    0    -1  
$EndComp
$Comp
L R R47
U 1 1 5AE8938C
P 6950 5100
F 0 "R47" V 7030 5100 50  0000 C CNN
F 1 "330" V 6950 5100 50  0000 C CNN
F 2 "" V 6880 5100 50  0001 C CNN
F 3 "" H 6950 5100 50  0001 C CNN
	1    6950 5100
	0    -1   -1   0   
$EndComp
$Comp
L LED D38
U 1 1 5AE89393
P 7350 5450
F 0 "D38" H 7350 5550 50  0000 C CNN
F 1 "LED" H 7350 5350 50  0000 C CNN
F 2 "" H 7350 5450 50  0001 C CNN
F 3 "" H 7350 5450 50  0001 C CNN
	1    7350 5450
	1    0    0    -1  
$EndComp
$Comp
L R R48
U 1 1 5AE8939A
P 6950 5450
F 0 "R48" V 7030 5450 50  0000 C CNN
F 1 "330" V 6950 5450 50  0000 C CNN
F 2 "" V 6880 5450 50  0001 C CNN
F 3 "" H 6950 5450 50  0001 C CNN
	1    6950 5450
	0    -1   -1   0   
$EndComp
$Comp
L LED D39
U 1 1 5AE893A1
P 7350 5800
F 0 "D39" H 7350 5900 50  0000 C CNN
F 1 "LED" H 7350 5700 50  0000 C CNN
F 2 "" H 7350 5800 50  0001 C CNN
F 3 "" H 7350 5800 50  0001 C CNN
	1    7350 5800
	1    0    0    -1  
$EndComp
$Comp
L R R49
U 1 1 5AE893A8
P 6950 5800
F 0 "R49" V 7030 5800 50  0000 C CNN
F 1 "330" V 6950 5800 50  0000 C CNN
F 2 "" V 6880 5800 50  0001 C CNN
F 3 "" H 6950 5800 50  0001 C CNN
	1    6950 5800
	0    -1   -1   0   
$EndComp
$Comp
L LED D40
U 1 1 5AE893AF
P 7350 6150
F 0 "D40" H 7350 6250 50  0000 C CNN
F 1 "LED" H 7350 6050 50  0000 C CNN
F 2 "" H 7350 6150 50  0001 C CNN
F 3 "" H 7350 6150 50  0001 C CNN
	1    7350 6150
	1    0    0    -1  
$EndComp
$Comp
L R R50
U 1 1 5AE893B6
P 6950 6150
F 0 "R50" V 7030 6150 50  0000 C CNN
F 1 "330" V 6950 6150 50  0000 C CNN
F 2 "" V 6880 6150 50  0001 C CNN
F 3 "" H 6950 6150 50  0001 C CNN
	1    6950 6150
	0    -1   -1   0   
$EndComp
$Comp
L LED D41
U 1 1 5AE893BD
P 7350 6500
F 0 "D41" H 7350 6600 50  0000 C CNN
F 1 "LED" H 7350 6400 50  0000 C CNN
F 2 "" H 7350 6500 50  0001 C CNN
F 3 "" H 7350 6500 50  0001 C CNN
	1    7350 6500
	1    0    0    -1  
$EndComp
$Comp
L R R51
U 1 1 5AE893C4
P 6950 6500
F 0 "R51" V 7030 6500 50  0000 C CNN
F 1 "330" V 6950 6500 50  0000 C CNN
F 2 "" V 6880 6500 50  0001 C CNN
F 3 "" H 6950 6500 50  0001 C CNN
	1    6950 6500
	0    -1   -1   0   
$EndComp
$Comp
L LED D42
U 1 1 5AE893CB
P 7350 6850
F 0 "D42" H 7350 6950 50  0000 C CNN
F 1 "LED" H 7350 6750 50  0000 C CNN
F 2 "" H 7350 6850 50  0001 C CNN
F 3 "" H 7350 6850 50  0001 C CNN
	1    7350 6850
	1    0    0    -1  
$EndComp
$Comp
L R R52
U 1 1 5AE893D2
P 6950 6850
F 0 "R52" V 7030 6850 50  0000 C CNN
F 1 "330" V 6950 6850 50  0000 C CNN
F 2 "" V 6880 6850 50  0001 C CNN
F 3 "" H 6950 6850 50  0001 C CNN
	1    6950 6850
	0    -1   -1   0   
$EndComp
$Comp
L LED D43
U 1 1 5AE893D9
P 7350 7200
F 0 "D43" H 7350 7300 50  0000 C CNN
F 1 "LED" H 7350 7100 50  0000 C CNN
F 2 "" H 7350 7200 50  0001 C CNN
F 3 "" H 7350 7200 50  0001 C CNN
	1    7350 7200
	1    0    0    -1  
$EndComp
$Comp
L R R53
U 1 1 5AE893E0
P 6950 7200
F 0 "R53" V 7030 7200 50  0000 C CNN
F 1 "330" V 6950 7200 50  0000 C CNN
F 2 "" V 6880 7200 50  0001 C CNN
F 3 "" H 6950 7200 50  0001 C CNN
	1    6950 7200
	0    -1   -1   0   
$EndComp
$Comp
L LED D44
U 1 1 5AE893E7
P 7350 7550
F 0 "D44" H 7350 7650 50  0000 C CNN
F 1 "LED" H 7350 7450 50  0000 C CNN
F 2 "" H 7350 7550 50  0001 C CNN
F 3 "" H 7350 7550 50  0001 C CNN
	1    7350 7550
	1    0    0    -1  
$EndComp
$Comp
L R R54
U 1 1 5AE893EE
P 6950 7550
F 0 "R54" V 7030 7550 50  0000 C CNN
F 1 "330" V 6950 7550 50  0000 C CNN
F 2 "" V 6880 7550 50  0001 C CNN
F 3 "" H 6950 7550 50  0001 C CNN
	1    6950 7550
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR025
U 1 1 5AE893F5
P 6750 7750
F 0 "#PWR025" H 6750 7500 50  0001 C CNN
F 1 "GND" H 6750 7600 50  0000 C CNN
F 2 "" H 6750 7750 50  0001 C CNN
F 3 "" H 6750 7750 50  0001 C CNN
	1    6750 7750
	1    0    0    -1  
$EndComp
Text GLabel 7600 5100 2    60   Input ~ 0
ALU_OUT0
Text GLabel 7600 5450 2    60   Input ~ 0
ALU_OUT1
Text GLabel 7600 5800 2    60   Input ~ 0
ALU_OUT2
Text GLabel 7600 6150 2    60   Input ~ 0
ALU_OUT3
Text GLabel 7600 6500 2    60   Input ~ 0
ALU_OUT4
Text GLabel 7600 6850 2    60   Input ~ 0
ALU_OUT5
Text GLabel 7600 7200 2    60   Input ~ 0
ALU_OUT6
Text GLabel 7600 7550 2    60   Input ~ 0
ALU_OUT7
Text HLabel 10600 1350 0    60   BiDi ~ 0
BUS_DATA[0..7]
Entry Wire Line
	10650 1450 10550 1550
Entry Wire Line
	10650 1600 10550 1700
Entry Wire Line
	10650 1750 10550 1850
Entry Wire Line
	10650 1900 10550 2000
Entry Wire Line
	10650 2050 10550 2150
Entry Wire Line
	10650 2200 10550 2300
Entry Wire Line
	10650 2350 10550 2450
Entry Wire Line
	10650 2500 10550 2600
Text Label 10500 1550 2    60   ~ 0
BUS_DATA0
Text Label 10500 1700 2    60   ~ 0
BUS_DATA1
Text Label 10500 1850 2    60   ~ 0
BUS_DATA2
Text Label 10500 2000 2    60   ~ 0
BUS_DATA3
Text Label 10500 2150 2    60   ~ 0
BUS_DATA4
Text Label 10500 2300 2    60   ~ 0
BUS_DATA5
Text Label 10500 2450 2    60   ~ 0
BUS_DATA6
Text Label 10500 2600 2    60   ~ 0
BUS_DATA7
Text Notes 9750 1200 0    60   ~ 12
Output to DATA bus
$Comp
L 74LS245 U25
U 1 1 5AE86910
P 8700 2050
F 0 "U25" H 8800 2625 50  0000 L BNN
F 1 "74LS245" H 8750 1475 50  0000 L TNN
F 2 "" H 8700 2050 50  0001 C CNN
F 3 "" H 8700 2050 50  0001 C CNN
	1    8700 2050
	1    0    0    -1  
$EndComp
Text HLabel 5450 4950 2    60   Output ~ 0
ALU_Fz
Text HLabel 5450 4600 2    60   Output ~ 0
ALU_Fc
Text Notes 1950 900  0    60   ~ 12
Input from A & B register
NoConn ~ 5350 4950
$Comp
L 74LS377 U23
U 1 1 5AEE2542
P 3550 7050
F 0 "U23" H 3550 7050 50  0000 C CNN
F 1 "74LS377" H 3650 6650 50  0000 C CNN
F 2 "" H 3550 7050 50  0001 C CNN
F 3 "" H 3550 7050 50  0001 C CNN
	1    3550 7050
	1    0    0    -1  
$EndComp
Text HLabel 2350 7750 0    60   Input ~ 0
CLOCK
Text GLabel 4650 6500 2    60   Input ~ 0
ACC_OUTPUT0
Text GLabel 4650 6650 2    60   Input ~ 0
ACC_OUTPUT1
Text GLabel 4650 6800 2    60   Input ~ 0
ACC_OUTPUT2
Text GLabel 4650 6950 2    60   Input ~ 0
ACC_OUTPUT3
Text GLabel 4650 7100 2    60   Input ~ 0
ACC_OUTPUT4
Text GLabel 4650 7250 2    60   Input ~ 0
ACC_OUTPUT5
Text GLabel 4650 7400 2    60   Input ~ 0
ACC_OUTPUT6
Text GLabel 4650 7550 2    60   Input ~ 0
ACC_OUTPUT7
$Comp
L LED D45
U 1 1 5AEE255A
P 9650 5100
F 0 "D45" H 9650 5200 50  0000 C CNN
F 1 "LED" H 9650 5000 50  0000 C CNN
F 2 "" H 9650 5100 50  0001 C CNN
F 3 "" H 9650 5100 50  0001 C CNN
	1    9650 5100
	1    0    0    -1  
$EndComp
$Comp
L R R55
U 1 1 5AEE2561
P 9250 5100
F 0 "R55" V 9330 5100 50  0000 C CNN
F 1 "330" V 9250 5100 50  0000 C CNN
F 2 "" V 9180 5100 50  0001 C CNN
F 3 "" H 9250 5100 50  0001 C CNN
	1    9250 5100
	0    -1   -1   0   
$EndComp
$Comp
L LED D46
U 1 1 5AEE2568
P 9650 5450
F 0 "D46" H 9650 5550 50  0000 C CNN
F 1 "LED" H 9650 5350 50  0000 C CNN
F 2 "" H 9650 5450 50  0001 C CNN
F 3 "" H 9650 5450 50  0001 C CNN
	1    9650 5450
	1    0    0    -1  
$EndComp
$Comp
L R R56
U 1 1 5AEE256F
P 9250 5450
F 0 "R56" V 9330 5450 50  0000 C CNN
F 1 "330" V 9250 5450 50  0000 C CNN
F 2 "" V 9180 5450 50  0001 C CNN
F 3 "" H 9250 5450 50  0001 C CNN
	1    9250 5450
	0    -1   -1   0   
$EndComp
$Comp
L LED D47
U 1 1 5AEE2576
P 9650 5800
F 0 "D47" H 9650 5900 50  0000 C CNN
F 1 "LED" H 9650 5700 50  0000 C CNN
F 2 "" H 9650 5800 50  0001 C CNN
F 3 "" H 9650 5800 50  0001 C CNN
	1    9650 5800
	1    0    0    -1  
$EndComp
$Comp
L R R57
U 1 1 5AEE257D
P 9250 5800
F 0 "R57" V 9330 5800 50  0000 C CNN
F 1 "330" V 9250 5800 50  0000 C CNN
F 2 "" V 9180 5800 50  0001 C CNN
F 3 "" H 9250 5800 50  0001 C CNN
	1    9250 5800
	0    -1   -1   0   
$EndComp
$Comp
L LED D48
U 1 1 5AEE2584
P 9650 6150
F 0 "D48" H 9650 6250 50  0000 C CNN
F 1 "LED" H 9650 6050 50  0000 C CNN
F 2 "" H 9650 6150 50  0001 C CNN
F 3 "" H 9650 6150 50  0001 C CNN
	1    9650 6150
	1    0    0    -1  
$EndComp
$Comp
L R R58
U 1 1 5AEE258B
P 9250 6150
F 0 "R58" V 9330 6150 50  0000 C CNN
F 1 "330" V 9250 6150 50  0000 C CNN
F 2 "" V 9180 6150 50  0001 C CNN
F 3 "" H 9250 6150 50  0001 C CNN
	1    9250 6150
	0    -1   -1   0   
$EndComp
$Comp
L LED D49
U 1 1 5AEE2592
P 9650 6500
F 0 "D49" H 9650 6600 50  0000 C CNN
F 1 "LED" H 9650 6400 50  0000 C CNN
F 2 "" H 9650 6500 50  0001 C CNN
F 3 "" H 9650 6500 50  0001 C CNN
	1    9650 6500
	1    0    0    -1  
$EndComp
$Comp
L R R59
U 1 1 5AEE2599
P 9250 6500
F 0 "R59" V 9330 6500 50  0000 C CNN
F 1 "330" V 9250 6500 50  0000 C CNN
F 2 "" V 9180 6500 50  0001 C CNN
F 3 "" H 9250 6500 50  0001 C CNN
	1    9250 6500
	0    -1   -1   0   
$EndComp
$Comp
L LED D50
U 1 1 5AEE25A0
P 9650 6850
F 0 "D50" H 9650 6950 50  0000 C CNN
F 1 "LED" H 9650 6750 50  0000 C CNN
F 2 "" H 9650 6850 50  0001 C CNN
F 3 "" H 9650 6850 50  0001 C CNN
	1    9650 6850
	1    0    0    -1  
$EndComp
$Comp
L R R60
U 1 1 5AEE25A7
P 9250 6850
F 0 "R60" V 9330 6850 50  0000 C CNN
F 1 "330" V 9250 6850 50  0000 C CNN
F 2 "" V 9180 6850 50  0001 C CNN
F 3 "" H 9250 6850 50  0001 C CNN
	1    9250 6850
	0    -1   -1   0   
$EndComp
$Comp
L LED D51
U 1 1 5AEE25AE
P 9650 7200
F 0 "D51" H 9650 7300 50  0000 C CNN
F 1 "LED" H 9650 7100 50  0000 C CNN
F 2 "" H 9650 7200 50  0001 C CNN
F 3 "" H 9650 7200 50  0001 C CNN
	1    9650 7200
	1    0    0    -1  
$EndComp
$Comp
L R R61
U 1 1 5AEE25B5
P 9250 7200
F 0 "R61" V 9330 7200 50  0000 C CNN
F 1 "330" V 9250 7200 50  0000 C CNN
F 2 "" V 9180 7200 50  0001 C CNN
F 3 "" H 9250 7200 50  0001 C CNN
	1    9250 7200
	0    -1   -1   0   
$EndComp
$Comp
L LED D52
U 1 1 5AEE25BC
P 9650 7550
F 0 "D52" H 9650 7650 50  0000 C CNN
F 1 "LED" H 9650 7450 50  0000 C CNN
F 2 "" H 9650 7550 50  0001 C CNN
F 3 "" H 9650 7550 50  0001 C CNN
	1    9650 7550
	1    0    0    -1  
$EndComp
$Comp
L R R62
U 1 1 5AEE25C3
P 9250 7550
F 0 "R62" V 9330 7550 50  0000 C CNN
F 1 "330" V 9250 7550 50  0000 C CNN
F 2 "" V 9180 7550 50  0001 C CNN
F 3 "" H 9250 7550 50  0001 C CNN
	1    9250 7550
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR026
U 1 1 5AEE25CA
P 9050 7750
F 0 "#PWR026" H 9050 7500 50  0001 C CNN
F 1 "GND" H 9050 7600 50  0000 C CNN
F 2 "" H 9050 7750 50  0001 C CNN
F 3 "" H 9050 7750 50  0001 C CNN
	1    9050 7750
	1    0    0    -1  
$EndComp
Text GLabel 9900 5100 2    60   Input ~ 0
ACC_OUTPUT0
Text GLabel 9900 5450 2    60   Input ~ 0
ACC_OUTPUT1
Text GLabel 9900 5800 2    60   Input ~ 0
ACC_OUTPUT2
Text GLabel 9900 6150 2    60   Input ~ 0
ACC_OUTPUT3
Text GLabel 9900 6500 2    60   Input ~ 0
ACC_OUTPUT4
Text GLabel 9900 6850 2    60   Input ~ 0
ACC_OUTPUT5
Text GLabel 9900 7200 2    60   Input ~ 0
ACC_OUTPUT6
Text GLabel 9900 7550 2    60   Input ~ 0
ACC_OUTPUT7
Text HLabel 2350 7900 0    60   Input ~ 0
/ALU_IN
Text HLabel 1600 6350 2    60   BiDi ~ 0
BUS_DATA[0..7]
Entry Wire Line
	1550 6450 1650 6550
Entry Wire Line
	1550 6600 1650 6700
Entry Wire Line
	1550 6750 1650 6850
Entry Wire Line
	1550 6900 1650 7000
Entry Wire Line
	1550 7050 1650 7150
Entry Wire Line
	1550 7200 1650 7300
Entry Wire Line
	1550 7350 1650 7450
Entry Wire Line
	1550 7500 1650 7600
Text Label 1700 6550 0    60   ~ 0
BUS_DATA0
Text Label 1700 6700 0    60   ~ 0
BUS_DATA1
Text Label 1700 6850 0    60   ~ 0
BUS_DATA2
Text Label 1700 7000 0    60   ~ 0
BUS_DATA3
Text Label 1700 7150 0    60   ~ 0
BUS_DATA4
Text Label 1700 7300 0    60   ~ 0
BUS_DATA5
Text Label 1700 7450 0    60   ~ 0
BUS_DATA6
Text Label 1700 7600 0    60   ~ 0
BUS_DATA7
Text Notes 2450 6200 2    60   ~ 12
Input from DATA bus
Text GLabel 2650 1300 0    60   Input ~ 0
ACC_OUTPUT0
Text GLabel 2650 1450 0    60   Input ~ 0
ACC_OUTPUT1
Text GLabel 2650 1600 0    60   Input ~ 0
ACC_OUTPUT2
Text GLabel 2650 1750 0    60   Input ~ 0
ACC_OUTPUT3
Connection ~ 1200 2850
Wire Wire Line
	1200 4950 1200 2850
Wire Wire Line
	2850 2950 1100 2950
Wire Wire Line
	1200 4950 2850 4950
Wire Wire Line
	1100 2850 2850 2850
Wire Wire Line
	2800 5050 2850 5050
Wire Wire Line
	2800 5300 2800 5050
Wire Wire Line
	4850 5300 2800 5300
Wire Wire Line
	4850 2500 4850 5300
Wire Wire Line
	4250 2500 5300 2500
Wire Wire Line
	1300 4800 2850 4800
Wire Wire Line
	1300 2700 1300 4800
Wire Wire Line
	1100 2700 2850 2700
Wire Wire Line
	1400 4700 2850 4700
Wire Wire Line
	1400 2600 1400 4700
Wire Wire Line
	1100 2600 2850 2600
Wire Wire Line
	1500 4600 2850 4600
Wire Wire Line
	1500 2500 1500 4600
Wire Wire Line
	1100 2500 2850 2500
Wire Wire Line
	1600 4500 2850 4500
Wire Wire Line
	1600 2400 1600 4500
Wire Wire Line
	1100 2400 2850 2400
Wire Bus Line
	1950 1050 1900 1050
Wire Bus Line
	1900 1050 1900 4400
Wire Wire Line
	2000 4350 2850 4350
Wire Wire Line
	2850 4250 2000 4250
Wire Wire Line
	2000 4150 2850 4150
Wire Wire Line
	2850 4050 2000 4050
Wire Wire Line
	2000 1950 2850 1950
Wire Wire Line
	2850 2050 2000 2050
Wire Wire Line
	2000 2150 2850 2150
Wire Wire Line
	2850 2250 2000 2250
Connection ~ 1600 2400
Connection ~ 1500 2500
Connection ~ 1400 2600
Connection ~ 1300 2700
Wire Wire Line
	4250 2600 5400 2600
Wire Wire Line
	4250 4700 5000 4700
Wire Wire Line
	5000 4700 5000 2800
Wire Wire Line
	5000 2800 5400 2800
Wire Wire Line
	6650 2700 6600 2700
Wire Wire Line
	5000 2500 5000 1800
Wire Wire Line
	5000 1800 5350 1800
Connection ~ 4850 2500
Wire Wire Line
	5150 2000 5350 2000
Wire Wire Line
	5150 2000 5150 4600
Wire Wire Line
	4250 4600 5450 4600
Connection ~ 5150 4600
Wire Wire Line
	5300 2500 5300 3350
Wire Wire Line
	5300 3350 5400 3350
Connection ~ 5000 2500
Wire Wire Line
	5300 3550 5400 3550
Wire Wire Line
	5300 4600 5300 3550
Wire Wire Line
	6550 1900 6650 1900
Wire Wire Line
	6600 3450 6650 3450
Wire Wire Line
	7850 2450 8000 2450
Wire Wire Line
	7100 5100 7200 5100
Wire Wire Line
	7100 5450 7200 5450
Wire Wire Line
	7100 5800 7200 5800
Wire Wire Line
	7100 6150 7200 6150
Wire Wire Line
	7100 6500 7200 6500
Wire Wire Line
	7100 6850 7200 6850
Wire Wire Line
	7100 7200 7200 7200
Wire Wire Line
	7100 7550 7200 7550
Wire Wire Line
	6800 5100 6750 5100
Wire Wire Line
	6750 5450 6800 5450
Wire Wire Line
	6750 5800 6800 5800
Connection ~ 6750 5450
Wire Wire Line
	6750 6150 6800 6150
Connection ~ 6750 5800
Wire Wire Line
	6750 6500 6800 6500
Connection ~ 6750 6150
Wire Wire Line
	6750 6850 6800 6850
Connection ~ 6750 6500
Wire Wire Line
	6750 7200 6800 7200
Connection ~ 6750 6850
Wire Wire Line
	6750 7550 6800 7550
Connection ~ 6750 7200
Connection ~ 6750 7550
Wire Wire Line
	7500 5100 7600 5100
Wire Wire Line
	7600 5450 7500 5450
Wire Wire Line
	7500 5800 7600 5800
Wire Wire Line
	7600 6150 7500 6150
Wire Wire Line
	7500 6500 7600 6500
Wire Wire Line
	7600 6850 7500 6850
Wire Wire Line
	7500 7200 7600 7200
Wire Wire Line
	7600 7550 7500 7550
Wire Wire Line
	6750 5100 6750 7750
Wire Bus Line
	10600 1350 10650 1350
Wire Bus Line
	10650 1350 10650 2550
Wire Wire Line
	10550 1700 9800 1700
Wire Wire Line
	10550 1850 9750 1850
Wire Wire Line
	10550 2000 9700 2000
Wire Wire Line
	10550 2150 9650 2150
Wire Wire Line
	10550 2300 9600 2300
Wire Wire Line
	10550 2450 9550 2450
Wire Wire Line
	10550 2600 9500 2600
Wire Wire Line
	9400 1650 9800 1650
Wire Wire Line
	9800 1650 9800 1700
Wire Wire Line
	9400 1750 9750 1750
Wire Wire Line
	9750 1750 9750 1850
Wire Wire Line
	9700 2000 9700 1850
Wire Wire Line
	9700 1850 9400 1850
Wire Wire Line
	9650 2150 9650 1950
Wire Wire Line
	9650 1950 9400 1950
Wire Wire Line
	9600 2300 9600 2050
Wire Wire Line
	9600 2050 9400 2050
Wire Wire Line
	9550 2450 9550 2150
Wire Wire Line
	9550 2150 9400 2150
Wire Wire Line
	9500 2600 9500 2250
Wire Wire Line
	9500 2250 9400 2250
Wire Wire Line
	8000 2550 7950 2550
Wire Wire Line
	7950 2550 7950 2700
Wire Wire Line
	7950 2700 7900 2700
Connection ~ 5300 4600
Wire Wire Line
	5450 4950 5350 4950
Wire Wire Line
	9400 1550 10550 1550
Wire Wire Line
	2750 7450 2850 7450
Wire Wire Line
	4250 6500 4650 6500
Wire Wire Line
	4250 6600 4600 6600
Wire Wire Line
	4600 6600 4600 6650
Wire Wire Line
	4600 6650 4650 6650
Wire Wire Line
	4250 6700 4550 6700
Wire Wire Line
	4550 6700 4550 6800
Wire Wire Line
	4550 6800 4650 6800
Wire Wire Line
	4250 6800 4500 6800
Wire Wire Line
	4500 6800 4500 6950
Wire Wire Line
	4500 6950 4650 6950
Wire Wire Line
	4250 6900 4450 6900
Wire Wire Line
	4450 6900 4450 7100
Wire Wire Line
	4450 7100 4650 7100
Wire Wire Line
	4250 7000 4400 7000
Wire Wire Line
	4400 7000 4400 7250
Wire Wire Line
	4400 7250 4650 7250
Wire Wire Line
	4250 7100 4350 7100
Wire Wire Line
	4350 7100 4350 7400
Wire Wire Line
	4350 7400 4650 7400
Wire Wire Line
	4250 7200 4300 7200
Wire Wire Line
	4300 7200 4300 7550
Wire Wire Line
	4300 7550 4650 7550
Wire Wire Line
	2750 7450 2750 7750
Wire Wire Line
	2750 7750 2350 7750
Wire Wire Line
	2850 7550 2800 7550
Wire Wire Line
	2800 7550 2800 7900
Wire Wire Line
	2800 7900 2350 7900
Wire Wire Line
	9400 5100 9500 5100
Wire Wire Line
	9400 5450 9500 5450
Wire Wire Line
	9400 5800 9500 5800
Wire Wire Line
	9400 6150 9500 6150
Wire Wire Line
	9400 6500 9500 6500
Wire Wire Line
	9400 6850 9500 6850
Wire Wire Line
	9400 7200 9500 7200
Wire Wire Line
	9400 7550 9500 7550
Wire Wire Line
	9100 5100 9050 5100
Wire Wire Line
	9050 5450 9100 5450
Wire Wire Line
	9050 5800 9100 5800
Connection ~ 9050 5450
Wire Wire Line
	9050 6150 9100 6150
Connection ~ 9050 5800
Wire Wire Line
	9050 6500 9100 6500
Connection ~ 9050 6150
Wire Wire Line
	9050 6850 9100 6850
Connection ~ 9050 6500
Wire Wire Line
	9050 7200 9100 7200
Connection ~ 9050 6850
Wire Wire Line
	9050 7550 9100 7550
Connection ~ 9050 7200
Connection ~ 9050 7550
Wire Wire Line
	9800 5100 9900 5100
Wire Wire Line
	9900 5450 9800 5450
Wire Wire Line
	9800 5800 9900 5800
Wire Wire Line
	9900 6150 9800 6150
Wire Wire Line
	9800 6500 9900 6500
Wire Wire Line
	9900 6850 9800 6850
Wire Wire Line
	9800 7200 9900 7200
Wire Wire Line
	9900 7550 9800 7550
Wire Wire Line
	9050 5100 9050 7750
Wire Bus Line
	1600 6350 1550 6350
Wire Bus Line
	1550 6350 1550 7550
Wire Wire Line
	1650 6700 2400 6700
Wire Wire Line
	1650 6850 2450 6850
Wire Wire Line
	1650 7000 2500 7000
Wire Wire Line
	1650 7150 2550 7150
Wire Wire Line
	1650 7300 2600 7300
Wire Wire Line
	1650 7450 2650 7450
Wire Wire Line
	1650 7600 2700 7600
Wire Wire Line
	2850 6650 2400 6650
Wire Wire Line
	2400 6650 2400 6700
Wire Wire Line
	2850 6750 2450 6750
Wire Wire Line
	2450 6750 2450 6850
Wire Wire Line
	2500 7000 2500 6850
Wire Wire Line
	2500 6850 2850 6850
Wire Wire Line
	2550 7150 2550 6950
Wire Wire Line
	2550 6950 2850 6950
Wire Wire Line
	2600 7300 2600 7050
Wire Wire Line
	2600 7050 2850 7050
Wire Wire Line
	2650 7450 2650 7150
Wire Wire Line
	2650 7150 2850 7150
Wire Wire Line
	2700 7600 2700 7250
Wire Wire Line
	2700 7250 2850 7250
Wire Wire Line
	2850 6550 1650 6550
Wire Wire Line
	2850 1550 2850 1300
Wire Wire Line
	2850 1300 2650 1300
Wire Wire Line
	2850 1650 2800 1650
Wire Wire Line
	2800 1650 2800 1450
Wire Wire Line
	2800 1450 2650 1450
Wire Wire Line
	2650 1600 2750 1600
Wire Wire Line
	2750 1600 2750 1750
Wire Wire Line
	2750 1750 2850 1750
Wire Wire Line
	2850 1850 2650 1850
Wire Wire Line
	2650 1850 2650 1750
Text GLabel 2650 3400 0    60   Input ~ 0
ACC_OUTPUT4
Text GLabel 2650 3550 0    60   Input ~ 0
ACC_OUTPUT5
Text GLabel 2650 3700 0    60   Input ~ 0
ACC_OUTPUT6
Text GLabel 2650 3850 0    60   Input ~ 0
ACC_OUTPUT7
Wire Wire Line
	2850 3950 2650 3950
Wire Wire Line
	2650 3950 2650 3850
Wire Wire Line
	2650 3400 2850 3400
Wire Wire Line
	2850 3400 2850 3650
Wire Wire Line
	2850 3750 2800 3750
Wire Wire Line
	2800 3750 2800 3550
Wire Wire Line
	2800 3550 2650 3550
Wire Wire Line
	2650 3700 2750 3700
Wire Wire Line
	2750 3700 2750 3850
Wire Wire Line
	2750 3850 2850 3850
$EndSCHEMATC
