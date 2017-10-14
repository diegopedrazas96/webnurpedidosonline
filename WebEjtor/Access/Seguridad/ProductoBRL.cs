using Data.Seguridad;
using Data.Seguridad.ProductoDSTableAdapters;
using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Access.Seguridad
{
    public class ProductoBRL
    {
        public ProductoBRL()
        {
        }

        public static List<Producto> getProductos()
        {
            ProductosTableAdapter adapter = new ProductosTableAdapter();
            ProductoDS.ProductosDataTable table  = adapter.GetProductos();

            List<Producto> listProducto = new List<Producto>();
            foreach (var row in table)
            {
                Producto obj = new Producto();
                obj.ProductoId = row.productoId;
                obj.TipoIdc = row.tipoIdc;
                obj.EmpresaId = row.empresaId;
                obj.Nombre = row.nombre;
                obj.precio = row.precio;
                obj.Estado = row.estado;

                listProducto.Add(obj);
            }

            return listProducto;
        }
    }
}
