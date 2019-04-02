using System;
using System.Collections.Generic;
using System.Text;

namespace Mcc
{
    public class CompilerException : Exception
    {
        public CompilerException(string message) 
            : base(message)
        {
        }
    }
}