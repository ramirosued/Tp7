using System.Data.SqlClient;
using Dapper;

using System.Collections.Generic;

public static class BD
{
    static List<Categoria> ListaCategorias = new List<Categoria>();
    static List<string> ListaDificultades = new List<string>();
    static List<Pregunta> ListaPreguntas = new List<Pregunta>();
    static List<Respuesta> ListaRespuestas = new List<Respuesta>();


    private static string connectionString = @"Server=localhost;DataBase=PreguntadOrt;Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        using (SqlConnection bd = new SqlConnection(connectionString))
        {
            string sql = "SELECT Nombre FROM Categorias";
            ListaCategorias = bd.Query<Categoria>(sql).ToList();
        }
        return ListaCategorias;
    }

    public static List<string> ObtenerDificultades()
    {
        using (SqlConnection bd = new SqlConnection(connectionString))
        {
            string sql = "SELECT Nombre FROM Dificultades";
            ListaDificultades = bd.Query<string>(sql).ToList();
        }
        return ListaDificultades;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        using (SqlConnection bd = new SqlConnection(connectionString))
        {
            if (dificultad == -1)
            {
                if (categoria == -1)
                {
                    string sql = "SELECT * FROM Preguntas";
                    ListaPreguntas = bd.Query<Pregunta>(sql).ToList();
                }
                else
                {
                    string sql = "SELECT * FROM Preguntas where Fkcategoria=@IdCategoria";
                    ListaPreguntas = bd.Query<Pregunta>(sql, new { IdCategoria = categoria }).ToList();
                }
            }

            else if (categoria == -1)
            {
                string sql = "SELECT * FROM Preguntas where FkDificultad=@IdDificultad";
                ListaPreguntas = bd.Query<Pregunta>(sql, new { IdDificultad = dificultad }).ToList();
            }
            else
            {
                string sql = "SELECT * FROM Preguntas where FkDificultad=@IdDificultad and FkCategoria=@IdCategoria";
                ListaPreguntas = bd.Query<Pregunta>(sql, new { IdDificultad = dificultad, IdCategoria = categoria }).ToList();
            }

        }
        return ListaPreguntas;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        ListaRespuestas.Clear();
        using (SqlConnection bd = new SqlConnection(connectionString))
        {
            string sql = "SELECT * FROM Respuestas where FkPregunta=@IdPregunta";
            foreach (Pregunta item in preguntas)
            {
                ListaRespuestas.AddRange(bd.Query<Respuesta>(sql, new { IdPregunta = item.IdPregunta }).ToList());
            }
        }
        return ListaRespuestas;
    }
}