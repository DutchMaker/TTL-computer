:main

	MVI AX 0x00
	MVI AY 0x01
	ADD CMP

	CALLC C carry
	MVI B 0x02

	HALT

:carry
	MVI A 0x01
	RET

:carry2
	MVI A 0x01
	HALT