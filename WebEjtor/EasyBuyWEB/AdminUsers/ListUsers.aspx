<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ListUsers.aspx.cs" Inherits="AdminUsers_ListUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h1>Lista de Colaboradores</h1>
            <asp:HyperLink runat="server" NavigateUrl="~/AdminUsers/RegistUsers.aspx">
                AÑADIR NUEVO COLABORADOR +
            </asp:HyperLink>

            <asp:GridView ID="GridUsers" runat="server" CssClass="table" GridLines="None">
            </asp:GridView>

        </div>
    </div>

</asp:Content>

