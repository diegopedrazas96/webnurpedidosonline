using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_TestGoogleMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GMap.Text = "<google-map fit-to-marker api-key='AIzaSyD3E1D9b-Z7ekrT3tbhl_dy8DCXuIuDDRc'>" +
            " <google-map-marker latitude='-17.7690006' longitude='-63.1828087' draggable='true'></google-map-marker>" +
                         "</google-map>";
    }
}