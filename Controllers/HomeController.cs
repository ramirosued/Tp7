using Microsoft.AspNetCore.Mvc;
namespace Tp7.Controllers;
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Categorias=BD.ObtenerCategorias();
        ViewBag.Fificultades=BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartidas(username, dificultad, categoria);
        if(Juego.ListaPreguntas.Count!=0){
            return RedirectToAction("Jugar");
        }else{
            return RedirectToAction("ConfigurarJuego");
        }
        
    }

    public IActionResult Jugar()
    {   
        ViewBag.username=Juego.ObtenerUsername();
        ViewBag.puntos= Juego.ObtenerPuntajeActual();
        ViewBag.CantCorrectas=Juego.ObtenerCantCorrectas();
        if(Juego.ListaPreguntas.Count==0){
            return View("Fin");
        }else{
            ViewBag.PreguntaActual= Juego.ObtenerProximaPregunta();
            ViewBag.OpcionesPregunta= Juego.ObtenerProximasRespuestas(ViewBag.PreguntaActual.IdPregunta);
            return View("Jugar");
        }
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.VerificadoRespuesta=Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View();
    }
}