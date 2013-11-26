<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmBusquedaProducto.aspx.cs" Inherits="Presentacion.frmBusquedaProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
    {
        width: 47%;
    }
    .style2
    {
        width: 13px;
    }
        .style3
        {
            width: 199px;
            height: 109px;
        }
        .style4
        {
            height: 109px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
    <tr>
        <td colspan="3">
            BUSQUEDA DE PRODUCTO</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Categoria / Subcategoria"></asp:Label>
        </td>
        <td class="style2">
            <asp:DropDownList ID="cbCategoria" runat="server" Height="16px" 
                onselectedindexchanged="cbCategoria_SelectedIndexChanged" Width="353px">
            </asp:DropDownList>
        </td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Buscar" onclick="Button1_Click" 
                Height="26px" style="margin-left: 0px" Width="80px" />
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:DataList ID="DataList1" runat="server" 
                onitemdatabound="DataList1_ItemDataBound" RepeatColumns="2" 
                RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table class="style1">
                        <tr>
                            <td colspan="2">
                                INFORMACION DEL PRODUCTO</td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="90px" Width="128px" />
                            </td>
                            <td class="style4">
                                <asp:ListBox ID="ListBox1" runat="server" Height="90px" Width="128px">
                                </asp:ListBox>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style2">
            <asp:TextBox ID="txbbuscar" runat="server" Width="428px"></asp:TextBox>
            </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td class="style2">
                    <asp:GridView ID="dgwcliente" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="573px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="idproducto" 
                                DataNavigateUrlFormatString="~/frmreportes.aspx?nro_reporte=3&amp;idproducto={0}" 
                                DataTextField="idproducto" DataTextFormatString="Ver Informacion" 
                                NavigateUrl="~/frmreportes.aspx" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
            </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
