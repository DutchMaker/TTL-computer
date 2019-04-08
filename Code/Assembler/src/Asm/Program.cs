using System;
using System.IO;

namespace Asm
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine();
            Console.WriteLine("-----------------------");
            Console.WriteLine("74xx Computer Assembler");
            Console.WriteLine("-----------------------");
            Console.WriteLine();

            /*args = new [] 
            {
                @"e:\Personal\Projects\Active\TTL-Computer\Code\Microcode\microcode.src",
                @"e:\Personal\Projects\Active\TTL-Computer\Code\Assembler\test.asm"
            };*/

            if (args.Length == 0)
            {
                Console.WriteLine("Usage: asm.exe \"microcode.src\" \"filename.asm\"");
				Console.WriteLine("Outputs \"filename.bin\" binary file.");
				Console.WriteLine();
				Console.WriteLine("'microcode.src' must refer to the computer's microcode source file");
				Console.WriteLine("'filename.asm' is the assembly file that needs to be compiled to machine code.");
                Console.WriteLine();
                return;
            }

            string microCodeFileName = args[0];
            string programCodeFileName = args[1];

            if (!File.Exists(microCodeFileName))
            {
                Console.WriteLine($"Could not find microcode source file {microCodeFileName}");
                Console.WriteLine();
                return;
            }

            if (!File.Exists(programCodeFileName))
            {
                Console.WriteLine($"Could not find program source file {programCodeFileName}");
                Console.WriteLine();
                return;
            }

            try
            {
                Assembler.Assemble(microCodeFileName, programCodeFileName);
            }
            catch (MicrocodeCompilerException ex)
            {
                Console.WriteLine("Microcode compilation failed:");
                Console.WriteLine(ex?.Message);
            }
            catch (AssemblerException ex)
            {
                Console.WriteLine("Assembly failed:");
                Console.WriteLine(ex?.Message);
            }

            Console.WriteLine();
            // Console.ReadLine();
        }
    }
}
