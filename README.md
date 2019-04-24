# 74xx Computer

My attempt at building a computer from scratch with 74xxx logic chips.  



## Status as of April 10th, 2019:

[**General architecture**](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Architecture.pdf) has been worked out as high level schematic.  

Worked on **instruction set, micro code, module documentation & general notes** from time to time (see: [Documentation](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation)). This is still work in progress!  
I'm planning to write a short piece of documentation on each of the modules, like I did for the [Controller](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Modules/Controller.md).  

[**Circuit diagrams**](https://github.com/DutchMaker/TTL-computer/tree/master/Circuits/Schematics-KiCad) have been worked out in KiCad for all modules except for the Controller. These circuits were designed in KiCad (before the Logisim design was done) and not tested.  
_All circuit diagrams need to be updated according to the Logisim design!_

I've built a [**microcode compiler**](https://github.com/DutchMaker/TTL-computer/tree/master/Code/Microcode) for the Controller's ROM image. This takes a source file which defines all the microcode and compiles it into a binary image that is loaded into the microcode ROM.

The 74xx Computer's **instruction set** has been implemented, its **[assembly language](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/74xx-Assembly-Language.md)** is fully documented and I've built an [**assembler**](https://github.com/DutchMaker/TTL-computer/tree/master/Code/Assembler) to convert assembly programs to machine code.

The entire computer has been built in [**Logisim**](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation/Logisim) to verify that the way I had everything in mind is actually going to work.



## TODO's / Plans:

- Update previously designed circuit diagrams according to latest Logisim design.
- Write additional/updated documentation on all modules.
- Build the computer in real life.

