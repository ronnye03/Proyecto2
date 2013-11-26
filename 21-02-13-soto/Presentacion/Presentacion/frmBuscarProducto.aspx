<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmBuscarProducto.aspx.cs" Inherits="Presentacion.frmBuscarProducto" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" colspan="2">
                Buscar Producto</td>
        </tr>
        <tr>
            <td class="style2">
                Producto</td>
            <td>
                <asp:DropDownList ID="cbproducto" runat="server" Height="38px" Width="260px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Categoria</td>
            <td>
                <asp:DropDownList ID="cbcategoria" runat="server" Height="16px" Width="264px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Subcategoria</td>
            <td>
                <asp:DropDownList ID="cbsubcategoria" runat="server" Height="16px" 
                    Width="264px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnbuscar" runat="server" onclick="btnbuscar_Click" 
                    Text="Buscar" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="925px">
                </rsweb:ReportViewer>
            </td>
        </tr>
    </table>
</asp:Content>
