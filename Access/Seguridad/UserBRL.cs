using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades.Seguridad;
using Data.Seguridad.UserDSTableAdapters;
using Data.Seguridad;

namespace Negocio.Seguridad
{
    public class UserBRL
    {
        public UserBRL()
        {

        }

        /*
        public int insertUser(User obj)
        {
            //Inserte Codigo y validaciones para insertar usuarios
            UsuariosTableAdapter adapter = new UsuariosTableAdapter();            
            //adapter.Insert(); completar esta lines

            int? usuarioId = 0;
            return usuarioId.Value;
        }

        public  User getUserByEmail(string email)
        {
            User obj = new User();            
            //Continue el codigo para obtener usuarios por email aquí

            return obj;
        }

        public  List<User> getUsuarios()
        {
            List<User> listUsers = new List<User>();
            //Continue el codigo para optener la lista de usuarios aquí
            return listUsers;
        }
        */

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
    }
}
