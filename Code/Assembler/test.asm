:main

	MVI A 0x02
	MVI B 0x01

	MVA A A
	MVA B B

	SUB A

	JZ test

	MVI B 0x11

	HALT

:test
	MVI B 0x99
	HALT