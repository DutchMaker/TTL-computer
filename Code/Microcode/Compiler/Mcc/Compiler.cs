using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Mcc
{
    public class Compiler
    {
        private const string SECTION_INSTRUCTIONS = "INSTRUCTIONS";
        private const string SECTION_CONTROLLINES = "CONTROLLINES";
        private const string SECTION_MICROCODE = "MICROCODE";
        private readonly string[] REGISTERS = { "A", "B", "C", "D" };

        private static Compiler _compiler;

        private string targetFileName;
        private string source;
        private Dictionary<string, string> instructions;
        private List<string> controlLines;
        private Dictionary<string, List<Dictionary<string, string>>> microSourceCode;
        private Dictionary<int, byte> microcode;

        public static void Compile(string fileName)
        {
            string targetFileName = fileName.Split('.', StringSplitOptions.RemoveEmptyEntries).First() + ".bin";
            string source = File.ReadAllText(fileName);

            _compiler = new Compiler(source, targetFileName);
            _compiler.Compile();
        }

        private Compiler(string source, string targetFileName)
        {
            this.source = source;
            this.targetFileName = targetFileName;
        }

        private void Compile()
        {
            RemoveComments();

            LoadInstructions();
            LoadControlLines();
            LoadMicroSourceCode();

            ProcessRegisterOperands();  // Search for instructions with registers as operand, e.g. MOV (r1),(r2)
                                        // and add the microcode for all valid register combinations.

            ProcessFlagsStates();       // Determine and add all possible flagg state for each t-state.

            ProcessControlWords();      // Generate control word for all of the t-states.

            CompileMicrocode();
        }

        private void RemoveComments()
        {
            while (source.Contains("#"))
            {
                int commentStart = source.IndexOf("#");
                int commentEnd = source.IndexOf("\n", commentStart);

                string beforeComment = source.Substring(0, commentStart);
                string afterComment = source.Substring(commentEnd + 1);

                source = beforeComment + afterComment;
            }
        }

        private void LoadInstructions()
        {
            string sectionCode = ExtractSection(SECTION_INSTRUCTIONS);

            instructions = sectionCode.Split(';', StringSplitOptions.RemoveEmptyEntries)
                .ToDictionary(i => i.Split(':').First(), i => i.Split(':').Last());
            
            Console.WriteLine($"Loaded {instructions.Count} instructions.");
        }

        private void LoadControlLines()
        {
            string sectionCode = ExtractSection(SECTION_CONTROLLINES);

            controlLines = sectionCode.Split(';', StringSplitOptions.RemoveEmptyEntries)
                .ToList();

            Console.WriteLine($"Loaded {controlLines.Count} control lines.");
        }

        private void LoadMicroSourceCode()
        {
            microSourceCode = new Dictionary<string, List<Dictionary<string, string>>>();
            
            string sectionCode = ExtractSection(SECTION_MICROCODE, true, false);

            // Remove open and close brace.
            sectionCode = sectionCode.Substring(1, sectionCode.Length - 2);

            // Load each instruction definition.
            int cursor = sectionCode.IndexOf("{");
            int endOfLastInstructionBlock = 0;

            while (cursor > -1 && cursor < sectionCode.Length)
            {
                // Get the mnemonic from the instruction definition.
                string mnemonic = sectionCode.Substring(endOfLastInstructionBlock, cursor - endOfLastInstructionBlock).Trim();
                
                cursor = sectionCode.IndexOf("{", cursor + 1);
                endOfLastInstructionBlock = sectionCode.IndexOf("}}", cursor + 1) + 2;

                var tstates = new List<Dictionary<string, string>>();

                while (cursor > -1 && cursor < endOfLastInstructionBlock)
                {
                    int closingBrace = sectionCode.IndexOf("}", cursor + 1);

                    // Get the state definition.
                    string tstate = sectionCode.Substring(cursor + 1, closingBrace - cursor - 1)
                        .Trim()
                        .Replace(" ", string.Empty);

                    var flagstates = new Dictionary<string, string>();

                    if (!tstate.Contains("["))
                    {
                        // If no flags state was defined, simply add the state with the irrelevant flags state.
                        flagstates.Add("xxxxx", tstate);
                    }
                    else
                    {
                        // One of more flags state found. Parse them.
                        flagstates = tstate.Split('[', StringSplitOptions.RemoveEmptyEntries)
                            .ToDictionary(flagstate => flagstate.Split(']').First(), flagstate => flagstate.Split(']').Last());
                    }

                    tstates.Add(flagstates);

                    cursor = sectionCode.IndexOf("{", closingBrace);
                }

                microSourceCode.Add(mnemonic, tstates);

                Console.WriteLine($"Loaded instruction '{mnemonic}' with {tstates.Count} t-state(s).");

                if (endOfLastInstructionBlock >= sectionCode.Length)
                {
                    break;
                }

                cursor = sectionCode.IndexOf("{", endOfLastInstructionBlock + 2);
            }
        }

        private void ProcessRegisterOperands()
        {
            var mnemonicsWithRegister = microSourceCode.Keys
                .Where(k => k.Contains("(r1)") || k.Contains("(r2)"))
                .ToArray();

            foreach (string mnemonic in mnemonicsWithRegister)
            {
                foreach (string r1 in REGISTERS)
                {
                    foreach (string r2 in REGISTERS)
                    {
                        string targetMnemonic = mnemonic
                            .Replace("(r1)", r1)
                            .Replace("(r2)", r2);
                        
                        if (instructions.ContainsKey(targetMnemonic) && !microSourceCode.ContainsKey(targetMnemonic))
                        {
                            // Replace register names in tstates.
                            var targetTStates = microSourceCode[mnemonic]
                                .Select(i => 
                                    new Dictionary<string, string>(
                                        i.Select(x => 
                                            new KeyValuePair<string, string>(x.Key, x.Value.Replace("(r1)", r1).Replace("(r2)", r2))
                                            )))
                                .ToList();

                            microSourceCode.Add(targetMnemonic, targetTStates);
                        }
                    }
                }

                microSourceCode.Remove(mnemonic);
            }
        }

        private void ProcessFlagsStates()
        {
            var updatedMicrocode = new Dictionary<string, List<Dictionary<string, string>>>();

            foreach (string mnemonic in microSourceCode.Keys)
            {
                var updatedTStates = new List<Dictionary<string, string>>();

                foreach (Dictionary<string, string> tstate in microSourceCode[mnemonic])
                {
                    var updatedFlags = new Dictionary<string, string>();

                    foreach (string flagsStateKey in tstate.Keys)
                    {
                        GenerateFlagsStates(flagsStateKey, tstate[flagsStateKey], updatedFlags);
                    }

                    updatedTStates.Add(updatedFlags);
                }

                updatedMicrocode.Add(mnemonic, updatedTStates);
            }

            microSourceCode = updatedMicrocode;
        }

        private void ProcessControlWords()
        {
            var updatedMicrocode = new Dictionary<string, List<Dictionary<string, string>>>();

            foreach (string mnemonic in microSourceCode.Keys)
            {
                var updatedTStates = new List<Dictionary<string, string>>();

                foreach (Dictionary<string, string> tstate in microSourceCode[mnemonic])
                {
                    var updatedFlags = new Dictionary<string, string>();

                    foreach (string flagsStateKey in tstate.Keys)
                    {
                        string controlWord = new string('0', 48);

                        tstate[flagsStateKey].Split(';', StringSplitOptions.RemoveEmptyEntries)
                            .ToList()
                            .ForEach(c =>
                            {
                                int index = controlLines.FindIndex(cl => cl == c);
                                controlWord = ReplaceCharAtIndex(controlWord, index, "1");
                            });

                        updatedFlags.Add(flagsStateKey, controlWord);
                    }

                    updatedTStates.Add(updatedFlags);
                }

                updatedMicrocode.Add(mnemonic, updatedTStates);
            }

            microSourceCode = updatedMicrocode;
        }

        private void CompileMicrocode()
        {
            Console.WriteLine("Compiling microcode...");

            if (File.Exists(targetFileName))
            {
                File.Delete(targetFileName);
            }

            using (var writer = new BinaryWriter(File.Open(targetFileName, FileMode.CreateNew)))
            {
                foreach (string mnemonic in microSourceCode.Keys)
                {
                    string instructionBits = instructions[mnemonic];

                    Console.WriteLine("---");
                    Console.WriteLine(mnemonic);

                    for (byte tstate = 0; tstate < microSourceCode[mnemonic].Count; tstate++)
                    {
                        string tstateBits = Convert.ToString(tstate, 2).PadLeft(4, '0');

                        foreach (string flagsStateBits in microSourceCode[mnemonic][tstate].Keys)
                        {
                            string controlWord = microSourceCode[mnemonic][tstate][flagsStateBits];

                            // Split the control word into 6 bytes.
                            for (int bank = 0; bank < 6; bank++)
                            {
                                string bankBits = Convert.ToString(bank, 2).PadLeft(3, '0');

                                // Construct ROM memory address:
                                // 
                                // [flags][instruction][t-state][bank]
                                // [00000][0000000][0000][000]
                                string addressString = flagsStateBits + instructionBits + tstateBits + bankBits;

                                string dataString = controlWord.Substring(bank * 8, 8);
                                Console.WriteLine($"{addressString}: {dataString}");

                                byte data = Convert.ToByte(dataString, 2);
                                int address = Convert.ToInt32(addressString, 2);

                                writer.Seek(address, SeekOrigin.Begin);
                                writer.Write(data);
                            }
                        }
                    }
                }
            }
        }

        private void GenerateFlagsStates(string flagsStateKey, string flagsStateValue, Dictionary<string, string> store)
        {
            for (int i = 0; i < flagsStateKey.Length; i++)
            {
                if (flagsStateKey[i] == 'x')
                {
                    for (int s = 0; s <= 1; s++)
                    {
                        string state = ReplaceCharAtIndex(flagsStateKey, i, s.ToString());

                        if (!state.Contains('x') && !store.ContainsKey(state))
                        {
                            store.Add(state, flagsStateValue);
                        }

                        GenerateFlagsStates(state, flagsStateValue, store);
                    }
                }
            }
        }
        
        private string ReplaceCharAtIndex(string input, int index, string replaceWith)
        {
            if (index == 0)
            {
                return replaceWith + input.Substring(1);
            }

            if (index == input.Length - 1)
            {
                return input.Substring(0, input.Length - 1) + replaceWith;
            }

            return input.Substring(0, index) + replaceWith + input.Substring(index + 1);
        }

        private string ExtractSection(string sectionName, bool untilLastBrace = false, bool removeBraces = true)
        {
            int sectionStart = source.IndexOf(sectionName);

            if (sectionStart == -1)
            {
                throw new CompilerException($"Could not find {sectionName} section");
            }

            // Extract all the code for this section.
            int braceStart = source.IndexOf("{", sectionStart);
            int braceEnd = source.IndexOf("}", braceStart);

            if (untilLastBrace)
            {
                braceEnd = source.LastIndexOf("}");
            }

            string sectionCode = source.Substring(braceStart, braceEnd - braceStart + 1);

            // Clean up the code
            sectionCode = sectionCode
                .Replace("\r", string.Empty)
                .Replace("\n", string.Empty)
                .Replace("\t", string.Empty)
                .Replace("  ", string.Empty)
                .Replace("  ", string.Empty)
                .Trim()
                .Trim(';');

            if (removeBraces)
            {
                sectionCode = sectionCode
                    .Replace("{", string.Empty)
                    .Replace("}", string.Empty);
            }

            return sectionCode;
        }
    }
}
