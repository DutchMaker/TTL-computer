# KiCad projects

- Add `./Libraries/74xx-Computer-Symbols.lib` as global Symbol library to KiCad (Eeschema)
- Add `./Libraries` as global Footprint library to KiCad (Pcbnew)
- PCBs are initially autorouted using `./Libraries/freeRouting.jar` and traces are enhanced manually

## TODO

### Known errors in current Schematic/PCB files
- ALU - PCB error: LED bar graph for AX (_BAR1_) and AY (_BAR2_) have swapped places on the PCB
- ALU: Cn input needs to be inverted
-- This is added to the main board because ALU PCB is already made and there are no available logic gates on it
- ALU outer margin varies from other boards
- Flags Register: 74x74 ~PRE pins are floating, must be tied to +5V
- Memory: Switches briefly short out the circuit while switching. Solved this by removing the connection to ground and adding 10k pull-down resistors.
- Memory: RAM should write when clock pulse is high. Otherwise manual input will be tough (because it uses clock step for writing)

### Improvements
- Clock - Bigger tact switch for stepping
- When all modules are built and tested, combine them into a single PCB.
- Add decoupling caps
- Reset circuit
- Improve silk screen documentation (reference above component)
- Databus LEDs missing on Main Board
- Add hex decoders