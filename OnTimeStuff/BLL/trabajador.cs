using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnTimeStuff
{
    public class trabajador
    {
        public int Id { get; set; }
        public String Nombre { get; set; }
        public String Apellido1 { get; set; }
        public String Apellido2 { get; set; }
        public DateTime Fecha { get; set; }
        public int Edificio { get; set; }
        public int Puesto { get; set; }

        public trabajador(){
        }        
        
    }
    
}