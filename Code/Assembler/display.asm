# Program that outputs data from VRAM to the LCD display
#
# TODO: Assembler
#		- replace ST C & ST D with MOV+ST
#		- replace LD C 0x00 with LD C 0xFE00 (faux zero page support)

:main

	MVI B 0xBE		# VRAM starts at 0xBE00.
	MVI A 0x00		#
	ST B 0x00		# VRAM address is stored in zero page RAM at 0x00.
	ST A 0x01		# 

	MVI A 0xFF		# Reset LCD display by sending 0xFF.
	OUT 2 A			#

	MVI B 0x3F		# Start counter at 64.
	ST B 0x02		# Store counter in zero page RAM at 0x02.

:outputnext

	LDX A 0xFE00	# Load byte from VRAM address that is stored at 0xFE00 (zero page 0x00).
					# Leaves C & D filled with low/high byte of VRAM address.
	OUT 2 A			# Output byte to LCD display.
	
	MOV AX C 		# Increase low VRAM address byte (A).
	INC A			# 
	MOV B D			# Copy high VRAM address byte (B).
	ST A 0x01		# Store low VRAM address byte in RAM.

	JZ incvramhbyte		# If there is a carry, we must increase the high byte and start low byte at zero.
	:ret_incvramhbyte	#

	JMP outputnext
	
:done

	HALT


:incvramhbyte

	MOV AX B		# Increase VRAM high byte.
	INC B			#
	MVI A 0x00		# Reset VRAM low byte to zero.

	ST B 0x00		# Store VRAM address in RAM.
	ST A 0x01		#

	LD AX 0x02		# Decrease counter.
	DEC B			#
	ST B 0x02		# Store counter in RAM.

	JNZ ret_incvramhbyte	# Counter is not zero, continue outputting VRAM data.
	JMP done				# Counter is zero, we are done outputting VRAM data.
