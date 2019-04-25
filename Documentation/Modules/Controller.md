# Controller

This module is responsible for counting T-states and decoding instructions to the control lines.
It's the most complicated part of this computer as it requires several states to be tracked in order to perform its tasks.

The controller logic is based on microcode that is stored in a ROM.

## Module subsystems:

### T-state counter
State machine that keeps track of instruction T-states. Instructions can have a maximum of 16 T-states so we use a 4 bit binary counter (74161).

### _Data byte_ counter
Instructions are translated to a maximum of 48 control lines and the state of these lines are stored in the control ROM. Because the ROM stores one byte (8 bits) per address, we need to read a byte from 6 sequential addresses to come up with the 48 bit word for the control lines.
The _data byte counter_ (74161 binary counter) result is used during composition of the current ROM memory address. We are using only 3 bits of this counter for this purpose.

### Registers

The 48 bit control word is stored in 8-bit registers (74377). The data byte counter determines which of the registers is used to store the current data byte. Register selection is done using a  3-to-1 multiplexer (74138). When transfer is complete, we have all the control bits ready to be used.

### Internal clock

The module has an internal clock running at relatively high speed used for the ROM bank and Load state counter and the shift registers. The Logisim circuit uses an internal clock at 64x the speed of the regular clock.

## Module inner workings

Let's take a look at the tasks that this module is performing:

1. Halt CPU execution.
2. Construct ROM memory address for bank 1 (see _Memory layout_).
3. Load ROM byte into current register.
4. Increase data byte counter.
5. Repeat from step 2 until bank 6 has been processed (6x8 control word bytes).
6. Resume CPU execution.

## Memory layout

### Memory addresses

The microcode (control line states) for each instruction is stored in 6 bytes in ROM.
The memory address at which this is stored is constructed using the following variables:

- Bank number (i.e. byte number, one bank for each of the 6 bytes).
  *3 bits*
- CPU flags state.
  *3 bits*
- Instruction OP-code.
  *8 bits*
- Instruction T-state.
  *5 bits*

This leads to an 19 bit address which is exactly what is supported by the 29C040 ROM we are using. 

The final memory address is laid out as such:

`[flags][instruction][t-state][bank]`
`[000][00000000][00000][000]`

Flags are ordered as such:

| Bit 2  | Bit 1 | Bit 0 |
| ------ | ----- | ----- |
| `Fcmp` | `Fz`  | `Fc`  |

### Data layout

|            | Bit 7            | Bit 6         | Bit 5         | Bit 4          | Bit 3            | Bit 2           | Bit 1            | Bit 0            |
| ---------- | ---------------- | ------------- | ------------- | -------------- | ---------------- | --------------- | ---------------- | ---------------- |
| **Bank 0** |                  |               | `MAR_ZP`      | `FLAGS_Fc_set` | `FLAGS_Fc_clear` | `FLAGS_Fc_load` | `FLAGS_Flt_load` | `FLAGS_Feq_load` |
| **Bank 1** | `FLAGS_Fgt_load` | `OUT2_in`     | `OUT1_in`     | `IN_out`       | `TSTATE_reset`   | `CLOCK_halt`    | `MEM_out`        | `MEM_RAM_load`   |
| **Bank 2** | `MAR_STK_load`   | `MAR_PC_load` | `MAR_HB_load` | `MAR_LB_load`  | `ALU_out`        | `ALU_cn`        | `ALU_m`          | `ALU_s3`         |
| **Bank 3** | `ALU_s2`         | `ALU_s1`      | `ALU_s0`      | `ALU_B_in`     | `ALU_A_in`       | `STK_reset`     | `STK_dec`        | `STK_inc`        |
| **Bank 4** | `PC_HB_out`      | `PC_LB_out`   | `PC_HB_load`  | `PC_LB_load`   | `PC_dec`         | `PC_inc`        | `IR_load`        | `FLAGS_load`     |
| **Bank 5** | `D_load`         | `D_out`       | `C_load`      | `C_out`        | `B_load`         | `B_out`         | `A_load`         | `A_out`          |

## Microcode

The microcode compiler is used to define the contents of the microcode ROM.
*More documentation on this will follow...*