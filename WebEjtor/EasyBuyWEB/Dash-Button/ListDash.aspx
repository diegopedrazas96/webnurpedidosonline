<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="ListDash.aspx.cs" Inherits="Dash_ListDash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Lista de Dash</h2>
    <asp:HyperLink runat="server" NavigateUrl="~/Dash-Button/FormDash.aspx">
                AÑADIR NUEVO DASH BUTTON +
    </asp:HyperLink>


    <asp:GridView ID="GridDash" runat="server"
        OnRowCommand="GridDash_RowCommand"
        AutoGenerateColumns="false"
        CssClass="table"
        GridLines="None">
        <Columns>
            <asp:BoundField DataField="Nit" HeaderText="NIT" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre Empresa" />
            <asp:BoundField DataField="Gerente" HeaderText="Gerente" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
            <asp:TemplateField HeaderText="Editar">
                <ItemTemplate>
                    <asp:LinkButton ID="EditButton" runat="server"
                        CommandName="Editar"
                        CommandArgument='<%# Eval("EmpresaId") %>'>
                                <i class="glyphicon glyphicon-pencil"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Eliminar">
                <ItemTemplate>
                    <asp:LinkButton ID="DeleteButton" runat="server"
                        CommandName="Eliminar"
                        OnClientClick="return confirm('Esta seguro que desea eliminar la Empresa?')"
                        CommandArgument='<%# Eval("EmpresaId") %>'>
                                <i class="glyphicon glyphicon-trash"></i>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</asp:Content>

