﻿using Entidades.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using Access.Seguridad;
using Negocio.Seguridad;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminUsers_ListUsers : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        revisarPermiso();

        List<User> user = UserBRL.getUsuarios();
        GridUsers.DataSource = user;
        GridUsers.DataBind();
    }

    public void revisarPermiso()
    {
        User objCurrent = (User)Session["User"];
        try
        {
            agregar.Visible = false;
            GridUsers.Columns[4].Visible = false;
            GridUsers.Columns[5].Visible = false;

            if (UsuarioPermisoBRL.mostrarSiTienePermisos(objCurrent.UsuarioId, 5))
            {
                agregar.Visible = true;
            }

            if (UsuarioPermisoBRL.mostrarSiTienePermisos(objCurrent.UsuarioId, 6))
            {
                GridUsers.Columns[5].Visible = true;
            }            
        }
        catch (Exception ex)
        {

        }       
    }

    protected void GridUser_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int userID = 0;
        try
        {
            userID = Convert.ToInt32(e.CommandArgument);
        }
        catch (Exception ex)
        {

        }

        if (userID <= 0)
            return;

        
        if (e.CommandName == "Editar")
        {
            Response.Redirect("RegistUsers.aspx?Id="+userID.ToString());
            return;
        }
    }

}