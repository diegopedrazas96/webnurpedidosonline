using Access.Seguridad;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresas_RegistEmpresa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            return;
        }
        lbVal.Text = "";

        List<TipoHijos> hijos = TipoHijoBRL.getTipoHijoByIdMaestro(1);
        EmpresaComboBox.DataSource = hijos;
        EmpresaComboBox.DataBind();


    }

    protected void EmpresaComboBox_DataBound(object sender, EventArgs e)
    {
        EmpresaComboBox.Items.Insert(0, new ListItem("Seleccione un Producto...", ""));
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        lbVal.Text = "";
        string nit = txtNit.Text.Trim();
        string nombre = txtNombre.Text.Trim();
        string gerente = txtGerente.Text.Trim();
        string telefono = txtTelefono.Text.Trim();

        if (String.IsNullOrEmpty(nit))
        {
            lbVal.Text = "La casilla Nit no debe estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(nombre))
        {
            lbVal.Text = "La casilla Nombre no debe estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(gerente))
        {
            lbVal.Text = "La casilla Gerente no debe estar Vacía";
            return;
        }
        if (String.IsNullOrEmpty(telefono))
        {
            lbVal.Text = "La casilla Telefono no debe estar Vacía";
            return;
        }

        string value = EmpresaComboBox.SelectedValue;
        int indexSelected = EmpresaComboBox.SelectedIndex;
        if (indexSelected == 0)
        {
            lbVal.Text = "Debe Seleccionar un Tipo de Empresa";
            return;
        }

        Empresa obj = new Empresa();
        obj.TipoIdc = Convert.ToInt32(value);
        obj.Nit = nit;
        obj.Nombre = nombre;
        obj.Gerente = gerente;
        obj.Telefono = telefono;
        obj.Estado = true;

        EmpresaBRL.insertEmpresa(obj);
        lbVal.Text = "";

        Response.Redirect("ListEmpresas.aspx");
    }
}