using System;
using System.Collections.Generic;
using System.Text;

namespace CursoCSharp
{
    class OperadoresAritmeticos
    {
        public static void Executar() {
            // Preço Desconto
            var preco = 1000.0;
            var imposto = 355;
            var desconto = 0.1;

            double total = preco + imposto;
            var totalComDesconto = total - (total * desconto);
            Console.WriteLine($"O preço final é {totalComDesconto}");

            //IMC
            //double peso = 91.2;
            
            Console.Write("Qual o seu peso? ");
            double peso = double.Parse(Console.ReadLine());
            Console.WriteLine($"Peso é {peso} kg.");

            //double altura = 1.82;

            Console.Write("Qual a sua altura?");
            double altura = double.Parse(Console.ReadLine());
            Console.WriteLine($"Altura é {altura} m.");

            double imc = peso / Math.Pow(altura, 2);
            Console.WriteLine($"IMC é {imc}");

            // Número Par/Impar
            int par = 24;      
            int impar = 55;
            Console.WriteLine("{0}/2 tem resto {1}", par, par % 2);
            Console.WriteLine("{0}/2 tem resto {1}", impar, impar % 2);
        }
    }
}
