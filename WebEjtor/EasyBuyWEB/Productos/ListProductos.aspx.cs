using Access.Seguridad;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Productos_ListProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cargarEmpresas();
        }

    }

    protected void GridProductos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int productoId = 0;
        try
        {
            productoId = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {
        }
        if (productoId <= 0)
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
            Response.Redirect("FormProducto.aspx?Id=" + productoId.ToString());
            return;
        }
    }

    public void cargarEmpresas()
    {
        List<Producto> admins = ProductoBRL.getProductosTable();
        GridProductos.DataSource = admins;
        GridProductos.DataBind();
    }
}
