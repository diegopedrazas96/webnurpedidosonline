using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.Seguridad
{
    class Usuario 
    {
        public void Save(Entidades.Seguridad.Usuario objUsuario)
        {
            try
            {
                using (var DALObject = new Data.Seguridad.Usuario())
                {
                    DALObject.Save(objUsuario);
                }
            }
            catch (Exception ex)
            {
                
                throw new Exception("Ha ocurrido un error al guardar la informacion, por favor consulte con el administrador del sistema", ex);
            }
        }
    }
}
