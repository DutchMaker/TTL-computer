using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;

namespace Asm
{
    public class Assembler
    {
        private readonly string[] LABEL_INSTRUCTIONS = { "JMP", "JZ", "JNZ", "JC", "JNC", "JEQ", "JLT", "JGT", "CALL" };

        private static Assembler _assembler;
        private MicrocodeCompiler microcodeCompiler;

        private string targetFileName;
        private string source;
        private byte[] machineCode = new byte[0x4000];
        private Dictionary<string, int> labels = new Dictionary<string, int>() { { "main", 0 } };
        private Dictionary<int, string> labelsToTranslate = new Dictionary<int, string>();

        public static void Assemble(string microcodeSourceFile, string programSourceFile)
        {
            string targetFileName = programSourceFile.Split('.', StringSplitOptions.RemoveEmptyEntries).First() + ".bin";
            string programCode = File.ReadAllText(programSourceFile);

            _assembler = new Assembler(microcodeSourceFile, programCode, targetFileName);
            _assembler.Assemble();
        }

        private Assembler(string microcodeSourceFile, string programCode, string targetFileName)
        {
            LoadMicrocode(microcodeSourceFile);

            this.source = programCode;
            this.targetFileName = targetFileName;
        }

        private void Assemble()
        {
            var sw = Stopwatch.StartNew();
            Console.WriteLine("Generating machinecode...");

            RemoveComments();
            ProcessDataBlock();
            ProcessAssembly();

            Console.WriteLine();
            Console.WriteLine($"Machinecode generared in {sw.ElapsedMilliseconds} ms. and saved to {targetFileName}");
        }

        private void ProcessDataBlock()
        {
            if (source.IndexOf(":data") == -1)
            {
                Console.WriteLine("Label ':data' is not defined.");
                return;
            }

            if (source.IndexOf(":main") == -1)
            {
                throw new AssemblerException("Label ':main' is not defined!");
            }

            int start = source.IndexOf(":data") + 5;
            int end = source.IndexOf(":main");

            string data = source.Substring(start, end - start)
                .Replace("\t", string.Empty)
                .Replace("\r", string.Empty)
                .Replace("\n", " ")
                .Replace("  ", string.Empty);
            
            string[] blocks = data.Split(';', StringSplitOptions.RemoveEmptyEntries)
                .Where(x => x.Trim().Length > 0)
                .ToArray();

            int byteCount = 0;

            foreach (string block in blocks)
            {
                if (block.IndexOf(':') == -1)
                {
                    Console.WriteLine($"Skipped invalid data block definition: \"{block}\".");
                    continue;
                }

                int address = Convert.ToInt32(block.Split(':').First().Trim(), 16);
                string[] bytes = block.Split(':').Last().Split(' ', StringSplitOptions.RemoveEmptyEntries);

                foreach (string b in bytes)
                {
                    machineCode[address++] = Convert.ToByte(b.Trim(), 16);
                    byteCount++;
                }
            }

            Console.WriteLine($"Processed {byteCount} bytes of predefined data.");
        }

        private void ProcessAssembly()
        {
            int address = 0;
            string[] consoleLog = new string[0x4000];

            source = RemoveWhitespace(source);
            source = source.Substring(source.IndexOf(":main"));

            var lines = source.Replace("\r", string.Empty)
                .Split('\n', StringSplitOptions.RemoveEmptyEntries)
                .Skip(1);

            foreach (string line in lines)
            {
                if (line.StartsWith(":"))
                {
                    // Current line defines a label.
                    string label = RemoveNewLine(line.Split(':').Last());
                    labels.Add(label, address);

                    continue;
                }

                // Find instruction definition for current line.
                var instruction = microcodeCompiler.Instructions.OrderByDescending(x => x.Key.Length)
                    .First(x => line.StartsWith(x.Key));

                byte instructionByte = Convert.ToByte(instruction.Value, 2);
                int instructionLength = microcodeCompiler.InstructionLengths[instruction.Key];

                // Add the current instruction to the machinecode.
                consoleLog[address] = line;
                machineCode[address++] = instructionByte;
                
                if (LABEL_INSTRUCTIONS.Contains(instruction.Key))
                {
                    // Current instruction refers to a label.
                    // We need to fill in the label address later.
                    labelsToTranslate.Add(address, line.Split(' ').Last());
                    address += 2;
                }
                else if (instructionLength > 1)
                {
                    // Instruction has 1 or 2 operands that need to be stored as well.
                    var parts = line.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                    if (instructionLength == 2)
                    {
                        // There is one operand which is a hex value representing one byte.
                        machineCode[address++] = Convert.ToByte(parts[parts.Length - 1], 16);
                    }
                    else if (instructionLength == 3)
                    {
                        // There is one operand which is a hex value representing two bytes. 
                        var bytes = BitConverter.GetBytes(Convert.ToInt16(parts[parts.Length - 1], 16));
                        machineCode[address++] = bytes[1];
                        machineCode[address++] = bytes[0];
                    }
                }
            }

            // Fill in the addresses of all label references.
            foreach (var labelref in labelsToTranslate)
            {
                int refAddress = labelref.Key;
                int labelAddress = labels[labelref.Value];

                // Split label address into two bytes.
                var bytes = BitConverter.GetBytes(labelAddress);
                machineCode[refAddress] = bytes[1];
                machineCode[refAddress + 1] = bytes[0];
            }

            // Output the machinecode with assembly to the console.
            for (int i = 0; i < address; i++)
            {
                if (labels.ContainsValue(i))
                {
                    Console.WriteLine($":{labels.FirstOrDefault(x => x.Value == i).Key}");
                }

                Console.WriteLine($"0x{i:X4}: 0x{machineCode[i]:X2}  # {consoleLog[i]}");
            }

            // Output other data stored in machinecode (predefined data).
            Console.WriteLine($":data");
            for (int i = address; i < machineCode.Length; i++)
            {
                if (machineCode[i] != 0)
                {
                    Console.WriteLine($"0x{i:X4}: 0x{machineCode[i]:X2}");
                }
            }

            SaveMachineCode();
        }
        
        private void SaveMachineCode()
        {
            if (File.Exists(targetFileName))
            {
                File.Delete(targetFileName);
            }

            using (var writer = new BinaryWriter(File.Open(targetFileName, FileMode.CreateNew)))
            {
                writer.Seek(0, SeekOrigin.Begin);
                writer.Write(machineCode);
            }
        }
        
        private void LoadMicrocode(string microcodeSourceFile)
        {
            Console.WriteLine("Loading microcode definition...");

            this.microcodeCompiler = MicrocodeCompiler.Compile(microcodeSourceFile);

            Console.WriteLine("Microcode loaded!");
            Console.WriteLine();
        }

        private string RemoveNewLine(string input)
        {
            return input.Replace("\n", string.Empty).Replace("\r", string.Empty);
        }

        private string RemoveWhitespace(string input)
        {
            string result = input.Replace("\t", string.Empty);

            while (result.IndexOf("  ") > -1)
            {
                result = result.Replace("  ", " ");
            }

            while (result.IndexOf("\r\n\r\n") > -1)
            {
                result = result.Replace("\r\n\r\n", "\r\n");
            }

            while (result.IndexOf("\n\n") > -1)
            {
                result = result.Replace("\n\n", "\n");
            }

            return result;
        }

        private void RemoveComments()
        {
            int i = 0;
            while (source.Contains("#"))
            {
                int commentStart = source.IndexOf("#");
                int commentEnd = source.IndexOf("\n", commentStart);

                if (commentEnd == -1)
                {
                    commentEnd = source.Length - 1;
                }

                string beforeComment = source.Substring(0, commentStart);
                string afterComment = source.Substring(commentEnd + 1);

                source = beforeComment + afterComment;

                i++;

                if (i > 150)
                {

                }
            }
        }
    }
}
