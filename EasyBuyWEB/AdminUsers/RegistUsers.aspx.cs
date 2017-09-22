using Entidades.Seguridad;
using Negocio.Seguridad;
using System;

public partial class AdminUsers_RegistUsers : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        try
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string email = txtEmail.Text;
            string contraseña = txtPassword.Text;

            User obj = new User();
            {
                obj.Nombre = nombre;
                obj.Apellido = apellido;
                obj.Email = email;
                obj.Contraseña = contraseña;
                obj.TipoUsuario = "2";

            };
            UserBRL.insertUser(obj);
            

        }
        catch (Exception ex)
        {

        }
        Response.Redirect("ListUsers.aspx");
        
    }
}