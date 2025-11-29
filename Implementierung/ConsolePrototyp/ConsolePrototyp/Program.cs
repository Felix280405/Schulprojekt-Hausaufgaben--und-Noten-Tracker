using System;
using System.Collections.Generic;

class Program
{
    static List<string> hausaufgaben = new List<string>();
    static List<(string Fach, double Note)> noten = new List<(string, double)>();

    static void Main()
    {
        

        while (true)
        {
           
            Console.WriteLine("1 = Hausaufgabe hinzufügen");
            Console.WriteLine("2 = Hausaufgaben anzeigen");
            Console.WriteLine("3 = Note hinzufügen");
            Console.WriteLine("4 = Noten anzeigen");
            Console.WriteLine("5 = Beenden");
            Console.Write("Auswahl: ");

            string eingabe = Console.ReadLine();

            switch (eingabe)
            {
                case "1": AufgabeHinzufuegen(); break;
                case "2": AufgabenAnzeigen(); break;
                case "3": NoteHinzufuegen(); break;
                case "4": NotenAnzeigen(); break;
                case "5": return;
                default: Console.WriteLine("Ungültige Eingabe."); break;
            }
        }
    }

    static void AufgabeHinzufuegen()
    {
        Console.Write("Titel der Aufgabe: ");
        string titel = Console.ReadLine();
        hausaufgaben.Add(titel);
        Console.WriteLine("Hausaufgabe gespeichert!");
    }

    static void AufgabenAnzeigen()
    {
        Console.WriteLine("\nAktuelle Hausaufgaben:");
        if (hausaufgaben.Count == 0)
        {
            Console.WriteLine("Keine Hausaufgaben vorhanden.");
        }
        else
        {
            foreach (var a in hausaufgaben)
                Console.WriteLine(a);
        }
    }

    static void NoteHinzufuegen()
    {
        Console.Write("Fach: ");
        string fach = Console.ReadLine();
        Console.Write("Note: ");
        if (double.TryParse(Console.ReadLine(), out double note))
        {
            noten.Add((fach, note));
            Console.WriteLine("Note gespeichert!");
        }
        else
        {
            Console.WriteLine("Ungültige Eingabe!");
        }
    }

    static void NotenAnzeigen()
    {
        Console.WriteLine("\nGespeicherte Noten:");
        if (noten.Count == 0)
        {
            Console.WriteLine("Keine Noten vorhanden.");
        }
        else
        {
            foreach (var n in noten)
                Console.WriteLine($"{n.Fach}: {n.Note}");
        }
    }
}

