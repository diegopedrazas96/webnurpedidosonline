using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades.Seguridad;
using Data.Seguridad;
using Data.Seguridad.UserDSTableAdapters;

namespace Negocio.Seguridad
{
    public class UserBRL
    {
        public UserBRL()
        {

        }

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

        
    }

}
