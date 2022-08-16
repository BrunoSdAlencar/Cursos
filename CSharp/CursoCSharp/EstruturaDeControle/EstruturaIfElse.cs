using System;
using System.Collections.Generic;
using System.Text;

namespace CursoCSharp.EstruturaDeControle
{
    class EstruturaIfElse
    {
        public static void Executar() {
            string entrada;

            Console.WriteLine("Nota do aluno:");
            entrada = Console.ReadLine();
            Double.TryParse(entrada, out double nota);

            if (nota >= 7.0) {
                Console.WriteLine("Aprovado!");
                Console.WriteLine("Não fez mais que a sua obrigação...");
            } else {
                Console.WriteLine("Recuperação");
            }
        }
    }
}
