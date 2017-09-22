<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ListUsers.aspx.cs" Inherits="AdminUsers_ListUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="row">
            <div class="col-md-12">
                <h1>Lista de Colaboradores</h1>
                <asp:hyperlink runat="server" navigateurl="~/AdminUsers/RegistUsers.aspx">
                AÑADIR NUEVO COLABORADOR +
                </asp:hyperlink>

                <asp:gridview id="GridUsers" runat="server" cssclass="table" gridlines="None">

                </asp:gridview>

            </div>
        </div>

    </form>
</asp:Content>

