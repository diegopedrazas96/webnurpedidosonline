﻿using Data.Seguridad;
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

        public static int insertEmpresa(Empresa obj)
        {
            if (obj == null)
            {
                new ArgumentException("El objeto empresa no puede ser nulo");
            }

            int? empresaId = null;

            EmpresaTableAdapter adapter = new EmpresaTableAdapter();
            adapter.Insert(obj.TipoIdc, obj.Nit, obj.Nombre, obj.Gerente, obj.Telefono, obj.Estado, ref empresaId);

            if (empresaId == 0 || empresaId == null)
            {
                new ArgumentException("La empresaId es nula o menor que 0");
            }
            return empresaId.Value;
        }
    }
}
