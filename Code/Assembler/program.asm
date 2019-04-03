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
# MOV (A,B,C,D) (A,B,C,D)
#	Function:	Copy value from register 1 to register 2.
#	Example:	MOV A,B;
#
# MVI (A,B,C,D) byte
#	Function: 	Store immediate value (hex) into register.
#	Example:	MVI A,0xff;
#
# LD (A,B) h-address l-address
#	Function:	
#	Example:	
#
# ST (A,B) h-address l-address
#	Function:	
#	Example:	
#
# ADD (A,C,D)
#	Function:	
#	Example:	
#
# ADC (A,C,D)
#	Function:	
#	Example:	
#
# SUB (A,C,D)
#	Function:	
#	Example:	
#
# SBC (A,C,D)
#	Function:	
#	Example:	
#
# AND (A,C,D)
#	Function:	
#	Example:	
#
# OR (A,C,D)
#	Function:	
#	Example:	
#
# XOR (A,B,C,D)
#	Function:	
#	Example:	
#
# NOT (A,B,C,D)
#	Function:	
#	Example:	
#
# INC (A,B,C,D)
#	Function:	
#	Example:	
#
# DEC (A,B,C,D)
#	Function:	
#	Example:	
#
# CMP (A,C,D)
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
# IN (A,B,C,D)
#	Function:	
#	Example:	
#
# OUT (1,2) (A,B,C,D)
#	Function:	
#	Example:	
#
#
# TODO:
# - Labels
# - Data blocks
# - Variables
#

:main
	
	MVI A 0xB1;
	MOV A B;

	MVI C 0xA2;
	MOV C A;

	MVI D 0xC3;
	MOV D C;

	MVI D 0xD4;

	CALL label1;

	HALT;

:end:main


:label1

	ST A 0x40 0x00;
	ST B 0x40 0x01;

	CALL label2;

	RET;

:end:label1


:label2

	LD B 0x40 0x00;
	LD A 0x40 0x01;

	RET;

:end:label2