# Example 74xx program
#
# Instruction set:
#
# NOP
# 	Function:	Do nothing.
# 	Example:	NOP;
#
# HALT
#	Function:	Halt execution (halts CPU clock).
#	Example:	HALT;
#
# MOV r1(A,B,C,D) r2(A,B,C,D)
#	Function:	Copy value from register r1 to register r2.
#	Example:	MOV A B;
#
# MVI r(A,B,C,D) byte
#	Function: 	Store immediate value (hex) into register r.
#	Example:	MVI A 0xff;
#
# LD r(A,B) h-address l-address
#	Function:	
#	Example:	
#
# ST r(A,B) h-address l-address
#	Function:	
#	Example:	
#
# ADD r(A,C,D)
#	Function:	
#	Example:	
#
# ADC r(A,C,D)
#	Function:	
#	Example:	
#
# SUB r(A,C,D)
#	Function:	
#	Example:	
#
# SBC r(A,C,D)
#	Function:	
#	Example:	
#
# AND r(A,C,D)
#	Function:	
#	Example:	
#
# OR r(A,C,D)
#	Function:	
#	Example:	
#
# XOR r(A,B,C,D)
#	Function:	
#	Example:	
#
# NOT r(A,B,C,D)
#	Function:	
#	Example:	
#
# INC r(A,B,C,D)
#	Function:	
#	Example:	
#
# DEC r(A,B,C,D)
#	Function:	
#	Example:	
#
# CMP r(A,C,D)
#	Function:	
#	Example:	
#
# JMP label
#	Function:	
#	Example:	
#
# JZ label
#	Function:	
#	Example:	
#
# JNZ label
#	Function:	
#	Example:	
#
# JC label
#	Function:	
#	Example:	
#
# JNC label
#	Function:	
#	Example:	
#
# JEQ label
#	Function:	
#	Example:	
#
# JLT label
#	Function:	
#	Example:	
#
# JGT label
#	Function:	
#	Example:	
#
# CALL label
#	Function:	
#	Example:	
#
# RET
#	Function:	
#	Example:	
#
# IN r(A,B,C,D)
#	Function:	
#	Example:	
#
# OUT o(1,2) r(A,B,C,D)
#	Function:	
#	Example:	
#
#
# TODO:
# - Labels
# - Data blocks
# - Variables
#

:data

	# :data label starts definition of ROM data.
	# If defined, the :data label MUST be defined before :main.

	0x3000: 0xA0 0xB1 0xC2 0xD3;
	0x3010: 0x01 0x02 0x03 0x04
			0x05 0x06 0x07 0x08;


:main

	# Program execution starts at the :main label.
	# This must be either the first label in the program,
	# or the first one after the :data label.
	
	MVI A 0xB1
	MOV A B

	MVI C 0xA2
	MOV C A

	MVI D 0xC3
	MOV D C

	MVI D 0xD4

	CALL label1

	JMP label3

	:testlabel
	MOV A B

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