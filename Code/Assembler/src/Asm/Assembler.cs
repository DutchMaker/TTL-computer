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
        private static Assembler _assembler;
        private MicrocodeCompiler microcodeCompiler;

        private string targetFileName;
        private string source;

        public static void Assemble(string microcodeSourceFile, string programSourceFile)
        {
            string targetFileName = programSourceFile.Split('.', StringSplitOptions.RemoveEmptyEntries).First() + ".bin";
            string programCode = File.ReadAllText(programSourceFile);

            _assembler = new Assembler(microcodeSourceFile, programCode, targetFileName);
            _assembler.Assemble();
        }

        private Assembler(string microcodeSourceFile, string programCode, string targetFileName)
        {
            this.microcodeCompiler = MicrocodeCompiler.Compile(microcodeSourceFile);

            this.source = programCode;
            this.targetFileName = targetFileName;
        }

        private void Assemble()
        {
            RemoveComments();
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
    }
}
