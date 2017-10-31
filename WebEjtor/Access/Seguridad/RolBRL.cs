using System.Collections.Generic;
using Entidades.Seguridad;
using Data.Seguridad;
using Data.Seguridad.RolDSTableAdapters;
using Data.Seguridad.RolXPermisoDSTableAdapters;
using System;

namespace Access.Seguridad
{
    public class RolBRL
    {
        public RolBRL()
        {

        }

        public static List<Rol> getRol()
        {
            ROLTableAdapter adapter = new ROLTableAdapter();
            RolDS.ROLDataTable table = adapter.GetRol();
         
            List<Rol> listRol = new List<Rol>();
            foreach (var row in table)
            {
                Rol obj = new Rol();

                obj.RolId = row.rolId;
                obj.Nombre = row.nombre;
                obj.Descripcion = row.descripcion;
                obj.Estado = row.estado;

                listRol.Add(obj);
            }

            return listRol;
        }

        public static int insertRol(Rol obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto Producto no debe ser nulo");
            }

            int? rolId = null;

            ROLTableAdapter adapter = new ROLTableAdapter();
            adapter.Insert(obj.Nombre, obj.Descripcion, obj.Estado, ref rolId);

            if (rolId == null || rolId <= 0)
            {
                throw new ArgumentException("La llave primaria no se generó correctamente");
            }
            return rolId.Value;
        }

        public static Rol getRolesById(int rolId)
        {
            if (rolId <= 0)
            {
                new ArgumentException("Producto Id no debe ser manor o igual a 0");
            }

            ROLTableAdapter adapter = new ROLTableAdapter();
            RolDS.ROLDataTable table = adapter.GetRolById(rolId);

            if (table.Rows.Count == 0)
            {
                return null;
            }

            RolDS.ROLRow row = table[0];
            Rol obj = new Rol()
            {
                RolId = row.rolId,
                Nombre = row.nombre,
                Descripcion = row.descripcion,
                Estado = row.estado         
            };
            return obj;
        }

       
    }
}
