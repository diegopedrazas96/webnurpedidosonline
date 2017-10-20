using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using WebNurServiciosPedidos.Models;
using WebNurServiciosPedidos.Results;
using ES = Entidades.Seguridad;
using NS = Negocio.Seguridad;
using System.Net;

namespace WebNurServiciosPedidos.Controllers
{
    
    [RoutePrefix("api/pedido")]
    public class PedidoController : ApiController
    {
       

        

       

        
        // POST api/values
        [HttpPost()]        
        public IHttpActionResult PostPedido([FromBody]ES.Pedido objPedido)
        {
          
            try
            {
                if (ModelState.IsValid)
                {
                    objPedido.PedidoId = NS.PedidoBRL.insertPedido(objPedido);
                    foreach( Entidades.Seguridad.DetallePedido detallePedido in objPedido.lstDetalle)
                    {
                        detallePedido.PedidoId = objPedido.PedidoId;
                        NS.DetallePedidoBRL.insertDetallePedido(detallePedido);

                    }
                    //bcUser.insertUser(objUsuario);
                    return CreatedAtRoute("PostPedido", new { id = objPedido.PedidoId }, objPedido);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return BadRequest();
        }

      
    }
}