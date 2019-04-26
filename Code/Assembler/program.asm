:main

	MVI AX 0x00
	MVI AY 0x0A
	SUB A

	JMPC C carry
	MVI B 0x02

	MVI AX 0x02
	MVI AY 0x01
	SUB A

	JMPC C carry2
	MVI A 0x02

	HALT

:carry
	MVI B 0x01
	HALT

:carry2
	MVI A 0x01
	HALT