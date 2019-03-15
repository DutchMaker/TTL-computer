# Controller / Sequencer

This module is responsible for translating the current instruction to the control lines.
It's the most complicated part of this computer as it requires several states to be tracked in order to perform its tasks.

## Module subsystems:

### T-state counter
State machine that keeps track of instruction T-states. Instructions can have a maximum of 16 T-states so we use a 4 bit binary counter (74161).

### ROM bank counter
Instructions are translated to a maximum of 48 control lines and the state of these lines are stored in the control ROM. Because the ROM stores 8 bits per address, we need to read from 6 sequential addresses to come up with the 48 bit word for the control lines.
The _ROM bank counter_ (74161 binary counter) result is used during composition of the current ROM memory address. We are using only 3 of the counter bits for this purpose.

### Shift registers

The 48 bit control word is stored in serial-in/parallel-out (SIPO) 6 shift registers (74595). To transfer the bits from the ROM to the SIPO shift registers, we use one parallel-in/serial-out (PISO) shift register (74165).

When transfer is complete, we have all the control bits ready to be used and visualized.

### Internal clock

The module has an internal clock running at relatively high speed (something like 8 MHz)  used for the ROM bank and the shift registers.

## Module inner workings

Let's take a look at the tasks that this module is performing:

1. Halt CPU execution.
2. Construct ROM memory address for bank 1 (see _Memory layout_).
3. Load ROM byte into PISO shift register.
4. Load PISO data into SIPO shift register.
5. Increase bank counter.
6. Repeat from step 2 until bank 6 has been processed (6x8 control word bytes).
7. Resume CPU execution.

## Memory layout

### Memory addresses

The microcode (control line states) for each instruction is stored in 6 bytes in ROM.
The memory address at which this is stored is constructed using the following variables:

- Bank number (i.e. byte number, one bank for each of the 6 bytes).
  *3 bits*
- CPU flags state.
  *5 bits*
- Instruction OP-code.
  *6 bits*
- Instruction T-state.
  *4 bits*

This leads to an 18 bit address. The ROM we are using (29C040) supports 19 bit addresses, so the last bit remains unused. 

The final memory address is laid out as such:

`[unused][bank][flags][instruction][t-state]`
`[0][000][00000][000000][0000]`

### Data layout

|            | **Bit 7**    | **Bit 6** | **Bit 5** | **Bit 4** | **Bit 3** | **Bit 2**  | **Bit 1**  | **Bit 0**   |
| ---------- | ------------ | --------- | --------- | --------- | --------- | ---------- | ---------- | ----------- |
| **Bank 0** | `CLK_hlt`    | `C_in`    | `C_out`   | `C_PC-in` | `D_in`    | `D_out`    | `D_PC-in`  | `A_in`      |
| **Bank 1** | `A_out`      | `B_in`    | `B_out`   | `IO_in`   | `RAM_in`  | `MEM_out`  | `IN_out`   | `OUT1_in`   |
| **Bank 2** | `OUT2_in`    | `PC_dec`  | `PC_inc`  | `PC_C-in` | `PC_D-in` | `MAR_C-in` | `MAR_D-in` | `MAR_PC-in` |
| **Bank 3** | `MAR_STK-in` | `ALU_in`  | `ALU_out` | `ALU_S0`  | `ALU_S1`  | `ALU_S2`   | `ALU_S3`   | `ALU_M`     |
| **Bank 4** | `ALU_Cn`     | `F_in`    | `F_z`     | `F_c`     | `F_eq`    | `F_lt`     | `F_gt`     | `SEQ_res`   |
| **Bank 5** |              |           |           |           |           |            | `STK_dec`  | `STK_inc`   |

