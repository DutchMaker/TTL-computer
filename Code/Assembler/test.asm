:main

	MVI A 0x03

:loop1
	MOV A AX
	
	# Count down from 3

	DEC A
	JNZ loop1

	MVI A 0x48
	OUT 1 A

	MVI A 0x65
	OUT 1 A

	MVI A 0x6c
	OUT 1 A

	MVI A 0x6c
	OUT 1 A

	MVI A 0x6f 
	OUT 1 A

	MVI A 0x20 
	OUT 1 A

	MVI A 0x57
	OUT 1 A

	MVI A 0x6f
	OUT 1 A

	MVI A 0x72
	OUT 1 A
	
	MVI A 0x6c
	OUT 1 A

	MVI A 0x64
	OUT 1 A

	MVI A 0x21
	OUT 1 A
	
	NOP

	NOP

	NOP

	HALT