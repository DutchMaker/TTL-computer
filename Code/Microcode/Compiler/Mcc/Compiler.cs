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

        private static Compiler _compiler;

        private string source;
        private Dictionary<string, string> instructions;
        private List<string> controlLines;

        public static void Compile(string fileName)
        {
            string source = File.ReadAllText(fileName);

            _compiler = new Compiler(source);
            _compiler.Compile();
        }

        private Compiler(string source)
        {
            this.source = source;
        }

        private void Compile()
        {
            RemoveComments();
            LoadInstructions();
            LoadControlLines();

            // Console.Write(source);
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
            int sectionStart = source.IndexOf(SECTION_INSTRUCTIONS);

            if (sectionStart == -1)
            {
                throw new CompilerException($"Could not find {SECTION_INSTRUCTIONS} section");
            }
            
            // Extract all the code for this section.
            int braceStart = source.IndexOf("{", sectionStart);
            int braceEnd = source.IndexOf("}", braceStart);

            string sectionCode = source.Substring(braceStart, braceEnd - braceStart + 1);

            // Clean up the code
            sectionCode = sectionCode
                .Replace("\r", string.Empty)
                .Replace("\n", string.Empty)
                .Replace("\t", string.Empty)
                .Replace("  ", string.Empty)
                .Replace("  ", string.Empty)
                .Replace("{", string.Empty)
                .Replace("}", string.Empty)
                .Trim()
                .Trim(';');

            instructions = sectionCode.Split(';', StringSplitOptions.RemoveEmptyEntries)
                .ToDictionary(i => i.Split(':').First(), i => i.Split(':').Last());
            
            Console.WriteLine($"Loaded {instructions.Count} instructions.");
        }

        private void LoadControlLines()
        {
            int sectionStart = source.IndexOf(SECTION_CONTROLLINES);

            if (sectionStart == -1)
            {
                throw new CompilerException($"Could not find {SECTION_CONTROLLINES} section");
            }

            // Extract all the code for this section.
            int braceStart = source.IndexOf("{", sectionStart);
            int braceEnd = source.IndexOf("}", braceStart);

            string sectionCode = source.Substring(braceStart, braceEnd - braceStart + 1);

            // Clean up the code
            sectionCode = sectionCode
                .Replace("\r", string.Empty)
                .Replace("\n", string.Empty)
                .Replace("\t", string.Empty)
                .Replace("  ", string.Empty)
                .Replace("  ", string.Empty)
                .Replace("{", string.Empty)
                .Replace("}", string.Empty)
                .Trim()
                .Trim(';');

            controlLines = sectionCode.Split(';', StringSplitOptions.RemoveEmptyEntries)
                .ToList();

            Console.WriteLine($"Loaded {controlLines.Count} control lines.");
        }
    }
}
