<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmrubro.aspx.cs" Inherits="Presentacion.frmrubro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Registro de rubro"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label1" runat="server" Text="idrubro"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txbidrubro" runat="server" BackColor="#FFCC99" Enabled="False">&lt;&lt;Autonumerico&gt;&gt;</asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label2" runat="server" Text="Nombre rubro"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txbNombre_rubro" runat="server" Width="345px" 
                        ontextchanged="txbNombre_rubro_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txbNombre_rubro" ErrorMessage="(*)" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="152px" 
                        onclick="btnGuardar_Click" />
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" BackColor="#FFCC66" Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <hr />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Busqueda de rubro"></asp:Label>
                    <asp:TextBox ID="txbbuscar" runat="server" Width="283px"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                        onclick="btnBuscar_Click" Text="Buscar" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="dgwrubro" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="573px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="idrubro" 
                                DataNavigateUrlFormatString="~/frmEditarRubro.aspx?idrubro={0}" 
                                DataTextField="Nombre_rubro" DataTextFormatString="Editar" />
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
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
