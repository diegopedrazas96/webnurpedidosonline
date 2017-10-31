using Access.Seguridad;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio.Seguridad;

public partial class Productos_ListProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        actualizar();

        //if (!IsPostBack)
        //{
        //    cargarRol();
        //}

    }

    protected void GridRol_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rolId = 0;
        try
        {
            rolId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {
        }
        if (rolId <= 0)
            return;

        //if (e.CommandName == "Eliminar")
        //{
        //    try
        //    {
        //        //AdmiPermiso_BRL.deleteAdmiPermisAll(UserAdmId);
        //        //UserADM_BRL.deleteUserADM(UserAdmId);
        //        //cargarAdmins();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.Write(ex.Message);
        //        throw new Exception("Error al eliminar");
        //    }
        //}
        if (e.CommandName == "Editar")
        {
            Response.Redirect("EditarRol.aspx?Id="+rolId.ToString());
            return;
        }
    }

    public void actualizar()
    {
        List<Rol> roles = RolBRL.getRol();

        GridRol.DataSource = roles;
        GridRol.DataBind();
    }
}
