# 74xxx Computer Test Program
#
# This program is used to test all of the 74xxx modules.
#

:data
	0x3000: 0xAA 0xBB 0xCC 0xDD 0xA0 0xA1;
	0x3010: 0x01 0x02 0x03 0x04;

:main

	JMP skip

	MVI A 0xAA		# Immediate load into register A
	MOV B A			# Move A into B
	MOV C A			# Move A into C
	MOV D A			# Move A into D
	MOV AX A		# Move A into AX
	MOV AY A		# Move A into AY

	MVI B 0xBB		# Immediate load into register B
	MOV A B			# Move B into A
	MOV C B			# Move B into C
	MOV D B			# Move B into D
	MOV AX B		# Move B into AX
	MOV AY B		# Move B into AY

	MVI C 0xCC		# Immediate load into register C
	MOV A C			# Move C into A
	MOV B C			# Move C into B
	MOV D C			# Move C into D
	MOV AX C		# Move C into AX
	MOV AY C		# Move C into AY

	MVI D 0xDD		# Immediate load into register D
	MOV A D			# Move D into A
	MOV B D			# Move D into B
	MOV C D			# Move D into C
	MOV AX D		# Move D into AX
	MOV AY D		# Move D into AY

	MVI AX 0xA0		# Immediate load into register AX
	MVI AY 0xA1		# Immediate load into register AY

#---
	LD A 0x3000		# Load data from memory into register A
	LD B 0x3001		# Load data from memory into register B
	LD C 0x3002		# Load data from memory into register C
	LD D 0x3003		# Load data from memory into register D
	LD AX 0x3004	# Load data from memory into register AX
	LD AY 0x3005	# Load data from memory into register AY

#---
	*a = 0x4000
	*b = 0x4001

	MVI A 0xAA		# Immediate load 0xAA into register A
	ST A *a			# Store A at memory location 0x4000
	MVI B 0xBB		# Immediate load 0xBB into register B
	ST B *b			# Store B at memory location 0x4001
	LD A *b			# Load data from memory 0x4001 into register A
	LD B *a			# Load data from memory 0x4000 into register B

#---
	MVI A 0x03		# Immediate load 0x03 into register A
	ST A 0x00		# Store A at zero-page memory location 0x00
	MVI B 0x04		# Immediate load 0x04 into register B
	ST B 0x01		# Store B at zero-page memory location 0x01
	LD A 0x01		# Load data from zero-page memory location 0x01 into register A
	LD B 0x00		# Load data from zero-page memory location 0x00 into register B
	LD D 0x01		# Load data from zero-page memory location 0x01 into register D
	LD AX 0x00		# Load data from zero-page memory location 0x00 into register AX

#---
	MVI D 0x30		# Immediate load 0x3010 into C/D pair
	MVI C 0x10
	LDR A			# Load data from memory location 0x3010 into A
	LDR B			# Load data from memory location 0x3010 into B
	LDR AX			# Load data from memory location 0x3010 into AX
	LDR AY			# Load data from memory location 0x3010 into AY
	LDR C			# Load data from memory location 0x3010 into C
	MVI D 0x30		# Immediate load 0x3010 into C/D pair
	MVI C 0x10
	LDR D			# Load data from memory location 0x3010 into D

#---
	MVI D 0x40		# Immediate load 0x4000 into C/D pair
	MVI C 0x00
	MVI A 0xAA
	STR A			# Store 0xAA at memory location 0x4000

	MVI D 0x40		# Immediate load 0x4001 into C/D pair
	MVI C 0x01
	MVI B 0xBB
	STR B			# Store 0xBB at memory location 0x4001

	LD A 0x4001		# Load from memory (value 0xBB)
	LD B 0x4000		# Load from memory (value 0xAA)

#---
	MVI C 0x10		# Zero-page memory location
	MVI A 0xAA
	STRZ A
	LDRZ B			# A & B should now contain 0xAA

	MVI C 0x11		# Zero-page memory location
	MVI B 0xBB
	STRZ B

	LDRZ A
	LDRZ B
	LDRZ D
	LDRZ AX
	LDRZ AY
	LDRZ C			# All registers should now contain 0xBB

#---
	MVI A 0x30
	ST A 0x4000
	MVI A 0x10
	ST A 0x4001

	LDX A 0x4000	# Should return 0x01
	LDX B 0x4000	# Should return 0x01
	LDX C 0x4000	# Should return 0x01
	LDX D 0x4000	# Should return 0x01

#---
	MVI A 0x40
	ST A 0x4000
	MVI A 0x10
	ST A 0x4001

	MVI A 0xAA
	STX A 0x4000

	LD B 0x4010		# B should now contain 0xAA

	MVI A 0xBB
	STX A 0x4000
	MVI A 0x00

	LD A 0x4010		# A should now contain 0xBB

#---
	MVI A 0x01		# Push/pop 3 times on all possible registers
	PUSH A
	MVI A 0x02
	PUSH A
	MVI A 0x03
	PUSH A
	POP B
	POP B
	POP B

	MVI B 0x01
	PUSH B
	MVI B 0x02
	PUSH B
	MVI B 0x03
	PUSH B
	POP A
	POP A
	POP A

	MVI C 0x01
	PUSH C
	MVI C 0x02
	PUSH C
	MVI C 0x03
	PUSH C
	POP D
	POP D
	POP D

	MVI D 0x01
	PUSH D
	MVI D 0x02
	PUSH D
	MVI D 0x03
	PUSH D
	POP C
	POP C
	POP C

	MVI A 0x01
	PUSH A
	MVI A 0x02
	PUSH A
	MVI A 0x03
	PUSH A
	POP AX
	POP AX
	POP AX

	MVI A 0x01
	PUSH A
	MVI A 0x02
	PUSH A
	MVI A 0x03
	PUSH A
	POP AY
	POP AY
	POP AY

#---
	SC 1	# Set carry flag to 1
	SC 0	# Set carry flag to 0

	SC 1
	SC 0

	SC 1
	SC 0

#---
	MVI AX 0x01
	MVI AY 0x02
	ADD A			# Should be 0x03

	MVI AX 0xFA
	MVI AY 0xFA
	ADD B			# Should be 0xF4 with carry

	MVI AX 0x01
	MVI AY 0x01
	ADC C			# Should be 0x03

	MVI AX 0x00
	MVI AY 0x00
	ADD D			# Zero flag should be 1

#---
	MVI AX 0x02
	MVI AY 0x01
	SUB A			# Should be 0x01 (carry is on)

	MVI AY 0x03
	SUB B			# Should be 0xFF (carry is off)

	MVI AX 0x02
	MVI AY 0x01
	SBC C			# Should be 0x00 with zero flag

#---
	MVI AX 0x00
	INC A
	MOV AX A
	INC A
	MOV AX A
	INC A			# A should be 0x03

	MVI AX 0x00
	INC B
	MOV AX B
	INC B
	MOV AX B
	INC B			# B should be 0x03

	MVI AX 0x00
	INC C
	MOV AX C
	INC C
	MOV AX C
	INC C			# C should be 0x03

	MVI AX 0x00
	INC D
	MOV AX D
	INC D
	MOV AX D
	INC D			# D should be 0x03

	MVI AX 0x03
	DEC A
	MOV AX A
	DEC A
	MOV AX A
	DEC A			# A should be 0x00

	MVI AX 0x03
	DEC B
	MOV AX B
	DEC B
	MOV AX B
	DEC B			# B should be 0x00

	MVI AX 0x03
	DEC C
	MOV AX C
	DEC C
	MOV AX C
	DEC C			# C should be 0x00

	MVI AX 0x03
	DEC D
	MOV AX D
	DEC D
	MOV AX D
	DEC D			# D should be 0x00

	MVI AX 0xFF
	INC A			# Carry and zero should be 1

#---
:skip
	

	HALT