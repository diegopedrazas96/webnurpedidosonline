﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="FormPedido.aspx.cs" Inherits="Pedido_FormPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/1.0.17/webcomponents-lite.js"></script>
    <link rel="import" href="https://raw-dot-custom-elements.appspot.com/GoogleWebComponents/google-map/v2.0.2/google-map/google-map.html">



    <style>
        google-map {
            height: 380px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2 class="text-center" runat="server" id="lbPed">Pedido pendiente por Atender</h2>
    <br />
    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <label>CLIENTE:</label>
                <asp:TextBox ID="txtCliente" runat="server"
                    CssClass="form-control" Enabled="false">
                </asp:TextBox>
            </div>

            <div class="form-group">
                <label>CORREO:</label>
                <asp:TextBox ID="txtCorreo" runat="server"
                    CssClass="form-control" Enabled="false">
                </asp:TextBox>
            </div>

            <div class="form-group">
                <label>EMPRESA:</label>
                <asp:TextBox ID="txtNombreEmp" runat="server"
                    CssClass="form-control" Enabled="false">
                </asp:TextBox>
            </div>

            <div class="form-group">
                <label>FECHA:</label>
                <asp:TextBox ID="txtFecha" runat="server"
                    CssClass="form-control" Enabled="false">
                </asp:TextBox>
            </div>

            <div class="form-group">
                <label>DISPOSITIVO:</label>
                <asp:TextBox ID="txtDispositivo" runat="server"
                    CssClass="form-control" Enabled="false">
                </asp:TextBox>
            </div>

            <asp:Button ID="btnAtender" runat="server" Text="Atender Pedido" CssClass="btn btn-primary btn-block" OnClick="btnAtender_Click"/>
        </div>

        <div class="col-md-8">
            <div>
                <asp:Literal ID="GMap" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

</asp:Content>

