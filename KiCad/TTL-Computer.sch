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
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1100 800  1200 650 
U 5ACF3206
F0 "Clock" 60
F1 "./Clock/Clock.sch" 60
F2 "CLOCK" O R 2300 1350 60 
F3 "CLK_HLT" I R 2300 900 60 
$EndSheet
$Sheet
S 1100 2100 1200 1350
U 5ACF2F0F
F0 "Register X" 60
F1 "./Register-X/Register-X.sch" 60
F2 "CLOCK" I R 2300 2200 60 
F3 "/X_IN" I R 2300 2350 60 
F4 "/X_OUT" I R 2300 2500 60 
F5 "/X_PC-IN" I R 2300 2650 60 
F6 "BUS_DATA[0..7]" B L 1100 3050 60 
F7 "BUS_PC-X_OUT[0..7]" I L 1100 3350 60 
F8 "BUS_X-MAR[0..7]" O R 2300 2900 60 
F9 "BUS_PC-X_IN[0..7]" O L 1100 3200 60 
$EndSheet
Wire Bus Line
	1100 3350 900  3350
Wire Bus Line
	900  3350 900  5500
Wire Bus Line
	900  5500 1100 5500
Wire Wire Line
	2300 1350 2500 1350
Wire Wire Line
	2500 1350 2500 6400
Wire Wire Line
	2500 2200 2300 2200
Wire Wire Line
	2500 4100 2300 4100
Connection ~ 2500 2200
Wire Bus Line
	1100 3200 750  3200
Wire Bus Line
	750  3200 750  5200
Wire Bus Line
	750  5200 1100 5200
NoConn ~ 2850 900 
Wire Wire Line
	2850 900  2300 900 
$Sheet
S 1100 6300 1200 1350
U 5AD0848F
F0 "Register Y" 60
F1 "./Register-Y/Register-Y.sch" 60
F2 "BUS_PC-Y_IN[0..7]" I L 1100 7400 60 
F3 "BUS_DATA[0..7]" B L 1100 7250 60 
F4 "CLOCK" I R 2300 6400 60 
F5 "BUS_Y-MAR[0..7]" O R 2300 7100 60 
F6 "/Y_IN" I R 2300 6550 60 
F7 "/Y_OUT" I R 2300 6700 60 
F8 "/Y_PC-IN" I R 2300 6850 60 
F9 "BUS_PC-Y_OUT[0..7]" O L 1100 7550 60 
$EndSheet
Wire Bus Line
	1100 5350 750  5350
Wire Bus Line
	750  5350 750  7400
Wire Bus Line
	750  7400 1100 7400
Wire Bus Line
	1100 5650 900  5650
Wire Bus Line
	900  5650 900  7550
Wire Bus Line
	900  7550 1100 7550
$Sheet
S 1100 4000 1200 1750
U 5ACF340E
F0 "Program Counter" 60
F1 "./Program-Counter/Program-Counter.sch" 60
F2 "/PC_X-IN" I R 2300 4250 60 
F3 "/PC_Y-IN" I R 2300 4400 60 
F4 "PC_INC" I R 2300 4550 60 
F5 "PC_DEC" I R 2300 4700 60 
F6 "CLOCK" I R 2300 4100 60 
F7 "BUS_PC-X_OUT[0..7]" O L 1100 5500 60 
F8 "BUS_PC-Y_OUT[0..7]" O L 1100 5650 60 
F9 "BUS_PC-MAR[0..15]" O R 2300 5050 60 
F10 "BUS_PC-X_IN[0..7]" I L 1100 5200 60 
F11 "BUS_PC-Y_IN[0..7]" I L 1100 5350 60 
$EndSheet
Wire Wire Line
	2500 6400 2300 6400
Connection ~ 2500 4100
$EndSCHEMATC
