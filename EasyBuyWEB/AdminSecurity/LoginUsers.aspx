<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage2.master" AutoEventWireup="true" CodeFile="LoginUsers.aspx.cs" Inherits="AdminSecurity_LoginUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br /><br /><br /><br />
    <form class="col-md-4  col-md-offset-4" runat="server">
        <h2>Iniciar Sesión</h2>
        <br />
        <div class="form-group">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email">
            </asp:TextBox>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password">
            </asp:TextBox>
        </div>

        <p><a href="#">Olvidó su contraseña?</a></p>
        <asp:Button ID="btnInitSesion" runat="server" Text="Ingresar" OnClick="btnInitSesion_Click" CssClass="btn btn-primary" />
        <!--<button class="btn btn-primary">Enviar</button>-->
        <br /><br /><br /><br /><br /><br /><br />
    </form>    

</asp:Content>

