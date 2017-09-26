<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="RegistRol.aspx.cs" Inherits="Roles_RegistRol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formRegistRoles" class="col-md-6  col-md-offset-3" runat="server">

        <h2>Registrar Roles</h2>
        <br />
        <div class="form-group">

            <asp:TextBox ID="txtNombre" runat="server" placeholder="Nombre de Rol" CssClass="form-control">
            </asp:TextBox>

        </div>
        <div class="form-group">
            <asp:TextBox ID="txtDescripcion" TextMode="multiline" Columns="74" Rows="10"
                CssClass="form-control" runat="server" placeholder="Descripcion de Rol">
            </asp:TextBox>
        </div>

        <asp:Button ID="btnRegistRol" runat="server" Text="Registrar Rol" CssClass="btn btn-primary" />

    </form>
</asp:Content>

