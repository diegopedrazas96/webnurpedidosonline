using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebNurPedidosOnline.Startup))]
namespace WebNurPedidosOnline
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
