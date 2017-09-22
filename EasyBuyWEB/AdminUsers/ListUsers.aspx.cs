using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using Negocio.Seguridad;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminUsers_ListUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<User> user = UserBRL.getUsuarios();
        GridUsers.DataSource = user;
        GridUsers.DataBind();

    }
}