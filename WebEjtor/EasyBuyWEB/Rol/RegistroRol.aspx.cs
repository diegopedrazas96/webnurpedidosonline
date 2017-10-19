using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades.Seguridad;
using Access.Seguridad;
using Negocio.Seguridad;

public partial class Roles_RegistRol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        string nombre = txtNombre.Text;
        string descripcion = txtDescripcion.Text;

        Rol obj = new Rol()
        {
            Nombre = nombre,
            Descripcion = descripcion,
            Estado = "activo"
        };

        int codigoRol = RolBRL.insertRol(obj);

        RolPermiso rolPermiso;
        Permisos tempPermiso;
        //Le inserto los permisos


        for (int i = 0; i < checkPermisos.Items.Count; i++)
        {
            if (checkPermisos.Items[i].Selected)
            {
                tempPermiso = PermisosBRL.getPermisoByNombre(checkPermisos.Items[i].Text);

                rolPermiso = new RolPermiso()
                {
                    RolId = codigoRol,
                    PermisoID = tempPermiso.PermisoId,
                    Estado = "activo"
                };

                RolPermisoBRL.insertRolPermiso(rolPermiso);
            }
        }

        Response.Redirect("~/Rol/ListRol.aspx");

    }
}