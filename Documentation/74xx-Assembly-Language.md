# 74xx Computer Assembly Language

This document is the complete reference to the 74xx Computer Assembly Language.
***Work in progress!***

Contents:

- [Registers](#registers)
- [Flags](#flags)
- [Instructions](#instructions)


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

Contents:

- [NOP](#NOP)
- [HALT](#HALT)
- [MOV](#MOV)

<a name="NOP"></a>
### NOP

|                   | Do nothing                                                                                                          _ |
| :---------------- | ------------------------------------------------------------ |
| Syntax:           | NOP                                                          |
| Example:          | `NOP`                                                        |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 3                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | *none*                                                       |

#### Opcodes for NOP

| Mnemonic         _ | Opcode (7-bit binary) | Opcode (hex)                                                            _ |
| :--------- | --------------------- | ------------ |
| `NOP`  | `0000000`             | `0x00`       |

  

------
<a name="HALT"></a>
### HALT

|                   | Halt CPU execution                                                                                           _ |
| :---------------- | ------------------------------------------------------------ |
| Syntax:           | HALT                                                         |
| Example:          | `HALT`                                                       |
| Instruction data: | `opcode` (1 byte)                                            |
| T-states:         | 3                                                            |
| Sets flags:       | *none*                                                       |
| Notes:            | *none*                                                       |

#### Opcodes for HALT

| Mnemonic         _ | Opcode (7-bit binary) | Opcode (hex)                                                            _ |
| :--------- | --------------------- | ------------ |
| `HALT`  | `0000001`             | `0x01`       |

  

------
<a name="MOV"></a>
### MOV

|                   | Copy data from register *R1* to register *R2*                                                   _ |
| :---------------- | --------------------------------------------- |
| Syntax:           | MOV *R1*`[A,B,C,D]` *R2*`[A,B,C,D,AX,AY]`     |
| Example:          | `MOV B AX`                                    |
| Instruction data: | `opcode` (1 byte)                             |
| T-states:			| 4                                             |
| Sets flags:       | *none*                                       |
| Notes:            | *none*                                       |

#### Opcodes for MOV

| Mnemonic         _ | Opcode (7-bit binary) | Opcode (hex)                                                            _ |
| :----------------- | --------------------- | ------------------------------------------------------------ |
| `MOV A B`          | `0000010`             | `0x02`                                                       |
| `MOV A C`          | `0000011`             | `0x03`                                                       |
| `MOV A D`          | `0000100`             | `0x04`                                                       |
| `MOV B A`          | `0000101`             | `0x05`                                                       |
| `MOV B C`          | `0000110`             | `0x06`                                                       |
| `MOV B D`          | `0000111`             | `0x07`                                                       |
| `MOV C A`          | `0001000`             | `0x08`                                                       |
| `MOV C B`          | `0001001`             | `0x09`                                                       |
| `MOV C D`          | `0001010`             | `0x0A`                                                       |
| `MOV D A`          | `0001011`             | `0x0B`                                                       |
| `MOV D B`          | `0001100`             | `0x0C`                                                       |
| `MOV D C`          | `0001101`             | `0x0D`                                                       |
| `MOV A AX`         | `1010101`             | `0x55`                                                       |
| `MOV B AX`         | `1010110`             | `0x56`                                                       |
| `MOV C AX`         | `1010111`             | `0x57`                                                       |
| `MOV D AX`         | `1011000`             | `0x58`                                                       |
| `MOV A AY`         | `1011001`             | `0x59`                                                       |
| `MOV B AY`         | `1011010`             | `0x5A`                                                       |
| `MOV C AY`         | `1011011`             | `0x5B`                                                       |
| `MOV D AY`         | `1011100`             | `0x5C`                                                       |

  

------
<a name="MVI"></a>
### MVI

|                   | Write immediate value to register *R*                                                           _ |
| :---------------- | --------------------------------------------- |
| Syntax:           | MVI *R1*`[A,B,C,D,AX,AY]` `hex-value`     |
| Example:          | `MVI A 0xF3`                                    |
| Instruction data: | `opcode` `data` (2 bytes)                             |
| T-states:			| 5                                             |
| Sets flags:       | *none*                                       |
| Notes:            | *none*                                       |

#### Opcodes for MVI

| Mnemonic         _ | Opcode (7-bit binary) | Opcode (hex)                                                            _ |
| :----------------- | --------------------- | ------------------------------------------------------------ |
| `MVI A`          | `0001110`             | `0x0E`                                                       |
| `MVI B`          | `0001111`             | `0x0F`                                                       |
| `MVI C`          | `0010000`             | `0x10`                                                       |
| `MVI D`          | `0010001`             | `0x11`                                                       |
| `MVI AX`          | `0111101`             | `0x3D`                                                       |
| `MVI AY`          | `0111110`             | `0x3E`                                                       |


