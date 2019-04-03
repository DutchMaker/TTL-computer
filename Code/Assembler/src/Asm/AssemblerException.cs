using System;
using System.Collections.Generic;
using System.Text;

namespace Asm
{
    public class AssemblerException : Exception
    {
        public AssemblerException(string message) 
            : base(message)
        {
        }
    }
}