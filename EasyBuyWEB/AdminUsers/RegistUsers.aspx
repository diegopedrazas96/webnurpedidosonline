<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="RegistUsers.aspx.cs" Inherits="AdminUsers_RegistUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="formRegist" class="col-md-6  col-md-offset-3" runat="server">
        <h2>Registrar Administradores</h2>
        <br />
        <div class="form-group">
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellidos">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password">
            </asp:TextBox>
        </div>
        <div class="form-group">
            <h3>Roles de Usuario</h3>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>Administrador General</asp:ListItem>
                <asp:ListItem>Editor</asp:ListItem>
                <asp:ListItem>Vendedor</asp:ListItem>
                <asp:ListItem>Analista</asp:ListItem>
            </asp:RadioButtonList>
            <asp:HyperLink runat="server" NavigateUrl="~/Roles/RegistRol.aspx">
                AÑADIR NUEVO ROL +
            </asp:HyperLink>
        </div>

        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="btn btn-primary" OnClick="btnRegistrar_Click" />

    </form>
</asp:Content>

