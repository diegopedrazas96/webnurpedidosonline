using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades.Seguridad;
using Data.Seguridad.UserDSTableAdapters;
using Data.Seguridad;

using System.Net;
using System.Net.Mail;

namespace Negocio.Seguridad
{
    public class UserBRL
    {
        public UserBRL()
        {

        }        

        public static int insertUser(User obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto a ingresar no puede ser Nulo");
            }

            if (String.IsNullOrEmpty(obj.Nombre))
            {
                throw new ArgumentException("El nombre no puede ser Nulo ni vacio");
            }

            int? usuarioId = 0;

            //Console.Write(obj.Nombre);

            UsuariosTableAdapter adapter = new UsuariosTableAdapter();
            adapter.Insert(obj.Nombre, obj.Apellido, obj.Email, obj.Contraseña, obj.TipoUsuario, ref usuarioId);

            if (usuarioId == null || usuarioId <= 0)
            {
                throw new ArgumentException("La llave primaria no se genero correctamente");
            }

            return usuarioId.Value;

        }

        public static List<User> getUsuarios()
        {
            UsuariosTableAdapter adapter = new UsuariosTableAdapter();
            UserDS.UsuariosDataTable table = adapter.GetUsuarios();
            
            List<User> listUsers = new List<User>();
            
            foreach (var row in table)
            {
                User obj = new User();

                obj.UsuarioId = row.usuarioId;
                obj.Nombre = row.nombre;
                obj.Apellido = row.apellido;
                obj.Email = row.correo;
                obj.Contraseña = row.contraseña;
                obj.TipoUsuario = row.tipoUsuario;

                listUsers.Add(obj);
            }
            return listUsers;
        }

        public static User getUserByEmail(String correo)
        {
            if (correo.Equals(""))
            {
                throw new ArgumentException("Ingrese un Correo");
            }

            UsuariosTableAdapter adapter = new UsuariosTableAdapter();
            UserDS.UsuariosDataTable table = adapter.GetUsuariosByEmail(correo);
            UserDS.UsuariosRow row = table[0];

            User obj = new User();

            obj.UsuarioId = row.usuarioId;
            obj.Nombre = row.nombre;
            obj.Apellido = row.apellido;
            obj.Email = row.correo;
            obj.Contraseña = row.contraseña;
            obj.TipoUsuario = row.tipoUsuario;

            return obj;

        }        
        
        public static bool enviarEmail(string emailReceptor)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtpCli = new SmtpClient();

                mail.From = new MailAddress("easywebsoft3@gmail.com");
                mail.To.Add(new MailAddress(emailReceptor));

                string message =
                    "<p>" +
                        "Hemos recibido tu solicitud para cambiar la contraseña de tu cuenta. Para cambiar de contraseña" +
                        " use el siguiente link" +
                    "</p>" +
                    "http://localhost:55917/AdminSecurity/LoginUsers.aspx";
                mail.Body = message;
                mail.IsBodyHtml = true;
                mail.Subject = "Change Password";
                smtpCli.Host = "smtp.gmail.com";
                smtpCli.Port = 587; //Lo use gmail por defecto
                smtpCli.Credentials = new NetworkCredential("easywebsoft3@gmail.com", "easyweb123");
                smtpCli.EnableSsl = true;
                smtpCli.Send(mail);
                //Generador de Codigos de 12 digitos

                Guid gidCode = Guid.NewGuid();
                string code = gidCode.ToString().Substring(0, 14).Replace("-", "");
                

                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                return false;
            }
            
        }
    }
}
