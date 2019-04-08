:main

	MVI A 0xFF
	
:again
	MOV A AX
	SHR A
	
	JNZ again

:done
	MVI B 0x11
	
	HALT
