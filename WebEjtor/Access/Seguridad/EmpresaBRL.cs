using Data.Seguridad;
using Data.Seguridad.EmpresaDSTableAdapters;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.Seguridad
{
    public class EmpresaBRL
    {
        public EmpresaBRL()
        {

        }

        public static List<Empresa> getEmpresas()
        {
            EmpresaTableAdapter adapter = new EmpresaTableAdapter();
            EmpresaDS.EmpresaDataTable table = adapter.GetEmpresas();

            List<Empresa> listEmpresas = new List<Empresa>();
            foreach (var row in table)
            {
                Empresa obj = new Empresa();
                obj.EmpresaId = row.empresaId;
                obj.TipoIdc = row.tipoIdc;
                obj.Nit = row.nit;
                obj.Nombre = row.nombre;
                obj.Gerente = row.gerente;
                obj.Telefono = row.telefono;
                obj.Estado = row.estado;

                listEmpresas.Add(obj);
            }
            return listEmpresas;
        }
    }
}
