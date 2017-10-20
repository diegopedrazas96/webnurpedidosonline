using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Seguridad
{
    public class Pedido
    {
        public int PedidoId { get; set; }
        public int ClienteId { get; set; }
        public int EmpresaId { get; set; }
        public string UsuarioId { get; set; }
        public DateTime Fecha { get; set; }
        public bool Atendido { get; set; }

        public List<DetallePedido> lstDetalle { get; set; }
        public Pedido()
        {
        }
    }
}
