﻿using System;
using System.Collections.Generic;
using System.Text;

namespace CursoCSharp
{
    class OperadoresLogicos
    {
        public static void Executar() {
            var executouTrabalho1 = false;
            var executouTrabalho2 = false;

            bool comprouTv50 = executouTrabalho1 && executouTrabalho2;
            Console.WriteLine("Comprou a Tv 50? {0}", comprouTv50);

            var comprouSorvete = executouTrabalho1 || executouTrabalho2;
            Console.WriteLine("Comprou o sorvete? {0}", comprouSorvete);

            var comprouTv32 = executouTrabalho1 ^ executouTrabalho2;
            Console.WriteLine("Comprou a Tv 32? {0}", comprouTv32);

            // !usado para negação logica, transorma verdadeiro em falso
            Console.WriteLine("Mais saudável? {0}", !comprouSorvete);
        }
    }
}
