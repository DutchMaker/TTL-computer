:main

	MVI A 0x12
	PUSH A

	MVI A 0x21
	PUSH A

	POP C
	POP D

	HALT
