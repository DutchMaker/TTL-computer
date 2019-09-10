# 74xx Computer

My attempt at building a computer from scratch with 74xxx logic chips.  



## Status as of September 4th, 2019:

[**General architecture**](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/Architecture.pdf) has been worked out as high level schematic.  

Worked on **instruction set, micro code, module documentation & general notes** from time to time (see: [Documentation](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation)). Only thing missing right now is some documentation on each of the modules. 

The entire computer has been built in [**Logisim**](https://github.com/DutchMaker/TTL-computer/tree/master/Documentation/Logisim) to verify that the way I had everything in mind is actually going to work.

I've built a [**microcode compiler**](https://github.com/DutchMaker/TTL-computer/tree/master/Code/Microcode) for the Controller's ROM image. This takes a source file which defines all the microcode and compiles it into a binary image that is loaded into the microcode ROM.

The 74xx Computer's **instruction set** has been implemented, its **[assembly language](https://github.com/DutchMaker/TTL-computer/blob/master/Documentation/74xx-Assembly-Language.md)** is fully documented and I've built an [**assembler**](https://github.com/DutchMaker/TTL-computer/tree/master/Code/Assembler) to convert assembly programs to machine code.

[**Circuit diagrams and PCBs**](https://github.com/DutchMaker/TTL-computer/tree/master/Circuits) have all been designed in KiCad and have been or are currently being produced:

- [x] Clock (*built and tested*)
- [x] Registers (*built and tested*)
- [x] ALU (*built and tested*)
- [x] Program Counter (*built and tested*)
- [x] Stack Pointer (*built and tested*)
- [x] Flags register (*built and tested*)
- [x] Memory (*built and tested*)
- [x] Memory Access Register (*built and tested*)
- [ ] Controller (*redesigned circuit to account for reset ciruitry - waiting for PCB production*)
- [ ] Main Board (connects all modules together - *built and in process of optimizing*)



## TODO's / Plans:

- Build the computer in real life (**IN PROGRESS**)
  - First revision is based on separate PCBs that are all connected together by one large main PCB.
  - If all works out, there may be a second revision will be one large PCB that contains all modules as one circuit.
- Write additional/updated documentation on all modules.

![https://github.com/DutchMaker/TTL-computer/raw/master/Circuits/Pictures/Main-Board-Assembled.jpg](Assembled computer)
