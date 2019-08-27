# Ideas for the next CPU to build:

- Improve microcode efficiency
- Replace 74x181 ALU with EPROM-based ALU (see: <https://github.com/DoctorWkt/CSCvon8/blob/master/Docs/CSCvon8_design.md>)
- Split clock cycle in 2 phases, one where output to bus starts, second where loading from the bus starts.
- Compatibility with 8085 architecture; opens the door to conversion from 8085 assembly to vNext assembly and even re-use of 8085 C compilers
- Maybe add 16-bit register and operations? or at least a transfer register (takes 16-bit and splits it into 8-bit)
- Support for interrupts
- Be able to peek at register contents with hexadecimal feedback
- Add CPU flags for sign/negative, parity, overflow
  - Store flags in 8-bit register
  - Allows bit (ALU) operations on flags
- One MOV instruction for all data transfer operations (add addressing modes so MOV can replace MVI, LDA, STA, LDA, etc)
- Store accumulator and flags register before a CALL instruction and restore it after RET instruction

## Improve microcode efficiency and allow for more flags

Current CPU uses 19 address lines for the microcode ROM and stores state of 48 control lines in 6 separate bytes.
Ideas for improvement:

- Use rom with 16 address lines and 16 bit words (M27C1024)
- Fit all control lines in one word (or 2?)
- First 2 t-states are hardwired and excluded from t-state bits. So we can have 16 t-state with 4-bits PLUS the 2 t-state required for the fetch cycle = 18 t-state max
- Encode control lines into that word
- Decode the control word in the CPU's controller
- OUT/IN will use memory address instead of register operation (= no control lines required)
- No flags in microcode, instead use hardwired logic connected to an 8-bit flags register
- Microcode rom addr will be `[instruction(8)][t-state(4)]` = 12-bit address

### Decrease word size (encode the control lines)

Data operands (4 bits per operands, 2 operands in one microcode instruction = 8 bits):

- ALU
- A
- B
- H (was D)
- L (was C)
- Flags (treat as regular register - set/clear flag instructions use ALU operations)
- MAR_H
- MAR_L
- MEM
- PC_H
- PC_L
- STACK_H
- STACK_L
- IR
- (add 2 more GPR?)

Data functions (1 bit per operand, 2 per instruction = 2 bits):

- load
- out

Counter functions (1 bit per opererand = 2 bits):

- inc
- dec

Other functions (may take up to 4 bits):

- ALU_f0
- ALU_f1
- ALU_f2
- ALU_f3
- TSTATE_reset
- CLOCK_halt
- MAR_zp


Example control word:

- Memory out, A register load = [MEM][out][A][load][0][0000]

Important changes compared to v1:

- Flags are in one normal register
- Set/clear flag instructions is done with ALU operations
- ALU uses custom/simplified function table (4 bits)

### Flags

- Make it easy to identify flag operations in op-code
- eg. end opocode with flag bits
- 3 bits, allows for 5 flags (0 = no flag operation)
- 1 = Zero
			- 2 = Carry
		- 3 = Negative
		- 4 = Compare
		- 5 = Whatever
	
	- JN (jump in negative)	= `[10101][011]`	
		- 011 needs to be decoded to 00100
		- Execute instruction `[10101]` (= JMP) when decoded bit 3 == 1
		- Use one more bit (last) in instruction to identify if condition can be applied
		- Example `[10101]` = condition can be applied, `[10100]` is not
			So `[10100111]` is an unconditional 8 bit instruction while `[11001001]` is conditional and requires zero=1 to run




