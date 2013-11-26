<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEditarRubro.aspx.cs" Inherits="Presentacion.frmEditarRubro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 189px;
        }
        .style2
        {
            width: 189px;
            height: 26px;
        }
        .style3
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="idrubro"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txbidrubro" runat="server" BackColor="#FFCC99" Enabled="False"></asp:TextBox>
            </td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Nombre rubro"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txbnombre_rubro" runat="server" Width="308px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Button ID="btnGuardarEdicion" runat="server" 
                    onclick="btnGuardarEdicion_Click" Text="Guardar edicion" />
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
