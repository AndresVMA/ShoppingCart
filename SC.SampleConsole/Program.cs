using SC.Utilities;
using System;

namespace SC.SampleConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine(Cryptor.GenerateSecureSecret());
            }
        }
    }
}
