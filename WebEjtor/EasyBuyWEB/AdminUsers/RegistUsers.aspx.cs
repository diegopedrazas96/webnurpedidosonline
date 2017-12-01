using Entidades.Seguridad;
using Negocio.Seguridad;
using Data.Seguridad;
using Access.Seguridad;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class AdminUsers_RegistUsers : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {        
        lbVal.Visible = false;

        if (IsPostBack)
        {
            return;
        }
        try
        {
            List<Rol> roles = RolBRL.getRol();
            ComboListaRoles.DataSource = roles;
            ComboListaRoles.DataBind();
        }
        catch (Exception ex)
        {

        }

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        lbVal.Visible = false;
        try
        {
            string value = ComboListaRoles.SelectedValue;
            int rolId = Convert.ToInt32(value);
            Rol objRol = RolBRL.getRolesById(rolId);

            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            string contraseña = txtPassword.Text;

            User objVali = UserBRL.getUserByEmail(email);
            if (objVali != null)
            {
                lbVal.Text = "El email ingresado ya esta registrado en el Sistema";
                lbVal.Visible = true;
                return;
            }

            User obj = new User();
            {
                obj.Nombre = nombre;
                obj.Apellido = apellido;
                obj.Email = email;
                obj.Contraseña = contraseña;
                obj.TipoUsuario = "2";

            };
            int UserId = UserBRL.insertUser(obj);


            //UserRol objUserRol = new UserRol();
            //{
            //    objUserRol.UsuarioId = UserId;
            //    objUserRol.RolId = rolId;
            //    objUserRol.Estado = "activo";
            //};
            //UsuarioRolBRL.insertUserRol(objUserRol);

            ComboListaRoles.ClearSelection();
        }

        catch (Exception ex)
        {

        }
        Response.Redirect("ListUsers.aspx");
        
    }

    protected void ComboListaRoles_DataBound(object sender, EventArgs e)
    {
        ComboListaRoles.Items.Insert(0, new ListItem("Seleccione un Rol...",""));
    }
}