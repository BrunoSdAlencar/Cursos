using System;
using System.Globalization;


namespace CursoCSharp.Fundamentos
{
    class FormatandoNumero
    {
        public static void Executar() {
            double valor = 15.175;
            // Casas decimais F1, F2, F3
            Console.WriteLine(valor.ToString("F1"));
            Console.WriteLine(valor.ToString("F2"));
            Console.WriteLine(valor.ToString("F3"));
            // Valor monetario
            Console.WriteLine(valor.ToString("C"));
            // Porcentagem
            Console.WriteLine(valor.ToString("P"));
            Console.WriteLine(valor.ToString("#.##"));

            // pt-BR
            CultureInfo cultura = new CultureInfo("en-US");
            Console.WriteLine(valor.ToString("C3", cultura));

            int inteiro = 256;
            Console.WriteLine(inteiro.ToString("D10"));

        }
    }
}
