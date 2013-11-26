<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmGaleriaProducto.aspx.cs" Inherits="Presentacion.frmGaleriaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
    .style3
    {
        width: 158px;
    }
    .style4
    {
        width: 193px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" BorderColor="#000066" 
                    onitemdatabound="DataList1_ItemDataBound" RepeatColumns="2" 
                    RepeatDirection="Horizontal" Width="930px" 
                    onselectedindexchanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style2" colspan="2">
                                    <asp:Label ID="Label2" runat="server" Text="DATOS DE PRODUCTO"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" 
                                        Width="129px" />
                                </td>
                                <td class="style4">
                                    <asp:ListBox ID="ListBox1" runat="server" Height="128px" Width="128px">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;</td>
                                <td class="style4">
                                    <asp:ImageButton ID="ImageButton2" runat="server" Height="28px" 
                                        ImageUrl="~/images/carrodecompra.jpg" Width="40px" />
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="Comprar"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
