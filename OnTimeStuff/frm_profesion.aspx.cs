using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTimeStuff
{
    public partial class frm_profesion : System.Web.UI.Page
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
                mostrarmensaje("Puesto Ingresado");
            }
            catch (SqlException)
            {
                mostrarmensaje("Error al ingresar el puesto");
            }

        }

        public void mostrarmensaje(string message)
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
            
            txtNombre.Text = string.Empty;            
            ddsalario.SelectedIndex = -1;

        }

        public void insertar()
        {
            profesion nuevaprofesion = new profesion();

            nuevaprofesion.Nombre = txtNombre.Text;
            nuevaprofesion.Grado = int.Parse(ddsalario.SelectedValue);
            

           
            SqlDataSource2.InsertParameters[0].DefaultValue = nuevaprofesion.Nombre;
            SqlDataSource2.InsertParameters[1].DefaultValue = nuevaprofesion.Grado.ToString();
          
            SqlDataSource2.Insert();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            limpiar();
        }
    }

}