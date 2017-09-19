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
using WebNurServiciosPedidos.Providers;
using WebNurServiciosPedidos.Results;
using ES = Entidades.Seguridad;
using NS = Negocio.Seguridad;
using System.Net;

namespace WebNurServiciosPedidos.Controllers
{
    [Authorize]
    [RoutePrefix("api/Usuario")]
    public class UsuarioController : ApiController
    {
        // GET api/values
        public IEnumerable<ES.User> Get()
        {
            NS.UserBRL bcUser = new NS.UserBRL();
            List<ES.User> lstAccount = new List<ES.User>();          
            try
            {
                bcUser = new NS.UserBRL();
                List<ES.User> beAccount = new List<ES.User>();
                lstAccount = bcUser.getUsuarios();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lstAccount;
        }

        // GET api/values/5
        public HttpResponseMessage Get(int id)
        {
            HttpResponseMessage msg = null;
            NS.UserBRL bcUser = new NS.UserBRL();            
            ES.User beUser;
            try
            {
                bcUser = new NS.UserBRL();
                beUser = bcUser.getUserByEmail(id.ToString());
                if (beUser != null && beUser.UsuarioId > 0) { 
                    msg = Request.CreateResponse<ES.User>(HttpStatusCode.OK, beUser);
                    return msg;
                }
                else { 
                     msg = Request.CreateResponse(HttpStatusCode.NotFound, "Usuario No Encontrado.!");
                    return msg;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // POST api/values
        public IHttpActionResult Post([FromBody]ES.User objUsuario)
        {
            NS.UserBRL bcUser;
            try
            {
                bcUser = new NS.UserBRL();
                if (ModelState.IsValid)
                {
                  
                    bcUser.insertUser(objUsuario);
                    return CreatedAtRoute("PostUsuario", new { id = objUsuario.UsuarioId }, objUsuario);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return BadRequest();
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}