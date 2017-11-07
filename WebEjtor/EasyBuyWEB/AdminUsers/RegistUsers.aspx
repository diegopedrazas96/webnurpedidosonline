﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" 
    AutoEventWireup="true" 
    CodeFile="RegistUsers.aspx.cs" 
    Inherits="AdminUsers_RegistUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="formRegist" class="col-md-6  col-md-offset-3" runat="server">
        <h2>Registrar Administradores</h2>
        <br />
        <div class="form-group">
            <asp:TextBox ID="txtNombre" runat="server" 
                CssClass="form-control" 
                placeholder="Nombre">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtApellido" runat="server" 
                CssClass="form-control" 
                placeholder="Apellidos">
            </asp:TextBox>
     
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtEmail" runat="server" 
                CssClass="form-control" 
                placeholder="Email">
            </asp:TextBox>
 
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtPassword" runat="server" 
                CssClass="form-control" 
                placeholder="Password" TextMode="Password">
            </asp:TextBox>
 
        </div>
        <div class="form-group" runat="server" visible ="true">
            <h4>Roles de Administrador</h4>

            
            <asp:DropDownList ID="ComboListaRoles" runat="server" CssClass="form-control"
                OnDataBound ="ComboListaRoles_DataBound"
                DataValueField="RolId"
                DataTextField="Nombre">

                <asp:ListItem Value="" Text="Seleccione un Rol"></asp:ListItem>

            </asp:DropDownList>

            <br />


            <asp:HyperLink runat="server" NavigateUrl="~/Rol/RegistroRol.aspx">
                AÑADIR NUEVO ROL +
            </asp:HyperLink>
        </div>


        <asp:Button ID="btnRegistrar" runat="server" 
            Text="Registrar" 
            CssClass="btn btn-primary" 
            OnClick="btnRegistrar_Click" />
         
        <asp:Label ID="lbVal" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label>
         
    </div>
</asp:Content>

