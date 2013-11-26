<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmProducto.aspx.cs" Inherits="Presentacion.frmEditarProducto" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            width: 239px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
    <tr>
        <td colspan="2" bgcolor="#FF9933">
            Registro de Producto</td>
    </tr>
    <tr>
        <td class="style2">
            Id Producto</td>
        <td>
            <asp:TextBox ID="txbidproducto" runat="server" Enabled="False">&lt;&lt;Autonumerico&gt;&gt;</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Nombre </td>
        <td>
            <asp:TextBox ID="txbnombre_producto" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Precio</td>
        <td>
            <asp:TextBox ID="txbprecio" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Stock</td>
        <td>
            <asp:TextBox ID="txbstock" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Categoria / Subacategoria</td>
        <td>
            <asp:DropDownList ID="cbCategoria" runat="server" Height="16px" Width="243px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style2">
            Imagen</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" Height="21px" Width="321px" />
        </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            <asp:Button ID="btnGuardar" runat="server" onclick="btnGuardar_Click" 
                Text="Guardar" Width="97px" />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
