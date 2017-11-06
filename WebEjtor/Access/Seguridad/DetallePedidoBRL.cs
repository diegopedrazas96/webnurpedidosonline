﻿using Data.Seguridad;
using Data.Seguridad.DetallePedidoDSTableAdapters;
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
    public class DetallePedidoBRL
    {
        public DetallePedidoBRL()
        {
        }

       

        public static int insertDetallePedido(DetallePedido obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto DetallePedido no debe ser nulo");
            }

            int? productoId = 0;
            DetallePedidoAdapter adapter = new DetallePedidoAdapter();
            adapter.Insert(obj.PedidoId,obj.ProductoId,obj.Precio,obj.Cantidad,obj.SubTotal);

            

            return productoId.Value;
        }


        //public static List<Detalle> getDatallesByPedido(int pedidoId)
        //{

        //}
      
    }
}
