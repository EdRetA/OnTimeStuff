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
            String currurl = HttpContext.Current.Request.RawUrl;
            if (currurl.EndsWith("0"))
            {
                lbltitulo.Text = "Ingreso de funcionario";
            }
            else 
            {
                lbltitulo.Text = "Ascenso de funcionario";
            };




            if (!IsPostBack)
            {
                desactivar();
            }             
        }        

        

        protected void gvTrabajadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow row = gvTrabajadores.SelectedRow;
            Buscar(row.Cells[0].Text);
            activar();           

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

            String currurl = HttpContext.Current.Request.RawUrl;

            multipantalla(currurl.EndsWith("0"));
        }

        private void multipantalla(bool parent)
        {
            if (parent) { 
                cmdEntrada.Visible = true;
                cmdAscenso.Visible = false;
                
            }
            else {
                cmdEntrada.Visible = false;
                cmdAscenso.Visible = true;
                calAscenso.Visible = true;
                ddprofesion.Visible = true;
                lbl_FechaAscenso.Visible = true;
                lblAscensoProfesion.Visible = true;
                
            };
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
            cmdAscenso.Visible = false;
            calAscenso.Visible = false;
            ddprofesion.Visible = false;
            lbl_FechaAscenso.Visible = false;
            lblAscensoProfesion.Visible = false;
            txtId.Text = "";
        }

        protected void Buscar(string id)
        {
            desactivar();
            dsTrabajador.SelectParameters[0].DefaultValue = id;
            dsTrabajador.DataBind();
            GridView nuevo = new GridView();
            nuevo.DataSource = dsTrabajador;
            nuevo.DataBind();
            if (nuevo.Rows.Count!=0)
            {
                GridViewRow rowd = nuevo.Rows[0];
                lbtCedula.Text = rowd.Cells[0].Text;
                lbtNombre.Text = rowd.Cells[1].Text;
                lbtApellido1.Text = rowd.Cells[2].Text;
                lbtApellido2.Text = rowd.Cells[3].Text;
                lbtCalendario.Text = rowd.Cells[4].Text.Substring(0, (rowd.Cells[4].Text.Length - 12));
                lbtEdificio.Text = rowd.Cells[5].Text;
                lbtProfesion.Text = rowd.Cells[6].Text;
                cmdEntrada.Visible = true;
                activar();
            }
            else
            {
                mostrarmensaje("El empleado no existe");
            };
            
        }
        protected string BuscarPuesto(string id)
        {
            dsPersona.SelectParameters[0].DefaultValue = id;
            dsPersona.DataBind();
            GridView nuevo = new GridView();
            nuevo.DataSource = dsPersona;
            nuevo.DataBind();
            GridViewRow rowd = nuevo.Rows[0];
          
            return rowd.Cells[1].Text;
            
        }

        protected void cmdBuscar_Click(object sender, EventArgs e)
        {
            
            Buscar(txtId.Text);
            
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

        protected void cmdAscenso_Click(object sender, EventArgs e)
        {
            empleado Empleado = new empleado();
            Empleado.Id = int.Parse(lbtCedula.Text);

            if (DateTime.MinValue.ToString() != calAscenso.SelectedDate.ToString())
            {
                Empleado.Fecha = calAscenso.SelectedDate;
                Empleado.Puesto = int.Parse(ddprofesion.SelectedValue);


                dsAscensos.InsertParameters[0].DefaultValue = Empleado.Id.ToString();
                dsAscensos.InsertParameters[1].DefaultValue = Empleado.Puesto.ToString();
                dsAscensos.InsertParameters[2].DefaultValue = BuscarPuesto(Empleado.Id.ToString());
                dsAscensos.InsertParameters[3].DefaultValue = Empleado.Fecha.ToString();

                dsPersona.UpdateParameters[0].DefaultValue = Empleado.Puesto.ToString();
                dsPersona.UpdateParameters[1].DefaultValue = Empleado.Fecha.ToString();
                dsPersona.UpdateParameters[2].DefaultValue = Empleado.Id.ToString();


                dsAscensos.Insert();
                dsPersona.Update();
                mostrarmensaje("Ascenso ingresado correctamente");
                desactivar();
            }
            else
            {
                mostrarmensaje("Seleccione una fecha para el Ascenso");
            }

            
        }

        
    }
}