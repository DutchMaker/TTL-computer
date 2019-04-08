:main

	*i = 0x4000
	*j = 0x4001

	MVI A 0x01
	ST A *i
	LD AX *i

	MVI A 0x02
	ST A *j
	LD AY *j

	ADD A
	
	HALT
