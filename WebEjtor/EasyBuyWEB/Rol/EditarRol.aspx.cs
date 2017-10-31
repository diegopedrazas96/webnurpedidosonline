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
    Rol admiLogeado;
    Rol objSelected;

    protected void Page_Load(object sender, EventArgs e)
    {
        actualizar();


        //if (!IsPostBack)
        //{
        //    Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
        //    Response.Cache.SetAllowResponseInBrowserHistory(false);
        //    Response.Cache.SetNoStore();
        //}
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        //lbValidator.Text = "";
        //string nombre = txtNombre.Text;
        //string descripcion = txtDescripcion.Text;


        //if (String.IsNullOrEmpty(nombre))
        //{
        //    lbValidator.Text = "La casilla Nombre no puede estar Vacía";
        //    return;
        //}

        //if (String.IsNullOrEmpty(descripcion))
        //{
        //    lbValidator.Text = "La casilla Descripcion no puede estar Vacía";
        //    return;
        //}

        //objSelected.Nombre = nombre;
        //objSelected.Descripcion = descripcion;

        //RolBRL.updateRol(objSelected);

        //Permisos perm;

        //for (int i = 0; i < checkPermisos.Items.Count; i++)
        //{
        //    if (checkPermisos.Items[i].Selected)
        //    {
        //        perm = PermisosBRL.getPermisoByNombre(checkPermisos.Items[i].Text);
        //        if (!RolPermisoBRL.tienePermiso(objSelected.RolId, perm.PermisoId))
        //        {
        //            RolPermiso rolPermiso = new RolPermiso()
        //            {
        //                RolId = objSelected.RolId,
        //                PermisoID = perm.PermisoId
        //            };

        //            RolPermisoBRL.insertRolPermiso(rolPermiso);
        //        }

        //    }
        //    else
        //    {
        //        perm = PermisosBRL.getPermisoByNombre(checkPermisos.Items[i].Text);
        //        if (RolPermisoBRL.tienePermiso(objSelected.RolId, perm.PermisoId))
        //        {
        //            RolPermisoBRL.deleteRolPermiso(objSelected.RolId, perm.PermisoId);
        //        }
        //    }

        //}
    }
    public void actualizar()
    {
        string strId = Request.Params["Id"];

        int id = 0;
        try
        {
            id = Convert.ToInt32(strId);
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
        }

        if (id <= 0)
        {
            return;
        }

        Rol obj = RolBRL.getRolesById(id);

        objSelected = obj;

        txtNombre.Text = obj.Nombre.Trim();
        txtDescripcion.Text = obj.Descripcion.Trim();

        Permisos perm;
        for (int i = 0; i < checkPermisos.Items.Count; i++)
        {
            perm = PermisosBRL.getPermisoByNombre(checkPermisos.Items[i].Text);
            if (RolPermisoBRL.tienePermiso(obj.RolId, perm.PermisoId))
            {
                checkPermisos.Items[i].Selected = true;
            }
        }
    }
}