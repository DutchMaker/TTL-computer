# 74xx Computer

My attempt at building a computer from scratch with 74xx logic chips.  
Work in progress!

## Status as of March 26th, 2019

Work done in chronological order:

**General architecture** has been worked out as high level schematic (see: [Architecture.pdf](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Architecture.pdf)).  
_Needs to be updated according to Logisim design!_

Worked on **instruction set, micro code, module documentation & general notes** from time to time (see: [Documentation](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation)). This is still heavily work in progress!  
I'm planning to write a short piece of documentation on each of the modules, like I did for the [Sequencer / Instruction Decoder](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Blogs/02-Sequencer-Instruction-Decoder.md).  
_Needs to be updated according to Logisim design!_

**Circuit diagrams** have been worked out in KiCad for all modules except for the Sequence / Instruction Decoder (see: [Schematics-KiCad](https://github.com/DutchMaker/TTL-computer/tree/master/Circuits/Schematics-KiCad)). These circuits were designed in KiCad and not tested.  
_Needs to be updated according to Logisim design!_

The entire computer is being built in **Logisim** to verify all the circuits and the way I had everything in mind is actually going to work. I'd say it's 95% done as far as Logisim design goes, but it can't be fully tested until the entire instruction set and all microcode has been worked out.  

While working on the Logisim design, I made several changes to the architecture and some to circuits. These changes still need to be applied to all previous work (architecture design, circuit diagrams, etc.)

## TODO's / Plans:

- Rename the project to _74xx computer_ (it was named _TTL Computer_ before, but it may technically not all be TTL).
- Updated previously made documentation according to latest Logisim design.
- Write new documentation on all modules
- Finish the computer in Logisim with the entire instruction set working.
- Build the computer in real life.