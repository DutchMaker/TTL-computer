# 74xx Computer Assembly Language

This document is the complete reference to the 74xx Computer Assembly Language.

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

| Flag | Purpose                                                      |
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

Instructions LD, ST, LDR and STR all have a zero page based counterpart: LDZ, STZ, LDRZ, STRZ.  
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
  - [PUSH](#PUSH)
  - [POP](#POP)
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
  - [JMPC](#JMPC)
  - [CALL](#CALL)
  - [CALLC](#CALLC)
  - [RET](#RET)
  - [RETC](#RETC)



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `NOP`    | `00000000`            | `0x00`       |

  

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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `HALT`   | `00000001`            | `0x01`       |

  

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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SC 0`   | `01101000`            | `0x68`       |
| `SC 1`   | `01101001`            | `0x69`       |

  

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

| Mnemonic   | Opcode (8-bit binary) | Opcode (hex) |
| :--------- | --------------------- | ------------ |
| `MOV B A`  | `00000010`            | `0x02`       |
| `MOV C A`  | `00000011`            | `0x03`       |
| `MOV D A`  | `00000100`            | `0x04`       |
| `MOV A B`  | `00000101`            | `0x05`       |
| `MOV C B`  | `00000110`            | `0x06`       |
| `MOV D B`  | `00000111`            | `0x07`       |
| `MOV A C`  | `00001000`            | `0x08`       |
| `MOV B C`  | `00001001`            | `0x09`       |
| `MOV D C`  | `00001010`            | `0x0A`       |
| `MOV A D`  | `00001011`            | `0x0B`       |
| `MOV B D`  | `00001100`            | `0x0C`       |
| `MOV C D`  | `00001101`            | `0x0D`       |
| `MOV AX A` | `01010101`            | `0x55`       |
| `MOV AX B` | `01010110`            | `0x56`       |
| `MOV AX C` | `01010111`            | `0x57`       |
| `MOV AX D` | `01011000`            | `0x58`       |
| `MOV AY A` | `01011001`            | `0x59`       |
| `MOV AY B` | `01011010`            | `0x5A`       |
| `MOV AY C` | `01011011`            | `0x5B`       |
| `MOV AY D` | `01011100`            | `0x5C`       |

  

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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `MVI A`  | `00001110             | `0x0E`       |
| `MVI B`  | `00001111`            | `0x0F`       |
| `MVI C`  | `00010000`            | `0x10`       |
| `MVI D`  | `00010001`            | `0x11`       |
| `MVI AX` | `00111101`            | `0x3D`       |
| `MVI AY` | `00111110`            | `0x3E`       |

  

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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LD A`   | `00010010`            | `0x12`       |
| `LD B`   | `00010011`            | `0x13`       |
| `LD C`   | `01110001`            | `0x71`       |
| `LD D`   | `01110010`            | `0x72`       |
| `LD AX`  | `01101010`            | `0x6A`       |
| `LD AY`  | `01101011`            | `0x6B`       |



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
| Notes:            | Overrides data in registers `C` and `D`.                     |
|                   | Supports *address variables*.                                |
|                   | Supports zero page addressing.                               |

**Opcodes for ST**

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ST A`   | `00010110`            | `0x16`       |
| `ST B`   | `00010111`            | `0x17`       |



------
<a name="LDZ"></a>
#### LDZ

|                   | Load data from zero-page memory *address* into register *R* |
| :---------------- | :---------------------------------------------------------- |
| Syntax:           | LDZ *R*`(A,B,D,AX)` *address*`(8-bit hex)`                  |
| Example:          | `LDZ A 0xF3`                                                |
| Instruction data: | `opcode` `zero-page address byte` (2 bytes)                 |
| T-states:         | 7                                                           |
| Sets flags:       | *none*                                                      |
| Notes:            | Overrides data in register `C`.                             |
|                   | Supports *address variables*.                               |

**Opcodes for LDZ**

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LDZ A`  | `01110111`            | `0x77`       |
| `LDZ B`  | `01111000`            | `0x78`       |
| `LDZ C`  | `10000000`            | `0x80`       |
| `LDZ D`  | `01110100`            | `0x74`       |
| `LDZ AX` | `01110011`            | `0x73`       |
| `LDZ AY` | `10000001`            | `0x81`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STZ A`  | `01100000`            | `0x60`       |
| `STZ B`  | `01111001`            | `0x79`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LDR A`  | `01101101`            | `0x6D`       |
| `LDR B`  | `01101110`            | `0x6E`       |
| `LDR C`  | `01110101`            | `0x75`       |
| `LDR D`  | `01110110`            | `0x76`       |
| `LDR AX` | `10000010`            | `0x82`       |
| `LDR AY` | `10000011`            | `0x83`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STR A`  | `01101111`            | `0x6F`       |
| `STR B`  | `01110000`            | `0x70`       |



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

| Mnemonic  | Opcode (8-bit binary) | Opcode (hex) |
| :-------- | --------------------- | ------------ |
| `LDRZ A`  | `01111010`            | `0x7A`       |
| `LDRZ B`  | `01111011`            | `0x7B`       |
| `LDRZ C`  | `10000100`            | `0x84`       |
| `LDRZ D`  | `01111101`            | `0x7D`       |
| `LDRZ AX` | `01111100`            | `0x7C`       |
| `LDRZ AY` | `10000101`            | `0x85`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `STRZ A` | `01111110`            | `0x7E`       |
| `STRZ B` | `01111111`            | `0x7F`       |



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

| Mnemonic  | Opcode (8-bit binary) | Opcode (hex) |
| :-------- | --------------------- | ------------ |
| `OUT 1 A` | `01001101`            | `0x4D`       |
| `OUT 1 B` | `01001110`            | `0x4E`       |
| `OUT 1 C` | `01001111`            | `0x4F`       |
| `OUT 1 D` | `01010000`            | `0x50`       |
| `OUT 2 A` | `01010001`            | `0x51`       |
| `OUT 2 B` | `01010010`            | `0x52`       |
| `OUT 2 C` | `01010011`            | `0x53`       |
| `OUT 2 D` | `01010100`            | `0x54`       |



------
<a name="PUSH"></a>
#### PUSH

|                   | Push data from register *R* on to the stack  |
| :---------------- | :------------------------------------------- |
| Syntax:           | PUSH *R*`(A,B,C,D)`                          |
| Example:          | `PUSH A`                                     |
| Instruction data: | `opcode` (1 byte)                            |
| T-states:         | 5                                            |
| Sets flags:       | *none*                                       |
| Notes:            | *none*                                       |

**Opcodes for PUSH**

| Mnemonic  | Opcode (8-bit binary) | Opcode (hex) |
| :-------- | --------------------- | ------------ |
| `PUSH A`  | `10010100`            | `0x94`       |
| `PUSH B`  | `10010101`            | `0x95`       |
| `PUSH C`  | `10010110`            | `0x96`       |
| `PUSH D`  | `10010111`            | `0x97`       |



------
<a name="POP"></a>
#### POP

|                   | Pop data from the stack to register *R*      |
| :---------------- | :------------------------------------------- |
| Syntax:           | POP *R*`(A,B,C,D,AX,AY)`                     |
| Example:          | `POP A`                                      |
| Instruction data: | `opcode` (1 byte)                            |
| T-states:         | 6                                            |
| Sets flags:       | *none*                                       |
| Notes:            | *none*                                       |

**Opcodes for POP**

| Mnemonic  | Opcode (8-bit binary) | Opcode (hex) |
| :-------- | --------------------- | ------------ |
| `POP A`   | `10011001`            | `0x98`       |
| `POP B`   | `10011010`            | `0x99`       |
| `POP C`   | `10011011`            | `0x9A`       |
| `POP D`   | `10011100`            | `0x9B`       |
| `POP AX`  | `10011101`            | `0x9C`       |
| `POP AY`  | `10011110`            | `0x9D`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ADD A`  | `00011010`            | `0x1A`       |
| `ADD B`  | `01100001`            | `0x61`       |
| `ADD C`  | `00011011`            | `0x1B`       |
| `ADD D`  | `00011100`            | `0x1C`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ADC A`  | `00011101`            | `0x1D`       |
| `ADC B`  | `01100010`            | `0x62`       |
| `ADC C`  | `00011110`            | `0x1E`       |
| `ADC D`  | `00011111`            | `0x1F`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SUB A`  | `00100000`            | `0x20`       |
| `SUB B`  | `01100011`            | `0x63`       |
| `SUB C`  | `00100001`            | `0x21`       |
| `SUB D`  | `00100010`            | `0x22`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SBC A`  | `00100011`            | `0x23`       |
| `SBC B`  | `01100100`            | `0x64`       |
| `SBC C`  | `00100100`            | `0x24`       |
| `SBC D`  | `00100101`            | `0x25`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `INC A`  | `00110100`            | `0x34`       |
| `INC B`  | `00110101`            | `0x35`       |
| `INC C`  | `00110110`            | `0x36`       |
| `INC D`  | `00110111`            | `0x37`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `DEC A`  | `00111000`            | `0x38`       |
| `DEC B`  | `00111001`            | `0x39`       |
| `DEC C`  | `00111010`            | `0x3A`       |
| `DEC D`  | `00111011`            | `0x3B`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `AND A`  | `00100110`            | `0x26`       |
| `AND B`  | `01100101`            | `0x65`       |
| `AND C`  | `00100111`            | `0x27`       |
| `AND D`  | `00101000`            | `0x28`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `OR A`   | `00101001`            | `0x29`       |
| `OR B`   | `01100110`            | `0x66`       |
| `OR C`   | `00101010`            | `0x2A`       |
| `OR D`   | `00101011`            | `0x2B`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `XOR A`  | `00101100`            | `0x2C`       |
| `XOR B`  | `00101101`            | `0x2D`       |
| `XOR C`  | `00101110`            | `0x2E`       |
| `XOR D`  | `00101111`            | `0x2F`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `NOT A`  | `00110000`            | `0x30`       |
| `NOT B`  | `00110001`            | `0x31`       |
| `NOT C`  | `00110010`            | `0x32`       |
| `NOT D`  | `00110011`            | `0x33`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SHL A`  | `00010100`            | `0x14`       |
| `SHL B`  | `00010101`            | `0x15`       |
| `SHL C`  | `00011000`            | `0x18`       |
| `SHL D`  | `00011001`            | `0x19`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `SHR A`  | `01011101`            | `0x5D`       |
| `SHR B`  | `01011110`            | `0x5E`       |
| `SHR C`  | `01011111`            | `0x5F`       |
| `SHR D`  | `01100111`            | `0x67`       |



------
<a name="CMP"></a>
#### CMP

|                   | Perform comparison operation on `AX` and `AY`                |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | CMP *F*`(EQ,LT,GT)`                                          |
| Example:          | `CMP EQ`                                                     |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 4 (`EQ` / `GT`) or 5 (`LT`)                                  |
| Sets flags:       | Clears or sets the `Fc` flag before the operation, then stores the result of the comparison as the  `Fcmp` flag. |
| Notes:            | `CMP EQ` performs `AX == AY` comparison                      |
|                   | `CMP LT` performs `AX < AY` comparison                       |
|                   | `CMP GT` performs `AX > AY` comparison                       |

**Opcodes for CMP**

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `CMP EQ` | `00111100`            | `0x3C`       |
| `CMP LT` | `10010010`            | `0x92`       |
| `CMP GT` | `10010011`            | `0x93`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JMP`    | `00111111`            | `0x3F`       |



------
<a name="JMPC"></a>
#### JMPC

|                   | Perform a conditional jump                                   |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JMPC *condition*`(Z,NZ,C,NC,CMP,NCMP)` *label*               |
| Example:          | `JMPC NC target`                                             |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |
| Conditions:       | **Z**: `Fz == 1`                                             |
|                   | **NZ**: `Fz == 0`                                            |
|                   | **C**: `Fc == 1`                                             |
|                   | **NC**: `Fc == 0`                                            |
|                   | **CMP**: `Fcmp == 1`                                         |
|                   | **NCMP**: `Fcmp == 0`                                        |

**Opcodes for JMPC**

| Mnemonic    | Opcode (8-bit binary) | Opcode (hex) |
| :---------- | --------------------- | ------------ |
| `JMPC Z`    | `01000000`            | `0x40`       |
| `JMPC NZ`   | `01000001`            | `0x41`       |
| `JMPC C`    | `01000010`            | `0x42`       |
| `JMPC NC`   | `01000011`            | `0x43`       |
| `JMPC CMP`  | `01000100`            | `0x44`       |
| `JMPC NCMP` | `01000101`            | `0x45`       |



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

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `CALL`   | `01000111`            | `0x47`       |



------
<a name="CALLC"></a>
#### CALLC

|                   | Perform a conditional jump with the ability to return        |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | CALLC *condition*`(Z,NZ,C,NC,CMP,NCMP)` *label*              |
| Example:          | `CALLC NC target`                                            |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 14                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |
| Conditions:       | **Z**: `Fz == 1`                                             |
|                   | **NZ**: `Fz == 0`                                            |
|                   | **C**: `Fc == 1`                                             |
|                   | **NC**: `Fc == 0`                                            |
|                   | **CMP**: `Fcmp == 1`                                         |
|                   | **NCMP**: `Fcmp == 0`                                        |

**Opcodes for CALLC**

| Mnemonic     | Opcode (8-bit binary) | Opcode (hex) |
| :----------- | --------------------- | ------------ |
| `CALLC Z`    | `10000110`            | `0x86`       |
| `CALLC NZ`   | `10000111`            | `0x87`       |
| `CALLC C`    | `10001000`            | `0x88`       |
| `CALLC NC`   | `10001001`            | `0x89`       |
| `CALLC CMP`  | `10001010`            | `0x8A`       |
| `CALLC NCMP` | `10001011`            | `0x8B`       |



------
<a name="RET"></a>
#### RET

|                   | Perform an unconditional jump back to the program location of the last CALL or CALLC instruction |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | RET                                                          |
| Example:          | `RET`                                                        |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 10                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for RET**

| Mnemonic | Opcode (8-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `RET`    | `01001000`            | `0x48`       |



------
<a name="RETC"></a>
#### RETC

|                   | Perform a conditional jump back to the program location of the last CALL or CALLC instruction |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | RETC *condition*`(Z,NZ,C,NC,CMP,NCMP)`                       |
| Example:          | `RETC NC`                                                    |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 10                                                           |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |
| Conditions:       | **Z**: `Fz == 1`                                             |
|                   | **NZ**: `Fz == 0`                                            |
|                   | **C**: `Fc == 1`                                             |
|                   | **NC**: `Fc == 0`                                            |
|                   | **CMP**: `Fcmp == 1`                                         |
|                   | **NCMP**: `Fcmp == 0`                                        |

**Opcodes for RETC**

| Mnemonic    | Opcode (8-bit binary) | Opcode (hex) |
| :---------- | --------------------- | ------------ |
| `RETC Z`    | `10001100`            | `0x8C`       |
| `RETC NZ`   | `10001101`            | `0x8D`       |
| `RETC C`    | `10001110`            | `0x8E`       |
| `RETC NC`   | `10001111`            | `0x8F`       |
| `RETC CMP`  | `10010000`            | `0x90`       |
| `RETC NCMP` | `10010001`            | `0x91`       |


