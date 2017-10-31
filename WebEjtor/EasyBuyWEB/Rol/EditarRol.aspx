<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="EditarRol.aspx.cs" Inherits="Roles_RegistRol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <h2>Editar Roles</h2>
        <br />
        <div class="col-md-6">

            <asp:Panel ID="PanelError" runat="server" Visible="false">
                <asp:Label runat="server" ForeColor="Red" ID="LblError">
                    Error al Guardar el producto
                </asp:Label>
            </asp:Panel>

            <div class="form-group">    
            <asp:TextBox ID="txtNombre" runat="server" 
                placeholder="Ingrese el Nombre de Rol" 
                CssClass="form-control">
            </asp:TextBox>
            <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtNombre"
                    Display="Dynamic"
                    ForeColor="Red"
                    ErrorMessage="Debe ingresar un valor para el nombre">
                </asp:RequiredFieldValidator>

            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDescripcion" TextMode="multiline" Columns="74" Rows="10"
                    CssClass="form-control" runat="server" placeholder="Descripcion de Rol">
                </asp:TextBox>
            </div>
            <asp:RequiredFieldValidator runat="server"
                    ControlToValidate="txtDescripcion"
                    Display="Dynamic"
                    ForeColor="Red"
                    ErrorMessage="Debe ingresar un valor para el nombre">
                </asp:RequiredFieldValidator>
           
        <h3>Permisos Asignados</h3>      

        <asp:CheckBoxList ID="checkPermisos" class="checkbox-inline"  runat="server">
            <asp:ListItem>Insertar Productos</asp:ListItem>
            <asp:ListItem>Eliminar Productos</asp:ListItem>
            <asp:ListItem>Modificar Productos</asp:ListItem>
            <asp:ListItem>Registrar Usuarios</asp:ListItem>
            <asp:ListItem>Eliminar Usuarios</asp:ListItem>
            <asp:ListItem>Modificar Usuarios</asp:ListItem>
            <asp:ListItem>Registrar Empresa</asp:ListItem>
            <asp:ListItem>Eliminar Empresa</asp:ListItem>
            <asp:ListItem>Modificar Empresa</asp:ListItem>
            <asp:ListItem>Ver Reportes</asp:ListItem>
        </asp:CheckBoxList>
            <br />
            <asp:Label ID="lbValidator" ForeColor="Red" runat="server" Text="" Visible="false"> </asp:Label>
            <br />
          <br />
            <asp:Button ID="btnRegistrar" 
            runat="server" 
            Text="Guardar"             
            CssClass="btn btn-primary" 
            OnClick="btnGuardar_Click"/>  
           
        </div>
</asp:Content>  

