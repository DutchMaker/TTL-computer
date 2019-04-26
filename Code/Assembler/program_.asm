# Example 74xx program
#
# See `74xx-Assembly-Language.md` for complete reference.
#

:data

	# :data label starts definition of ROM data.
	# If defined, the :data label MUST be defined before :main.

	0x3000: 0xA0 0xB1 0xC2 0xD3;
	0x3010: 0x01 0x02 0x03 0x04
			0x05 0x06 0x07 0x08;	# Note the use of the ; at the end. This is required to end the block of data.
	0x3100: "Hello world!";			# You can define character strings like this.

:main

	# Program execution starts at the :main label.
	# This must be either the first label in the program,
	# or the first one after the :data label.
	
	MVI A 0xB1
	MOV B A

	MVI C 0xA2
	MOV A C

	MVI D 0xC3
	MOV C D

	MVI D 0xD4

	*i = 0x4000		# Variable pointing to an address.
	ST D *i 		# May be used in instructions that refer to an address.

	CALL label1

	JMP label3

:testlabel
	MOV B A

	HALT


:label1

	# Additional labels may be defined to use for JMP (and similar) instructions.

	ST A 0x4000
	ST B 0x4001

	CALL label2

	RET


:label2

	LD B 0x4000
	LD A 0x4001

	RET


:label3

	LD A 0x3000
	JMP testlabel