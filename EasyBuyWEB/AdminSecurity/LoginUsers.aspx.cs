using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminSecurity_LoginUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnInitSesion_Click(object sender, EventArgs e)
    {
        //Hacer codigo para iniciar sesion aquí       
        

        Response.Redirect("~/Productos/ListProductos.aspx");
    }
}