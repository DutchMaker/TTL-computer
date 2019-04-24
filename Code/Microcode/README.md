# Microcode Compiler

This application is used to compile the microcode definition, as defined in the `microcode.src` file, into a binary image that is loaded into the *74xx Computer*'s microcode ROM.

It's a .NET Core application that is compiled for the Windows x64 platform, but can also be compiled for macOS or Linux.

## Usage

1. Build & publish the .NET Core solution with Visual Studio.
2. Modify the microcode source file (`microcode.src`) as needed
3. Run `mcc.cmd`
4. The compilation results in `microcode.bin`
5. Upload the contents of the bin to the microcode ROM
   *(for Logisim, open the bin file with a Hexeditor and copy/paste its contents into the ROM image)*

## Syntax

See comments in `microcode.src` for syntax explanation.