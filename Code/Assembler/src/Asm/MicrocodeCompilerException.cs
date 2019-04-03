using System;
using System.Collections.Generic;
using System.Text;

namespace Asm
{
    public class MicrocodeCompilerException : Exception
    {
        public MicrocodeCompilerException(string message) 
            : base(message)
        {
        }
    }
}