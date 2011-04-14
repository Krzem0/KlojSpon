using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SpeechLib;

namespace ConsoleForFun
{
    class Program
    {
        static void Main(string[] args)
        {
            SpVoice voice = new SpVoice();
            string esc = "n";
            do
            {
                Console.WriteLine("Napisz tekst do przeczytania");
                string command = Console.ReadLine();
                voice.Speak(command, SpeechVoiceSpeakFlags.SVSFlagsAsync);
                Console.WriteLine("Zakończ: 't' - tak 'n' - nie");
                esc = Console.ReadLine();
            } while (esc != "t");

            //Obdzekt o = new Obdzekt();
            //o.cos = 3;
            //o.nazwa = "macin";

            //Console.WriteLine(o.nazwa);
            //Console.WriteLine(o.cos);

            ////o.JakasMetoda("NIE macin");
            ////o.Foo(2);

            ////o.Bar(o);
            ////Metody.Foo(o);
            ////Obdzekt oo = Metody.Bar(o);
            ////Obdzekt oo = Metody.Clone(o);
            //Obdzekt oo = Metody.Clone2(o);

            //Console.WriteLine(oo.nazwa);
            //Console.WriteLine(oo.cos);

            //oo.nazwa = "cycki";
            //oo.cos = 1500100900;

            //Console.WriteLine(oo.nazwa);
            //Console.WriteLine(oo.cos);

            //Console.ReadKey(true);
        }
    }
}
