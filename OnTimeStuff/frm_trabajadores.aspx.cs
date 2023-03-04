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
            //lbtCedula.Visible = false;
            //lbtNombre.Visible = false;
            //lbtApellido1.Visible = false;
            //lbtApellido2.Visible = false;
            //lbtCalendario.Visible = false;
            //lblCedula.Visible = false;
            //lblNombre.Visible = false;
            //lblApellido1.Visible = false;
            //lblApellido2.Visible = false;
            //lblCalendario.Visible = false;
            //lblEdificio.Visible = false;
            //lblProfesion.Visible = false;
            //ddEdificio.Visible = false;
            //ddprofesion.Visible = false;
            desactivar();
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //    txtCedula.Visible = true;
        //    txtNombre.Visible = true;
        //    txtApellido1.Visible = true;
        //    txtApellido2.Visible = true;
        //    Calendario.Visible = true;
        //    lblCedula.Visible = true;
        //    lblNombre.Visible = true;
        //    lblApellido1.Visible = true;
        //    lblApellido2.Visible = true;
        //    lblCalendario.Visible = true;
        //    //int persona = int.Parse(sender);
        //}

        protected void gvTrabajadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lbtCedula.Visible = true;
            //lbtNombre.Visible = true;
            //lbtApellido1.Visible = true;
            //lbtApellido2.Visible = true;
            //lbtCalendario.Visible = true;
            //lblCedula.Visible = true;
            //lblNombre.Visible = true;
            //lblApellido1.Visible = true;
            //lblApellido2.Visible = true;
            //lblCalendario.Visible = true;
            //lbtEdificio.Visible = true;
            //lbtProfesion.Visible = true;
            //lblEdificio.Visible = true;
            //lblProfesion.Visible = true;
            GridViewRow row = gvTrabajadores.SelectedRow;
            Buscar(row.Cells[0].Text);
            activar();
            //Select DGV
            //lbtCedula.Text = row.Cells[0].Text;
            //lbtNombre.Text = row.Cells[1].Text;
            //lbtApellido1.Text = row.Cells[2].Text;
            //lbtApellido2.Text = row.Cells[3].Text;
            //lbtCalendario.Text = row.Cells[4].Text;
            //lbtEdificio.Text = row.Cells[5].Text;
            //lbtProfesion.Text = row.Cells[6].Text;

            //dsTrabajador.SelectParameters[0].DefaultValue= row.Cells[0].Text;
            //dsTrabajador.DataBind();
            //GridView nuevo = new GridView();
            //nuevo.DataSource = dsTrabajador;
            //nuevo.DataBind();
            //GridViewRow rowd = nuevo.Rows[0];
            //lbtCedula.Text = rowd.Cells[0].Text;
            //lbtNombre.Text = rowd.Cells[1].Text;
            //lbtApellido1.Text = rowd.Cells[2].Text;
            //lbtApellido2.Text = rowd.Cells[3].Text;
            //lbtCalendario.Text = rowd.Cells[4].Text.Substring(0, (rowd.Cells[4].Text.Length-12));
            //lbtEdificio.Text = rowd.Cells[5].Text;
            //lbtProfesion.Text = rowd.Cells[6].Text;

        }
        protected void activar()
        {
            lbtCedula.Visible = true;
            lbtNombre.Visible = true;
            lbtApellido1.Visible = true;
            lbtApellido2.Visible = true;
            lbtCalendario.Visible = true;
            lblCedula.Visible = true;
            lblNombre.Visible = true;
            lblApellido1.Visible = true;
            lblApellido2.Visible = true;
            lblCalendario.Visible = true;
            lbtEdificio.Visible = true;
            lbtProfesion.Visible = true;
            lblEdificio.Visible = true;
            lblProfesion.Visible = true;
        }
        public void desactivar()
        {
            lbtCedula.Visible = false;
            lbtNombre.Visible = false;
            lbtApellido1.Visible = false;
            lbtApellido2.Visible = false;
            lbtCalendario.Visible = false;
            lblCedula.Visible = false;
            lblNombre.Visible = false;
            lblApellido1.Visible = false;
            lblApellido2.Visible = false;
            lblCalendario.Visible = false;
            lblEdificio.Visible = false;
            lblProfesion.Visible = false;
            cmdEntrada.Visible = false;
            lbtProfesion.Visible = false;
            lbtEdificio.Visible = false;
            txtId.Text = "";
        }

        protected void Buscar(string id)
        {            
            dsTrabajador.SelectParameters[0].DefaultValue = id;
            dsTrabajador.DataBind();
            GridView nuevo = new GridView();
            nuevo.DataSource = dsTrabajador;
            nuevo.DataBind();
            GridViewRow rowd = nuevo.Rows[0];
            lbtCedula.Text = rowd.Cells[0].Text;
            lbtNombre.Text = rowd.Cells[1].Text;
            lbtApellido1.Text = rowd.Cells[2].Text;
            lbtApellido2.Text = rowd.Cells[3].Text;
            lbtCalendario.Text = rowd.Cells[4].Text.Substring(0, (rowd.Cells[4].Text.Length - 12));
            lbtEdificio.Text = rowd.Cells[5].Text;
            lbtProfesion.Text = rowd.Cells[6].Text;
            cmdEntrada.Visible = true;
        }

        protected void cmdBuscar_Click(object sender, EventArgs e)
        {
            Buscar(txtId.Text);
            activar();
        }

        protected void cmdEntrada_Click(object sender, EventArgs e)
        {
            dsMarca.InsertParameters[0].DefaultValue = lbtCedula.Text;                       
            dsMarca.Insert();
            mostrarmensaje("Marca ingresada correctamente");
            desactivar();

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
    }
}