using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace OnTimeStuff
{
    public partial class frm_trabajador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                insertar();
                limpiar();
                mostrarmensaje("Usuario Ingresado");
            }
            // catch (SqlException)
            catch (SqlException ex)
            {
                //mostrarmensaje("Ya existe una cédula igual");
            }
            

        }

        public void mostrarmensaje (string message)
        {
            
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        public void limpiar()
        {
            txtCedula.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtApellido1.Text = string.Empty;
            txtApellido2.Text = string.Empty;
            Calendar1.SelectedDate = DateTime.Today;
            ddEdificio.SelectedIndex = -1;
            ddprofesion.SelectedIndex = -1;

        }

        public void insertar()
        {
            empleado nuevoEmpleado = new empleado();
            nuevoEmpleado.Id = int.Parse(txtCedula.Text);
            nuevoEmpleado.Nombre = txtNombre.Text;
            nuevoEmpleado.Apellido1 = txtApellido1.Text;
            nuevoEmpleado.Apellido2 = txtApellido2.Text;
            nuevoEmpleado.Fecha = Calendar1.SelectedDate;
            nuevoEmpleado.Edificio = int.Parse(ddEdificio.SelectedValue);
            nuevoEmpleado.Puesto = int.Parse(ddprofesion.SelectedValue);

            
            dsTrabajador.InsertParameters[0].DefaultValue = nuevoEmpleado.Id.ToString();
            dsTrabajador.InsertParameters[1].DefaultValue = nuevoEmpleado.Nombre;
            dsTrabajador.InsertParameters[2].DefaultValue = nuevoEmpleado.Apellido1;
            dsTrabajador.InsertParameters[3].DefaultValue = nuevoEmpleado.Apellido2;
            dsTrabajador.InsertParameters[4].DefaultValue = nuevoEmpleado.Fecha.ToString();
            dsTrabajador.InsertParameters[5].DefaultValue = nuevoEmpleado.Edificio.ToString();
            dsTrabajador.InsertParameters[6].DefaultValue = nuevoEmpleado.Puesto.ToString();
            dsTrabajador.Insert();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
    
}