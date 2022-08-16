using System;
using System.Collections.Generic;
using System.Text;

namespace CursoCSharp.Fundamentos
{
    class LendoDados
    {
        public static void Executar() {
            Console.Write("Qual é o seu nome? ");
            string nome = Console.ReadLine();

            Console.Write("Qual é a sua idade? ");
            // Parse vai converter texto para numero, string para int
            int idade = int.Parse(Console.ReadLine());

            Console.Write("Qual é o seu salário? ");
            double salario = double.Parse(Console.ReadLine());
           //CultureInfo.InvariantCulture não funciona
        
            Console.WriteLine($"{nome} tem {idade} anos e recebe R${salario} de salário!");
        }
    }
}
