# KiCad projects

- Add `./Libraries/74xx-Computer-Symbols.lib` as global Symbol library to KiCad (Eeschema)
- Add `./Libraries` as global Footprint library to KiCad (Pcbnew)
- PCBs are initially autorouted using `./Libraries/freeRouting.jar` and traces are enhanced manually


### Known deviations/errors in current Schematic/PCB files

There are a number of deviations and errors that were found in schematic/PCB designs after PCB production. They are listed here if they were not fixed in the schematic/PCB design files.

- **ALU:** LED bar graph for AX (_BAR1_) and AY (_BAR2_) have swapped places on the PCB.
- **ALU:** Cn input needs to be inverted.
- This is added to the main board because ALU PCB was already produced and there were no available NOT gates available.
- **ALU:** Outer margin varies from other boards.
- **Flags Register:** U6 and U7 (74x74) ~PRE pins (4 and 10) are floating. They must be tied to +5V otherwise the chip does not function properly.
- **Memory & Memory Access Register:** The switches used for SW1 to SW8 briefly short out the circuit while switching. This reset the entire computer. Solved this by removing the connection to ground and adding 10k pull-down resistors between the data lines and ground.
- **Memory:** RAM should write when clock pulse is high. Otherwise manual input is difficult because that relies on single stepping the clock. Solved this by feeding the clock signal through U1 (74x04) before connecting it to U4A (74x32).
- **Main Board:** Current main board PCB design does not fit the current instruction register PCB - only the improvised one that I've built.
- **Controller:** U9 (74x74) ground pin is not connected. Also ~PRE pin (4) is floating and must be tied to +5V.
- **Controller & Memory**: Drill holes for ZIF socket are too narrow (need to be 1mm).
- **Main Board:** Forgot to add LED bar to display data bus contents.
- **Main Board:** Forgot to add one or more expansion ports.



### Suggested improvements

- Clock: Use a bigger push switch for single stepping
  - Add a *continue* option in order to continue execution after a HALT instruction.
- When all modules are built and tested, combine them into a single PCB.
  - I may decide to never do this and just start designing the next version of the CPU.
- Add decoupling caps (have only been added to main board now)
- Create a reset circuit
- Improve silk screen documentation
- Databus LEDs missing on Main Board
- Add hex decoders to registers / memory.
  - Add switch to disable output?
- ADC and SUBC instructions should take the carry flag into account
  - SUBC may be renamed to SUBB (borrow)