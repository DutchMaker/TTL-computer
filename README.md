# 74xx Computer

My attempt at building a computer from scratch with 74xx logic chips.  
Work in progress!

## Status as of April 2nd, 2019

Work done in chronological order:

**General architecture** has been worked out as high level schematic (see: [Architecture.pdf](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Architecture.pdf)).  

Worked on **instruction set, micro code, module documentation & general notes** from time to time (see: [Documentation](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation)). This is still work in progress!  
I'm planning to write a short piece of documentation on each of the modules, like I did for the [Controller](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Modules/Controller.md).  

I've built a [**microcode compiler**](https://github.com/DutchMaker/TTL-computer/tree/master/Code/Microcode) for the Controller's ROM image. This takes a source file which defines all the microcode and compiles it into a binary image that is loaded into the microcode ROM.

**Circuit diagrams** have been worked out in KiCad for all modules except for the Controller (see: [Schematics-KiCad](https://github.com/DutchMaker/TTL-computer/tree/master/Circuits/Schematics-KiCad)). These circuits were designed in KiCad (before the Logisim design was done) and not tested.  
_Circuit diagrams need to be updated according to the Logisim design!_

The entire computer has been built in **Logisim** to verify all the circuits and the way I had everything in mind is actually going to work. *The design is done, but only a few instructions have been tested.* 

While working on the Logisim design, I made several changes to the architecture and some to circuits. These changes still need to be applied to all previous work (architecture design, circuit diagrams, etc.)

### Currently implemented (and tested) instructions

- HALT
- MOV
- MVI
- LD
- ST
- CALL
- RET
- JMP



## TODO's / Plans:

- Get the entire instruction set to work in Logisim.
- Build an assembler.
- Updated previously made circuit diagrams according to latest Logisim design.
- Write additional/updated documentation on all modules.
- Build the computer in real life.

