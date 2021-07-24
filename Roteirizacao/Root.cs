using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Roteirizacao
{
    public class Root
    {
        //Root root = new Root()
        //{
        //    veiculo = "",
        //    rotas = new List<string>(),
        //    listaCargas = new List<Cargas>(),
        //};

        public string veiculo { get; set; }
        public List<string> rotas { get; set; }
        public List<Cargas> listaCargas { get; set; }



    }
}