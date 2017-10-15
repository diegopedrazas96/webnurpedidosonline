<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="false" CodeFile="ListEmpresas.aspx.vb" Inherits="Empresas_ListEmpresas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Lista de Empresas</h2>
    <asp:HyperLink runat="server" NavigateUrl="~/Empresas/RegistEmpresa.aspx">
                AÑADIR NUEVA EMPRESA +
    </asp:HyperLink>
</asp:Content>

