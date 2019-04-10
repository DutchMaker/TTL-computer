:data
	0x3000: "HELLO WORLD! I'm alive!! :-)";

:main

	MVI A 0x30
	ST A 0x4000		# 0x4000: 0x30

	MVI A 0x00

:nextchar
	ST A 0x4001		# Store lower byte of memory address pointing to current character

	LDX A 0x4000	# Load character from memory
	OUT 1 A

	LD AX 0x4001
	INC A			# Increase lower byte of stored memory address

	MVI AY 0x1B		# Compare AX to 0x1B (decimal 27, length of the string)
	CMP

	JNE nextchar	# Loop nextchar if AX != 0x1B

	HALT