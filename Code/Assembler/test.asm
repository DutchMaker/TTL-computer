:main

	MVI AX 0xFE
	MVI AY 0xF1
	CMP

	JGT equal
	JLT notequal

:resume
	MVI AX 0x03
	MVI AY 0x05
	CMP

	JLT equal2
	JGT notequal2

	HALT

:equal
	MVI A 0x11
	JMP resume

:notequal
	MVI A 0x22
	JMP resume

:equal2
	MVI B 0x11
	HALT

:notequal2
	MVI B 0x22
	HALT
