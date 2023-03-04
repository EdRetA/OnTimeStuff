using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnTimeStuff
{
    public class empleado
    {
        public int Id { get; set; }
        public String Nombre { get; set; }
        public String Apellido1 { get; set; }
        public String Apellido2 { get; set; }
        public DateTime Fecha { get; set; }
        public int Edificio { get; set; }
        public int Puesto { get; set; }

        public empleado(){
}

        //public empleado (int id, string nombre, string apellido1, string apellido2, DateTime fecha, int edificio)
        //{
        //    Id = id;
        //    Nombre = nombre;
        //    Apellido1 = apellido1;
        //    Apellido2 = apellido2;
        //    Fecha = fecha;
        //    Edificio = edificio;
        //}
        
        
    }
    
}