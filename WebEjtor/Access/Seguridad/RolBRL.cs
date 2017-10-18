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

            int? rolId = 0;

            ROLTableAdapter adapter = new ROLTableAdapter();
            adapter.Insert(obj.Nombre, obj.Descripcion, obj.Estado, ref rolId);       

            if (rolId <= 0)
            {
                throw new ArgumentException("Falla al insertar, el rolId es menor que 0");
            }

            return rolId.Value;
        }

        //public static void updateProducto(Producto obj)
        //{
        //    if (obj == null)
        //    {
        //        throw new ArgumentException("El objeto Produco no debe ser nulo");
        //    }

        //    ProductosTableAdapter adapter = new ProductosTableAdapter();
        //    adapter.Update(obj.TipoIdc, obj.EmpresaId, obj.Nombre, obj.Precio, obj.ProductoId);
        //}

        //public static Producto getProductoById(int productoId)
        //{
        //    if (productoId <= 0)
        //    {
        //        new ArgumentException("Producto Id no debe ser manor o igual a 0");
        //    }

        //    ProductosTableAdapter adapter = new ProductosTableAdapter();
        //    ProductoDS.ProductosDataTable table = adapter.GetProductoById(productoId);

        //    if (table.Rows.Count == 0)
        //    {
        //        return null;
        //    }

        //    ProductoDS.ProductosRow row = table[0];
        //    Producto obj = new Producto()
        //    {
        //        ProductoId = row.productoId,
        //        TipoIdc = row.tipoIdc,
        //        EmpresaId = row.empresaId,
        //        Nombre = row.nombre,
        //        Precio = row.precio,
        //        Estado = row.estado
        //    };

        //    return obj;
        //}
    }
}
