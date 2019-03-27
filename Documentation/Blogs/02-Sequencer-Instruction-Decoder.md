# Sequencer / Instruction Decoder

This module is responsible for translating the current instruction to the control lines.
It's the most complicated part of this computer as it requires several states to be tracked in order to perform its tasks.

## Module subsystems:

### T-state counter
State machine that keeps track of instruction T-states. Instructions can have a maximum of 16 T-states so we use a 4 bit binary counter (74161).

### _Data byte_ counter
Instructions are translated to a maximum of 48 control lines and the state of these lines are stored in the control ROM. Because the ROM stores one byte (8 bits) per address, we need to read a byte from 6 sequential addresses to come up with the 48 bit word for the control lines.
The _data byte counter_ (74161 binary counter) result is used during composition of the current ROM memory address. We are using only 3 bits of this counter for this purpose.

### Shift registers

The 48 bit control word is stored in serial-in/parallel-out (SIPO) 6 shift registers (74595). To transfer the bits from the ROM to the SIPO shift registers, we use one parallel-in/serial-out (PISO) shift register (74165).

When transfer is complete, we have all the control bits ready to be used and visualized.

### _Data bit_ counter

In order to load bits from ROM into the PISO/SIPO shift registers we need to keep track of a load state (i.e. which data bit is being loaded); after 8 bits are loaded, the ROM bank counter needs to advance and the next 8 bits must be loaded.

### Internal clock

The module has an internal clock running at relatively high speed used for the ROM bank and Load state counter and the shift registers. The Logisim circuit uses an internal clock at 64x the speed of the regular clock.

## Module inner workings

Let's take a look at the tasks that this module is performing:

1. Halt CPU execution.
2. Construct ROM memory address for bank 1 (see _Memory layout_).
3. Load ROM byte into PISO shift register.
4. Load PISO data into SIPO shift register.
5. Increase data byte counter.
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
  *7 bits*
- Instruction T-state.
  *4 bits*

This leads to an 19 bit address which is exactly what is supported by the 29C040 ROM we are using. 

The final memory address is laid out as such:

`[flags][instruction][t-state][bank]`
`[00000][0000000][0000][000]`

Flags are ordered as such:

| Bit 4 | Bit 3 | Bit 2 | Bit 1 | Bit 0 |
| ----- | ----- | ----- | ----- | ----- |
| `Fgt` | `Feq` | `Flt` | `Fz`  | `Fc`  |



### Data layout

|            | **Bit 7**    | **Bit 6** | **Bit 5** | **Bit 4** | **Bit 3** | **Bit 2**  | **Bit 1**  | **Bit 0**   |
| ---------- | ------------ | --------- | --------- | --------- | --------- | ---------- | ---------- | ----------- |
| **Bank 0** | `CLK_hlt`    | `C_in`    | `C_out`   | `C_PC-in` | `D_in`    | `D_out`    | `D_PC-in`  | `A_in`      |
| **Bank 1** | `A_out`      | `B_in`    | `B_out`   | `IO_in`   | `RAM_in`  | `MEM_out`  | `IN_out`   | `OUT1_in`   |
| **Bank 2** | `OUT2_in`    | `PC_dec`  | `PC_inc`  | `PC_C-in` | `PC_D-in` | `MAR_C-in` | `MAR_D-in` | `MAR_PC-in` |
| **Bank 3** | `MAR_STK-in` | `ALU_in`  | `ALU_out` | `ALU_S0`  | `ALU_S1`  | `ALU_S2`   | `ALU_S3`   | `ALU_M`     |
| **Bank 4** | `ALU_Cn`     | `F_in`    | `F_z`     | `F_c`     | `F_eq`    | `F_lt`     | `F_gt`     | `SEQ_res`   |
| **Bank 5** |              |           |           |           |           |            | `STK_dec`  | `STK_inc`   |

