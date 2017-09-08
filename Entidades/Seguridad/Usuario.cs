using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Seguridad
{
    public class Usuario : Entidades.Entidad
    {
        public long Id { get; set; }
        public long TipoIdc { get; set; }
        public long? CompaniaId { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Login { get; set; }      
        public string Password { get; set; }
        public string Telefono { get; set; }
        public bool Estado { get; set; }
        public Usuario()
        {

        }

        

    } 

    
    public enum relUsuario
    {
        Compania
        
    }
}

