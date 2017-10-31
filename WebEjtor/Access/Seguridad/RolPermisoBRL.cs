using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data.Seguridad;
using Data.Seguridad.RolXPermisoDSTableAdapters;
using Entidades.Seguridad;



namespace Access.Seguridad
{
    public class RolPermisoBRL
    {
        public RolPermisoBRL()
        {

        }
        public static List<RolPermiso> getRolPermisos()
        {
            ROLPERMISOTableAdapter adapter = new ROLPERMISOTableAdapter();
            RolXPermisoDS.ROLPERMISODataTable table = adapter.GetRolXPermiso();


            List<RolPermiso> listRolPermiso = new List<RolPermiso>();
            foreach (var row in table)
            {
                RolPermiso obj = new RolPermiso();

                obj.RolPermisoId = row.idRolPermiso;
                obj.RolId = row.rolId;
                obj.PermisoID = row.permisoId;
                obj.Estado = row.estado;

                listRolPermiso.Add(obj);
            }

            return listRolPermiso;
        }

        public static int insertRolPermiso(RolPermiso obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto Producto no debe ser nulo");
            }

            int? rolPermisoId = null;
            ROLPERMISOTableAdapter adapter = new ROLPERMISOTableAdapter();
            adapter.Insert(obj.RolId, obj.PermisoID, obj.Estado, ref rolPermisoId);

            if (rolPermisoId == null || rolPermisoId <= 0)
            {
                throw new ArgumentException("La llave primaria no se generó correctamente");
            }
            
            return rolPermisoId.Value;
        }

        public static Boolean tienePermiso(int rolId, int permisoId)
        {
            ROLPERMISOTableAdapter adapter = new ROLPERMISOTableAdapter();
            RolXPermisoDS.ROLPERMISODataTable table = adapter.GetIdByPerRol(rolId, permisoId);
            if (table.Rows.Count == 0)
            {
                return false;
            }
            return true;
        }
    }


}
