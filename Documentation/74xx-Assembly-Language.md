# 74xx Computer Assembly Language

This document is the complete reference to the 74xx Computer Assembly Language.

**Contents:**

- [Structure](#structure)
- [Registers](#registers)
- [Flags](#flags)
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
			0x05 0x06 0x07 0x08;	# Note the use of the ; at the end!
	
:main

	# Program execution starts at the :main label.
	# This must be either the first label in the program,
	# or the first one after the :data label.
	
	MVI A 0xB1
	... more instructions here ...

	*i = 0x4000		# You can define address variables, which
	ST D *i 		# can be used in instructions that refer to an address.
	LD A *i

	CALL example	# Jump to subroutine (with the ability to return).

	JMP done

:example

	MOV A B
	... more instructions here ...
	
	RET				# Jump back to the caller address.
	
:done

	HALT
```


<a name="registers"></a>
## Registers

| Register | Purpose                                                      |
| -------- | ------------------------------------------------------------ |
| A, B     | General purpose bi-directional registers.                    |
| C, D     | Bi-directional registers that may be used for general purpose, but are also used for temporary address storage by some instructions. Address *low byte* is stored in register C, while the *high byte* is stored in D. |
| AX       | Write-only register for the ALU (*accumulator*).             |
| AY       | Write-only register for the ALU (*operand*).                 |
| OUT1     | Write-only register used for output control. Can only be written to using the *OUT 1* instruction. |

<a name="flags"></a>
## Flags

| Flag | Purpose                                                                                    _ |
| ---- | ------- |
| Fc   | ALU operation resulted in a carry |
| Fz   | ALU operation resulted in zero |
| Flt  | AX < AY |
| Feq  | AX == AY |
| Fgt  | AX > AY |

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
  - [JNE](#JNE)
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

|                   | Copy data from register *R1* to register *R2* |
| :---------------- | --------------------------------------------- |
| Syntax:           | MOV *R1*`(A,B,C,D)` *R2*`(A,B,C,D,AX,AY)`     |
| Example:          | `MOV B AX`                                    |
| Instruction data: | `opcode` (1 byte)                             |
| T-states:         | 4                                             |
| Sets flags:       | *none*                                        |
| Notes:            | *none*                                        |

**Opcodes for MOV**

| Mnemonic   | Opcode (7-bit binary) | Opcode (hex) |
| :--------- | --------------------- | ------------ |
| `MOV A B`  | `0000010`             | `0x02`       |
| `MOV A C`  | `0000011`             | `0x03`       |
| `MOV A D`  | `0000100`             | `0x04`       |
| `MOV B A`  | `0000101`             | `0x05`       |
| `MOV B C`  | `0000110`             | `0x06`       |
| `MOV B D`  | `0000111`             | `0x07`       |
| `MOV C A`  | `0001000`             | `0x08`       |
| `MOV C B`  | `0001001`             | `0x09`       |
| `MOV C D`  | `0001010`             | `0x0A`       |
| `MOV D A`  | `0001011`             | `0x0B`       |
| `MOV D B`  | `0001100`             | `0x0C`       |
| `MOV D C`  | `0001101`             | `0x0D`       |
| `MOV A AX` | `1010101`             | `0x55`       |
| `MOV B AX` | `1010110`             | `0x56`       |
| `MOV C AX` | `1010111`             | `0x57`       |
| `MOV D AX` | `1011000`             | `0x58`       |
| `MOV A AY` | `1011001`             | `0x59`       |
| `MOV B AY` | `1011010`             | `0x5A`       |
| `MOV C AY` | `1011011`             | `0x5B`       |
| `MOV D AY` | `1011100`             | `0x5C`       |

  

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

|                   | Load data from memory *address* into register *R*         |
| :---------------- | :-------------------------------------------------------- |
| Syntax:           | LD *R*`(A,B,AX,AY)` *address*`(16-bit hex)`               |
| Example:          | `LD A 0x40F3`                                             |
| Instruction data: | `opcode` `address high byte` `address low byte` (3 bytes) |
| T-states:         | 10                                                        |
| Sets flags:       | *none*                                                    |
| Notes:            | Overrides data in registers `C` and `D`                   |

**Opcodes for LD**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `LD A`   | `0010010`             | `0x12`       |
| `LD B`   | `0010011`             | `0x13`       |
| `LD AX`  | `1101010`             | `0x6A`       |
| `LD AY`  | `1101011`             | `0x6B`       |

  

------
<a name="ST"></a>
#### ST

|                   | Store data from register *R* at memory *address*          |
| :---------------- | :-------------------------------------------------------- |
| Syntax:           | ST *R*`(A,B)` *address*`(16-bit hex)`                     |
| Example:          | `ST A 0x40F3`                                             |
| Instruction data: | `opcode` `address high byte` `address low byte` (3 bytes) |
| T-states:         | 10                                                        |
| Sets flags:       | *none*                                                    |
| Notes:            | Overrides data in registers `C` and `D`                   |

**Opcodes for ST**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `ST A`   | `0010110`             | `0x16`       |
| `ST B`   | `0010111`             | `0x17`       |

  

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

|                   | Perform different comparisons on `AX` and `AY`               |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | CMP                                                          |
| Example:          | `CMP`                                                        |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 7                                                            |
| Sets flags:       | Clears the `Fc` flag before the operation, then loads the `Flt`, `Feq` and `Fgt` flag from ALU during the operation. `Fz` is set when `AX` is zero. |
| Notes:            | *none*                                                       |

**Opcodes for CMP**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `CMP`    | `0111100`             | `0x3C`       |



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
<a name="JNE"></a>
#### JNE

|                   | Perform a jump when the `Feq` flag is *not* set              |
| :---------------- | :----------------------------------------------------------- |
| Syntax:           | JNE *label*                                                  |
| Example:          | `JNE target`                                                 |
| Instruction data: | `opcode` `target address high byte` `target address low byte` (3 bytes) |
| T-states:         | 9                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | Overrides data in registers `C` and `D`                      |

**Opcodes for JNE**

| Mnemonic | Opcode (7-bit binary) | Opcode (hex) |
| :------- | --------------------- | ------------ |
| `JNE`    | `1101100`             | `0x6C`       |



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
