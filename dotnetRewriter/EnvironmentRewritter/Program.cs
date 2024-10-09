using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        // Obtener el valor de la variable de entorno API_URL
        string apiUrl = Environment.GetEnvironmentVariable("API_URL");

        if (string.IsNullOrEmpty(apiUrl))
        {
            Console.WriteLine("API_URL no está configurada.");
            return;
        }

        // Ruta del archivo environment.ts
        string environmentFilePath = '../src/environments/environment.ts';

        // Crear o sobrescribir el contenido del archivo environment.ts
        string content = $"export const environment = {{ production: true, API_URL: '{apiUrl}', envs: '{}'}};";

        try
        {
            File.WriteAllText(environmentFilePath, content);
            Console.WriteLine($"El archivo {environmentFilePath} ha sido sobrescrito con el valor de API_URL.");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error al escribir en el archivo: {ex.Message}");
        }
    }
}