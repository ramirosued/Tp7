static class Juego{
    private static string Username;
    private static int PuntajeActual;
    private static int CantCorrectas;
    public static List<Pregunta> ListaPreguntas = new List <Pregunta>();
    public static List<Respuesta> ListaRespuestas = new List <Respuesta>();


    public static void InicializarJuego(){
        Username="";
        PuntajeActual=0;
        CantCorrectas=0;
    }
    public static string ObtenerUsername(){
        return Username;
    }
    public static int ObtenerPuntajeActual(){
        return PuntajeActual;
    }
    public static int ObtenerCantCorrectas(){
        return CantCorrectas;
    }

    public static List<Categoria> ObtenerCategorias(){
        List<Categoria> ListaCategorias = new List<Categoria>();
        return ListaCategorias;
    }

    public static List<Dificultad> ObtenerDificultades(){
        List<Dificultad> ListaDificultades = new List<Dificultad>();
        return ListaDificultades;
    }

    public static void CargarPartidas(string username, int dificultad, int categoria){
        ListaPreguntas=BD.ObtenerPreguntas(dificultad, categoria);
        ListaRespuestas=BD.ObtenerRespuestas(ListaPreguntas);
        Username=username;
    }

    public static Pregunta ObtenerProximaPregunta(){
        return ListaPreguntas[0];
    }
    
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta){
        List<Respuesta> ProximasRespuestas = new List<Respuesta>();
        foreach(Respuesta item in ListaRespuestas){
            if(item.FkPregunta==idPregunta)
            {
                ProximasRespuestas.Add(item);
            }
        }
        return ProximasRespuestas;
    }

    public static bool VerificarRespuesta(int idPregunta, int idRespuesta){
        bool correcto=false;
        foreach (Respuesta item in ListaRespuestas)
        {
            if(item.IdRespuesta==idRespuesta&&item.Correcta==true){
                correcto=true;
                CantCorrectas++;
                PuntajeActual=PuntajeActual+50;
            }
        }
        ListaPreguntas.RemoveAt(0);
        return correcto;
    }
}


