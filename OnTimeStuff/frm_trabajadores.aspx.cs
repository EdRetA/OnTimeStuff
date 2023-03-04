using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnTimeStuff
{
    public partial class frm_trabajadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCedula.Visible = false;
            txtNombre.Visible = false;
            txtApellido1.Visible = false;
            txtApellido2.Visible = false;
            Calendario.Visible = false;
            lblCedula.Visible = false;
            lblNombre.Visible = false;
            lblApellido1.Visible = false;
            lblApellido2.Visible = false;
            lblCalendario.Visible = false;
            //ddEdificio.Visible = false;
            //ddprofesion.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            txtCedula.Visible = true;
            txtNombre.Visible = true;
            txtApellido1.Visible = true;
            txtApellido2.Visible = true;
            Calendario.Visible = true;
            lblCedula.Visible = true;
            lblNombre.Visible = true;
            lblApellido1.Visible = true;
            lblApellido2.Visible = true;
            lblCalendario.Visible = true;
            //int persona = int.Parse(sender);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCedula.Visible = true;
            txtNombre.Visible = true;
            txtApellido1.Visible = true;
            txtApellido2.Visible = true;
            Calendario.Visible = true;
            lblCedula.Visible = true;
            lblNombre.Visible = true;
            lblApellido1.Visible = true;
            lblApellido2.Visible = true;
            lblCalendario.Visible = true;
            //int var=GridView1.SelectedRow.
        }
    }
}