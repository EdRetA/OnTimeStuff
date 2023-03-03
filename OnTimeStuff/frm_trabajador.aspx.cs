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
            catch (SqlException)
            {
                mostrarmensaje("Ya existe una cédula igual");
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
            trabajador nuevotrabajador = new trabajador();
            nuevotrabajador.Id = int.Parse(txtCedula.Text);
            nuevotrabajador.Nombre = txtNombre.Text;
            nuevotrabajador.Apellido1 = txtApellido1.Text;
            nuevotrabajador.Apellido2 = txtApellido2.Text;
            nuevotrabajador.Fecha = Calendar1.SelectedDate;
            nuevotrabajador.Edificio = int.Parse(ddEdificio.SelectedValue);
            nuevotrabajador.Puesto = int.Parse(ddprofesion.SelectedValue);

            SqlDataSource1.InsertParameters[0].DefaultValue = nuevotrabajador.Id.ToString();
            SqlDataSource1.InsertParameters[1].DefaultValue = nuevotrabajador.Nombre;
            SqlDataSource1.InsertParameters[2].DefaultValue = nuevotrabajador.Apellido1;
            SqlDataSource1.InsertParameters[3].DefaultValue = nuevotrabajador.Apellido2;
            SqlDataSource1.InsertParameters[4].DefaultValue = nuevotrabajador.Fecha.ToString();
            SqlDataSource1.InsertParameters[5].DefaultValue = nuevotrabajador.Edificio.ToString();
            SqlDataSource1.InsertParameters[6].DefaultValue = nuevotrabajador.Puesto.ToString();
            SqlDataSource1.Insert();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }
    
}