:data
	0x3000: "HELLO WORLD! I'm alive!! :-)";

:main

	MVI A 0x30
	ST A 0x00			# Will be automatically converted to zero page instruction STZ.

	MVI A 0x00

:nxtchr
	ST A 0x01			# Store lower byte of memory address pointing to current character
						# This gets stored in zero page memory

	LDX A 0x00			# Load character from memory (zero page indexing supported)
	OUT 1 A

	LD AX 0x01		
	INC A				# Increase lower byte of stored memory address

	MVI AY 0x1B			# Compare AX to 0x1B (decimal 27, length of the string)
	CMP EQ

	JMPC NCMP nxtchr	# Loop nextchar if AX != 0x1B

	HALT