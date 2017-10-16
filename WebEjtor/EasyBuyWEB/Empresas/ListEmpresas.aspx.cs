using Access.Seguridad;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Empresas_ListEmpresas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Validaciones para Insertar, Editar y eliminar
        if (!IsPostBack)
        {
            cargarEmpresas();
        }

    }

    protected void GridEmpresas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int empresaId = 0;
        try
        {
            empresaId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }
        if (empresaId <= 0)
            return;

        if (e.CommandName == "Eliminar")
        {
            try
            {
                //AdmiPermiso_BRL.deleteAdmiPermisAll(UserAdmId);
                //UserADM_BRL.deleteUserADM(UserAdmId);
                //cargarAdmins();
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                throw new Exception("Error al eliminar");
            }
        }
        if (e.CommandName == "Editar")
        {
            Response.Redirect("FormEmpresa.aspx?Id=" + empresaId.ToString());
            return;
        }
    }


    public void cargarEmpresas()
    {
        List<Empresa> admins = EmpresaBRL.getEmpresas();
        GridEmpresas.DataSource = admins;
        GridEmpresas.DataBind();
    }
}