# 74xx Computer Assembly Language

This document is the complete reference to the 74xx Computer Assembly Language.

**TODO:**

- Update opcodes
- Update branching instructions
- Add microcode for LDX & STX
- Update Logisim

**Contents:**

- [Structure](#structure)
- [Registers](#registers)
- [Flags](#flags)
- [Memory](#memory)
- [Instructions](#instructions)


<a name="structure"></a>
## Structure

The following code example demonstrates how to define **labels**, define and use **address variables** and **predefine ROM data**:

```
:data

	# :data label starts definition of hard-coded ROM data.
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
	... more instructions here ...

	*i = 0x4000		# You can define address variables, which
	ST D *i 		# can be used in instructions that refer to an address.
	LD A *i
	
	LD B 0x45		# 8-bit addresses refer to zero page memory (256 bytes available).
					# This example refers to 0xFE45.
	                # See section on Memory Layout in this reference.

	CALL example	# Jump to subroutine (with the ability to return).

	JMP done

:example

	MOV B A
	... more instructions here ...
	
	RET				# Jump back to the caller address.
	
:done

	HALT
```


<a name="registers"></a>
## Registers

| Register | Purpose                                                      |
| :------- | :----------------------------------------------------------- |
| A, B     | General purpose bi-directional registers.                    |
| C, D     | Bi-directional registers that may be used for general purpose, but are also used for temporary address storage by some instructions. Address *low byte* is stored in register C, while the *high byte* is stored in D. |
| AX       | Write-only register for the ALU (*accumulator*).             |
| AY       | Write-only register for the ALU (*operand*).                 |
| OUT1     | Write-only register used for output control. Can only be written to using the *OUT 1* instruction. |


<a name="flags"></a>
## Flags

| Flag | Purpose                                                                                    _ |
| :--- | :----------------------------------------------------------- |
| Fc   | ALU operation resulted in a carry                            |
| Fz   | ALU operation resulted in zero                               |
| Fcmp | Result of the last `CMP` operation                           |

<a name="memory"></a>

## Memory

The 74xx Computer has two modes of operation:

**1. Boot from ROM**  
This enables 16kb of ROM which the program counter starts at.  
Running in this modes leaves 48k of addressable RAM.

**2. RAM only**  
In this mode there is no ROM at all, just 64k of RAM.  
There is currently no way of feeding in the program code, other than flipping switches and clocking it in manually.

The different modes results in two possible memory layouts.
Memory layout when running in **boot from ROM** mode:

| Offset | Purpose          |
| :----- | :--------------- |
| 0x0000 | ROM              |
| 0x4000 | RAM              |
| 0xFE00 | Zero page memory |
| 0xFF00 | Stack space      |

Memory layout when running in **RAM only** mode:

| Offset | Purpose          |
| :----- | :--------------- |
| 0x0000 | RAM              |
| 0xFE00 | Zero page memory |
| 0xFF00 | Stack space      |

### Zero page addressing

Instructions LD, ST, LDR and STR all have a zero page based counterpart: LDZ, STR, LDRZ, STRZ.  
For example: `LD A 0xFE35` may be replaced with `LDZ A 0x35` to save a few clock cycles.  

The assembler will automatically convert these instructions if zero page addressing was used.
For example: `LD A 0x35` is automatically replaced with `LDZ A 0x35` by the assembler.

Note that **not** all registers supported by LD (etc.) are also supported by their counterpart (LDZ, etc.)!


<a name="instructions"></a>
## Instructions

**Contents:**

- General purpose instructions:
  - [NOP](#NOP)
  - [HALT](#HALT)
  - [SC](#SC)
- Data transfer instructions:
  - [MOV](#MOV)
  - [MVI](#MVI)
  - [LD](#LD)
  - [ST](#ST)
  - [LDZ](#LDZ)
  - [STZ](#STZ)
  - [LDR](#LDR)
  - [STR](#STR)
  - [LDRZ](#LDRZ)
  - [STRZ](#STRZ)
  - [LDX](#LDX)
  - [STX](#STX)
  - [OUT](#OUT)
- Arithmetic instructions: 
  - [ADD](#ADD)
  - [ADC](#ADC)
  - [SUB](#SUB)
  - [SBC](#SBC)
  - [INC](#INC)
  - [DEC](#DEC)
- Logical instructions:
  - [AND](#AND)
  - [OR](#OR)
  - [XOR](#XOR)
  - [NOT](#NOT)
  - [SHL](#SHL)
  - [SHR](#SHR)
  - [CMP](#CMP)
- Branching instructions:
  - [JMP](#JMP)
  - [JZ](#JZ)
  - [JNZ](#JNZ)
  - [JC](#JC)
  - [JNC](#JNC)
  - [JEQ](#JEQ)
  - [JNEQ](#JNEQ)
  - [JLT](#JLT)
  - [JGT](#JGT)
  - [CALL](#CALL)
  - [RET](#RET)



------
### General purpose instructions

<a name="NOP"></a>

#### NOP

|                   | Do nothing        |
| :---------------- | :---------------- |
| Syntax:           | NOP               |
| Example:          | `NOP`             |
| Instruction data: | `opcode` (1 byte) |
| T-states:         | 3                 |
| Sets flags:       | *none*            |
| Notes:            | *none*            |

**Opcodes for NOP**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `NOP`    | `0000000`             | `0x00`       |

  

------
<a name="HALT"></a>

#### HALT

|                   | Halt CPU execution |
| :---------------- | :----------------- |
| Syntax:           | HALT               |
| Example:          | `HALT`             |
| Instruction data: | `opcode` (1 byte)  |
| T-states:         | 3                  |
| Sets flags:       | *none*             |
| Notes:            | *none*             |

**Opcodes for HALT**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `HALT`   | `0000001`             | `0x01`       |

  

------
<a name="SC"></a>
#### SC

|                   | Set carry flag to *0* or *1* |
| :---------------- | :--------------------------- |
| Syntax:           | SC `(0,1)`                   |
| Example:          | `SC 0`                       |
| Instruction data: | `opcode` (1 byte)            |
| T-states:         | 4                            |
| Sets flags:       | `Fc`                         |
| Notes:            | *none*                       |

**Opcodes for SC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SC 0`   | `1101000`             | `0x68`       |
| `SC 1`   | `1101001`             | `0x69`       |

  

------
### Data transfer instructions

<a name="MOV"></a>

#### MOV

|                   | Copy data from register *R2* into register *R1* |
| :---------------- | --------------------------------------------- |
| Syntax:           | MOV *R1*`(A,B,C,D,AX,AY)` *R2*`(A,B,C,D)`     |
| Example:          | `MOV AX B`                                    |
| Instruction data: | `opcode` (1 byte)                             |
| T-states:         | 4                                             |
| Sets flags:       | *none*                                        |
| Notes:            | *none*                                        |

**Opcodes for MOV**

| Mnemonic   | Opcode (7-bit binary) | Opcode (hex) |
| :--------- | --------------------- | ------------ |
| `MOV B A`  | `0000010`             | `0x02`       |
| `MOV C A`  | `0000011`             | `0x03`       |
| `MOV D A`  | `0000100`             | `0x04`       |
| `MOV A B`  | `0000101`             | `0x05`       |
| `MOV C B`  | `0000110`             | `0x06`       |
| `MOV D B`  | `0000111`             | `0x07`       |
| `MOV A C`  | `0001000`             | `0x08`       |
| `MOV B C`  | `0001001`             | `0x09`       |
| `MOV D C`  | `0001010`             | `0x0A`       |
| `MOV A D`  | `0001011`             | `0x0B`       |
| `MOV B D`  | `0001100`             | `0x0C`       |
| `MOV C D`  | `0001101`             | `0x0D`       |
| `MOV AX A` | `1010101`             | `0x55`       |
| `MOV AX B` | `1010110`             | `0x56`       |
| `MOV AX C` | `1010111`             | `0x57`       |
| `MOV AX D` | `1011000`             | `0x58`       |
| `MOV AY A` | `1011001`             | `0x59`       |
| `MOV AY B` | `1011010`             | `0x5A`       |
| `MOV AY C` | `1011011`             | `0x5B`       |
| `MOV AY D` | `1011100`             | `0x5C`       |

  

------
<a name="MVI"></a>
#### MVI

|                   | Load immediate *data* value into register *R* |
| :---------------- | :-------------------------------------------- |
| Syntax:           | MVI *R*`(A,B,C,D,AX,AY)` *data*`(8-bit hex)`  |
| Example:          | `MVI A 0xF3`                                  |
| Instruction data: | `opcode` `data` (2 bytes)                     |
| T-states:         | 5                                             |
| Sets flags:       | *none*                                        |
| Notes:            | *none*                                        |

**Opcodes for MVI**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `MVI A`  | `0001110`             | `0x0E`       |
| `MVI B`  | `0001111`             | `0x0F`       |
| `MVI C`  | `0010000`             | `0x10`       |
| `MVI D`  | `0010001`             | `0x11`       |
| `MVI AX` | `0111101`             | `0x3D`       |
| `MVI AY` | `0111110`             | `0x3E`       |

  

------
<a name="LD"></a>
#### LD

|                   | Load data from memory *address* into register *R*            |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | LD *R*`(A,B,C,D,AX,AY)` *address*`(16-bit hex)`              |
| Example:          | `LD A 0x40F3`                                                |
| Instruction data: | `opcode` `address high byte` `address low byte` (3 bytes)    |
| T-states:         | 10                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`.                     |
|                   | Supports *address variables*.                                |
|                   | Supports zero page addressing, but **not on C & AY** register! |

**Opcodes for LD**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LD A`   | `0010010`             | `0x12`       |
| `LD B`   | `0010011`             | `0x13`       |
| `LD C`   | `1110001`             | `0x71`       |
| `LD D`   | `1110010`             | `0x72`       |
| `LD AX`  | `1101010`             | `0x6A`       |
| `LD AY`  | `1101011`             | `0x6B`       |



------
<a name="ST"></a>
#### ST

|                   | Store data from register *R* at memory *address*             |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | ST *R*`(A,B)` *address*`(16-bit hex)`                        |
| Example:          | `ST A 0x40F3`                                                |
| Instruction data: | `opcode` `address high byte` `address low byte` (3 bytes)    |
| T-states:         | 10                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`. 					   |
|                   | Supports *address variables*.                                |
|                   | Supports zero page addressing.                               |

**Opcodes for ST**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ST A`   | `0010110`             | `0x16`       |
| `ST B`   | `0010111`             | `0x17`       |



------
<a name="LDZ"></a>
#### LDZ

|                   | Load data from zero-page memory *address* into register *R*  |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | LDZ *R*`(A,B,D,AX)` *address*`(8-bit hex)`                   |
| Example:          | `LDZ A 0xF3`                                                 |
| Instruction data: | `opcode` `zero-page address byte` (2 bytes)                  |
| T-states:         | 7                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in register `C`.                              |
|                   | Supports *address variables*.                                |
|                   | Cannot operate on C and AX register because there are not enough opcodes available. |

**Opcodes for LDZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LDZ A`  | `1110111`             | `0x77`       |
| `LDZ B`  | `1111000`             | `0x78`       |
| `LDZ D`  | `1110100`             | `0x74`       |
| `LDZ AX` | `1110011`             | `0x73`       |



------
<a name="STZ"></a>
#### STZ

|                   | Store data from register *R* at zero-page memory *address* |
| :---------------- | :--------------------------------------------------------- |
| Syntax:           | STZ *R*`(A,B)` *address*`(8-bit hex)`                      |
| Example:          | `STZ A 0xF3`                                               |
| Instruction data: | `opcode` `zero-page address byte` (2 bytes)                |
| T-states:         | 7                                                          |
| Sets flags:       | *none*                                                     |
| Notes:            | Overrides data in register `C`.                            |
|                   | Supports *address variables*.                              |

**Opcodes for STZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STZ A`  | `1100000`             | `0x60`       |
| `STZ B`  | `1111001`             | `0x79`       |



------
<a name="LDR"></a>
#### LDR

|                   | Load data from the memory address stored in register *C* (low byte) and *D* (high byte) into register *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | LDR *R*`(A,B,C,D)`                                           |
| Example:          | `LDR A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 6                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Registers `C` and `D` must contain a memory address.         |

**Opcodes for LDR**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LDR A`  | `1101101`             | `0x6D`       |
| `LDR B`  | `1101110`             | `0x6E`       |
| `LDR C`  | `1110101`             | `0x75`       |
| `LDR D`  | `1110110`             | `0x76`       |



------
<a name="STR"></a>
#### STR

|                   | Store data from register *R* at the memory address stored in register *C* (low byte) and *D* (high byte) |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | STR *R*`(A,B)`                                               |
| Example:          | `STR A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 6                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Registers `C` and `D` must contain a memory address.         |

**Opcodes for STR**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STR A`  | `1101111`             | `0x6F`       |
| `STR B`  | `1110000`             | `0x70`       |



------
<a name="LDRZ"></a>
#### LDRZ

|                   | Load data from the zero-page memory address stored in register *C* into register *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | LDRZ *R*`(A,B,D,AX)`                                         |
| Example:          | `LDRZ A`                                                     |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Register `C` must contain a zero-page memory address.        |

**Opcodes for LDRZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LDRZ A` | `1111010`             | `0x7A`       |
| `LDRZ B` | `1111011`             | `0x7B`       |
| `LDRZ D` | `1111101`             | `0x7D`       |
| `LDRZ AZ`| `1111100`             | `0x7C`       |



------
<a name="STRZ"></a>
#### STRZ

|                   | Store data from register *R* at the zero-page memory address stored in register *C* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | STRZ *R*`(A,B)`                                              |
| Example:          | `STR A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Register `C` must contain a zero-page memory address.        |

**Opcodes for STRZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STRZ A` | `1111110`             | `0xFE`       |
| `STRZ B` | `1111111`             | `0xFF`       |



------
<a name="LDX"></a>
#### LDX

|                   | Load data from the memory address stored at *address* into register *R* (indirect load) |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | LDX *R*`(A,B,C,D)` *address*`(16-bit hex)`                   |
| Example:          | `LDX A 0x40F3`                                               |
| Instruction data: | 11 bytes *(see notes under Opcodes)*                         |
| T-states:         | 40                                                           |
| Sets flags:       | Clears/sets the `Fc` and `Fz` flags                          |
| Notes:            | See notes under Opcodes.                                     |
|                   | Overrides data in registers `C` and `D`.                     |
|                   | Supports zero page addressing.                               |
|                   | Currently does **not** support *address variables*.          |

**Opcodes for LDX**

The number of operations required by this instruction could not be performed within the limit of 16 t-states. Therefore this instruction has no opcodes of its own, but the assembler translates it into the following set of instructions:
```
LD AX {address}     # Load value at {address} into ALU register AX
MVI AY 0x00         # Load value 0x00 into ALU register AY
LD C {address + 1}  # Load value at {address+1} into register C
ADD D               # Load the value of AX (AX + 0x00 == AX) into register D
LDR {R}             # Load the value from the memory address stored
	                #   in register C and D into register {R}.
```



------
<a name="STX"></a>
#### STX

|                   | Store data from register *R* at the memory address stored at *address* into  (indirect store) |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | STX *R*`(A,B)` *address*`(16-bit hex)`                       |
| Example:          | `STX A 0x40F3`                                               |
| Instruction data: | 11 bytes ((see notes under Opcodes)*                         |
| T-states:         | 40                                                           |
| Sets flags:       | Clears/sets the `Fc` and `Fz` flags                          |
| Notes:            | See notes under Opcodes.                                     |
|                   | Overrides data in registers `C` and `D`.                     |
|                   | Supports zero page addressing.                               |
|                   | Currently does **not** support *address variables*.          |

**Opcodes for STX**

The number of operations required by this instruction could not be performed within the limit of 16 t-states. Therefore this instruction has no opcodes of its own, but the assembler translates it into the following set of instructions:
```
LD AX {address}     # Load value at {address} into ALU register AX
MVI AY 0x00         # Load value 0x00 into ALU register AY
LD C {address + 1}  # Load value at {address+1} into register C
ADD D               # Load the value of AX (AX + 0x00 == AX) into register D
STR {R}             # Store the value of register {R} at 
                    #   the memory address stored in register C and D.
```

  

------
<a name="OUT"></a>
#### OUT

|                   | Send data from register *R* to output *O*    |
| :---------------- | :------------------------------------------- |
| Syntax:           | OUT *O*`(1,2)` *R*`(A,B,C,D)`                |
| Example:          | `OUT 1 A`                                    |
| Instruction data: | `opcode` (1 byte)                            |
| T-states:         | 4                                            |
| Sets flags:       | *none*                                       |
| Notes:            | Currently only output 1 is implemented (TTY) |

**Opcodes for OUT**

| Mnemonic  | Opcode (7-bit binary) | Opcode (hex) |
| :-------- | --------------------- | ------------ |
| `OUT 1 A` | `1001101`             | `0x4D`       |
| `OUT 1 B` | `1001110`             | `0x4E`       |
| `OUT 1 C` | `1001111`             | `0x4F`       |
| `OUT 1 D` | `1010000`             | `0x50`       |
| `OUT 2 A` | `1010001`             | `0x51`       |
| `OUT 2 B` | `1010010`             | `0x52`       |
| `OUT 2 C` | `1010011`             | `0x53`       |
| `OUT 2 D` | `1010100`             | `0x54`       |



------
### Arithmetic instructions

<a name="ADD"></a>
#### ADD

|                   | Perform ALU operation `AX + AY` and store result in *R*      |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | ADD *R*`(A,B,C,D)`                                           |
| Example:          | `ADD A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | Clears the `Fc` flag before the operation, then loads the `Fc` and `Fz` flag from ALU after the operation. |
| Notes:            | *none*                                                       |

**Opcodes for ADD**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ADD A`  | `0011010`             | `0x1A`       |
| `ADD B`  | `1100001`             | `0x61`       |
| `ADD C`  | `0011011`             | `0x1B`       |
| `ADD D`  | `0011100`             | `0x1C`       |



------
<a name="ADC"></a>
#### ADC

|                   | Perform ALU operation `AX + AY + Fc` and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | ADC *R*`(A,B,C,D)`                                           |
| Example:          | `ADC A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | Loads the `Fc` and `Fz` flag from ALU after the operation.   |
| Notes:            | *none*                                                       |

**Opcodes for ADC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ADC A`  | `0011101`             | `0x1D`       |
| `ADC B`  | `1100010`             | `0x62`       |
| `ADC C`  | `0011110`             | `0x1E`       |
| `ADC D`  | `0011111`             | `0x1F`       |



------
<a name="SUB"></a>
#### SUB

|                   | Perform ALU operation `AX - AY` and store result in *R*      |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | SUB *R*`(A,B,C,D)`                                           |
| Example:          | `SUB A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | Set the `Fc` flag before the operation, then loads the `Fc` and `Fz` flag from ALU after the operation. |
| Notes:            | *none*                                                       |

**Opcodes for SUB**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SUB A`  | `0100000`             | `0x20`       |
| `SUB B`  | `1100011`             | `0x63`       |
| `SUB C`  | `0100001`             | `0x21`       |
| `SUB D`  | `0100010`             | `0x22`       |



------
<a name="SBC"></a>
#### SBC

|                   | Perform ALU operation `AX - AY - Fc` and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | SBC *R*`(A,B,C,D)`                                           |
| Example:          | `SBC A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | Loads the `Fc` and `Fz` flag from ALU after the operation.   |
| Notes:            | *none*                                                       |

**Opcodes for SBC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SBC A`  | `0100011`             | `0x23`       |
| `SBC B`  | `1100100`             | `0x64`       |
| `SBC C`  | `0100100`             | `0x24`       |
| `SBC D`  | `0100101`             | `0x25`       |



------
<a name="INC"></a>
#### INC

|                   | Perform ALU operation `AX + 1` and store result in *R*       |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | INC *R*`(A,B,C,D)`                                           |
| Example:          | `INC A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 5                                                            |
| Sets flags:       | Set the `Fc` flag before the operation, then loads the `Fc` and `Fz` flag from ALU after the operation. |
| Notes:            | *none*                                                       |

**Opcodes for INC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `INC A`  | `0110100`             | `0x34`       |
| `INC B`  | `0110101`             | `0x35`       |
| `INC C`  | `0110110`             | `0x36`       |
| `INC D`  | `0110111`             | `0x37`       |



------
<a name="DEC"></a>
#### DEC

|                   | Perform ALU operation `AX - 1` and store result in *R*       |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | DEC *R*`(A,B,C,D)`                                           |
| Example:          | `DEC A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4                                                            |
| Sets flags:       | Clears the `Fc` flag before the operation, then loads the `Fc` and `Fz` flag from ALU after the operation. |
| Notes:            | *none*                                                       |

**Opcodes for DEC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `DEC A`  | `0111000`             | `0x38`       |
| `DEC B`  | `0111001`             | `0x39`       |
| `DEC C`  | `0111010`             | `0x3A`       |
| `DEC D`  | `0111011`             | `0x3B`       |



------
### Logical instructions
<a name="AND"></a>
#### AND

|                   | Perform ALU operation `AX & AY` and store result in *R* |
| :---------------- | :------------------------------------------------------ |
| Syntax:           | AND *R*`(A,B,C,D)`                                      |
| Example:          | `AND A`                                                 |
| Instruction data: | `opcode` (1 byte)                                       |
| T-states:         | 4                                                       |
| Sets flags:       | *none*                                                  |
| Notes:            | *none*                                                  |

**Opcodes for AND**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `AND A`  | `0100110`             | `0x26`       |
| `AND B`  | `1100101`             | `0x65`       |
| `AND C`  | `0100111`             | `0x27`       |
| `AND D`  | `0101000`             | `0x28`       |



------
<a name="OR"></a>
#### OR

|                   | Perform ALU operation `AX or AY` and store result in *R* |
| :---------------- | :------------------------------------------------------- |
| Syntax:           | OR *R*`(A,B,C,D)`                                        |
| Example:          | `OR A`                                                   |
| Instruction data: | `opcode` (1 byte)                                        |
| T-states:         | 4                                                        |
| Sets flags:       | Clears the `Fc` flag before the operation.               |
| Notes:            | *none*                                                   |

**Opcodes for OR**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `OR A`   | `0101001`             | `0x29`       |
| `OR B`   | `1100110`             | `0x66`       |
| `OR C`   | `0101010`             | `0x2A`       |
| `OR D`   | `0101011`             | `0x2B`       |



------
<a name="XOR"></a>
#### XOR

|                   | Perform ALU operation `AX xor AY` (exclusive OR) and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | XOR *R*`(A,B,C,D)`                                           |
| Example:          | `XOR A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4                                                            |
| Sets flags:       | Clears the `Fc` flag before the operation.                   |
| Notes:            | *none*                                                       |

**Opcodes for XOR**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `XOR A`  | `0101100`             | `0x2C`       |
| `XOR B`  | `0101101`             | `0x2D`       |
| `XOR C`  | `0101110`             | `0x2E`       |
| `XOR D`  | `0101111`             | `0x2F`       |



------
<a name="NOT"></a>
#### NOT

|                   | Perform ALU operation `!AX` (inverse) and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | NOT *R*`(A,B,C,D)`                                           |
| Example:          | `NOT A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | *none*                                                       |

**Opcodes for NOT**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `NOT A`  | `0110000`             | `0x30`       |
| `NOT B`  | `0110001`             | `0x31`       |
| `NOT C`  | `0110010`             | `0x32`       |
| `NOT D`  | `0110011`             | `0x33`       |



------
<a name="SHL"></a>
#### SHL

|                   | Perform ALU operation `AX * 2` (shift bits to the left) and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | SHL *R*`(A,B,C,D)`                                           |
| Example:          | `SHL A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4                                                            |
| Sets flags:       | Clears the `Fc` flag before the operation.                   |
| Notes:            | *none*                                                       |

**Opcodes for SHL**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SHL A`  | `0010100`             | `0x14`       |
| `SHL B`  | `0010101`             | `0x15`       |
| `SHL C`  | `0011000`             | `0x18`       |
| `SHL D`  | `0011001`             | `0x19`       |



------
<a name="SHR"></a>
#### SHR

|                   | Perform ALU operation `AX / 2` (shift bits to the right) and store result in *R* |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | SHR *R*`(A,B,C,D)`                                           |
| Example:          | `SHR A`                                                      |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4                                                            |
| Sets flags:       | Loads the `Fc` and `Fz` flag from ALU after the operation.   |
| Notes:            | *none*                                                       |

**Opcodes for SHR**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SHR A`  | `1011101`             | `0x5D`       |
| `SHR B`  | `1011110`             | `0x5E`       |
| `SHR C`  | `1011111`             | `0x5F`       |
| `SHR D`  | `1100111`             | `0x67`       |



------
<a name="CMP"></a>
#### CMP

|                   | Perform comparison operation on `AX` and `AY`                |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | CMP *F*`(EQ,LT,GT)`                                          |
| Example:          | `CMP EQ`                                                     |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4 (`EQ` & `GT`) or 5 (`LT`)                                  |
| Sets flags:       | Clears or sets the `Fc` flag before the operation, then stores the result of the comparison as the  `Fcmp` flag. |
| Notes:            | `CMP EQ` performs `AX == AY` comparison                      |
|                   | `CMP LT` performs `AX < AY` comparison                       |
|                   | `CMP GT` performs `AX > AY` comparison                       |

**Opcodes for CMP**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `CMP EQ` | `0111100`             | `0x3C`       |
| `CMP LT` | `0000000`             | `0x00`       |
| `CMP GT` | `0000000`             | `0x00`       |



------
### Branching instructions
<a name="JMP"></a>
#### JMP

|                   | Perform an unconditional jump                                |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JMP *label*                                                  |
| Example:          | `JMP target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JMP**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JMP`    | `0111111`             | `0x3F`       |



------
<a name="JZ"></a>
#### JZ

|                   | Perform a jump when the `Fz` flag is set                     |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JZ *label*                                                   |
| Example:          | `JZ target`                                                  |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JZ`     | `1000000`             | `0x40`       |



------
<a name="JNZ"></a>
#### JNZ

|                   | Perform a jump when the `Fz` flag is *not* set               |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JNZ *label*                                                  |
| Example:          | `JNZ target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JNZ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JNZ`    | `1000001`             | `0x41`       |



------
<a name="JC"></a>
#### JC

|                   | Perform a jump when the `Fc` flag is set                     |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JC *label*                                                   |
| Example:          | `JC target`                                                  |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JC`     | `1000010`             | `0x42`       |



------
<a name="JNC"></a>
#### JNC

|                   | Perform a jump when the `Fz` flag is *not* set               |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JNC *label*                                                  |
| Example:          | `JNC target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JNC**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JNC`    | `1000011`             | `0x43`       |



------
<a name="JEQ"></a>
#### JEQ

|                   | Perform a jump when the `Feq` flag is set                    |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JEQ *label*                                                  |
| Example:          | `JEQ target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JEQ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JEQ`    | `1000100`             | `0x44`       |



------
<a name="JNEQ"></a>

#### JNEQ

|                   | Perform a jump when the `Feq` flag is *not* set              |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JNEQ *label*                                                 |
| Example:          | `JNEQ target`                                                |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JNEQ**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JNEQ`   | `1101100`             | `0x6C`       |



------
<a name="JLT"></a>
#### JLT

|                   | Perform a jump when the `Flt` flag is set                    |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JLT *label*                                                  |
| Example:          | `JLT target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JLT**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JLT`    | `1000101`             | `0x45`       |



------
<a name="JGT"></a>
#### JGT

|                   | Perform a jump when the `Fgt` flag is set                    |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JGT *label*                                                  |
| Example:          | `JGT target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JGT**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JGT`    | `1000110`             | `0x46`       |



------
<a name="CALL"></a>
#### CALL

|                   | Perform an unconditional jump with the ability to return     |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | CALL *label*                                                 |
| Example:          | `CALL target`                                                |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 14                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for CALL**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `CALL`   | `1000111`             | `0x47`       |



------
<a name="RET"></a>
#### RET

|                   | Jump back to the program location of the last CALL instruction |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | RET                                                          |
| Example:          | `RET`                                                        |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 10                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for RET**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `RET`    | `1001000`             | `0x48`       |
