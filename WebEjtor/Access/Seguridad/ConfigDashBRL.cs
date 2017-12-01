using Data.Seguridad;
using Data.Seguridad.DashDSTableAdapters;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.Seguridad
{
    public class ConfigDashBRL
    {
        public ConfigDashBRL() { }

        public static int InsertConfigDash(ConfigDash obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("el Objeto ConfigDash no debe ser nulo");
            }

            int? ConfigId = 0;

            ConfigDashTableAdapter adapter = new ConfigDashTableAdapter();
            adapter.Insert(obj.DashId, obj.UserId, obj.ProductoId, obj.EmpresaId, obj.Cantidad, obj.Fecha, ref ConfigId);
            if (ConfigId <= 0)
            {
                throw new ArgumentException("El Id de ConfigDash debe ser mayor a 0");
            }

            return ConfigId.Value;
        }
        
        public void UpdateConfigDash(ConfigDash obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("el Objeto ConfigDash no debe ser nulo");
            }

            ConfigDashTableAdapter adapter = new ConfigDashTableAdapter();
            adapter.Update(obj.ConfigDashId, obj.DashId, obj.UserId, obj.ProductoId, obj.EmpresaId, obj.Cantidad, obj.Fecha);
        }

        public void DeleteConfigDash(int ConfigDashID)
        {
            if (ConfigDashID <= 0)
            {
                throw new ArgumentException("El ConfigId debe ser mayor a 0");
            }

            ConfigDashTableAdapter adapter = new ConfigDashTableAdapter();
            adapter.Delete(ConfigDashID);
        }

        public static ConfigDash GetConfigDashByDashID(int DashId){
            if (DashId <=0)
            {
                throw new ArgumentException("El DashId no debe ser menor a 0");
            }

            ConfigDashTableAdapter adapter = new ConfigDashTableAdapter();
            DashDS.ConfigDashDataTable table = adapter.GetConfigDashByDashID(DashId);

            if (table.Rows.Count <= 0)
            {
                return null;
            }

            DashDS.ConfigDashRow row = table[0];
            ConfigDash obj = new ConfigDash()
            {
                ConfigDashId = row.configId,
                DashId = row.dashId,
                UserId = row.userId,
                ProductoId = row.productoId,
                EmpresaId = row.empresaId,
                Cantidad = row.cantidad,
                Fecha = row.fecha,
            };

            return obj;

        }
    }
}
