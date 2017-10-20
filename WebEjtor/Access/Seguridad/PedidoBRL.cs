using Data.Seguridad;
using Data.Seguridad.PedidoDSTableAdapters;
using Data.Seguridad.ProductoDSTableAdapters;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio.Seguridad
{
    public class PedidoBRL
    {
        public PedidoBRL()
        {
        }

       

        public static int insertPedido(Pedido obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto Pedido no debe ser nulo");
            }

            int? productoId = 0;
            PedidosAdapter adapter = new PedidosAdapter();
            adapter.Insert(obj.ClienteId, obj.EmpresaId,null, obj.Fecha, obj.Atendido, ref productoId);

            if (productoId <= 0)
            {
                throw new ArgumentException("Falla al insertar, el pedidoId es menor que 0");
            }

            return productoId.Value;
        }

      
    }
}
