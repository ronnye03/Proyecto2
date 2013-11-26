<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmClienteNatural.aspx.cs" Inherits="Presentacion.frmClienteNatural" %>
<%@ Register src="Control_ID.ascx" tagname="Control_ID" tagprefix="uc1" %>
<%@ Register src="Control_String.ascx" tagname="Control_String" tagprefix="uc2" %>
<%@ Register src="Control_Fecha.ascx" tagname="Control_Fecha" tagprefix="uc3" %>
<%@ Register src="Control_Int.ascx" tagname="Control_Int" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style3
        {
            width: 538px;
        }
        .style4
        {
            width: 214px;
        }
        .style5
        {
            width: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td  colspan="2" bgcolor="#FFCC99">
                
                <asp:Label ID="Label9" runat="server" Text="Registro de clientes"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4" >
                <asp:Label ID="Label10" runat="server" Text="idcliente"></asp:Label>
            </td>
            <td class="style3" >
                <uc1:Control_ID ID="Control_ID1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style4" >
               <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td class="style3" >
                <uc2:Control_String ID="Control_String1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style4" >
               
                <asp:Label ID="Label2" runat="server" Text="Ap. Paterno"></asp:Label>
            </td>
            <td class="style3" >
                <uc2:Control_String ID="Control_String2" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label3" runat="server" Text="Ap. Materno"></asp:Label>
            </td>
            <td class="style3">
                <uc2:Control_String ID="Control_String3" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Text="Fecha nacimiento"></asp:Label>
            </td>
            <td class="style3">
                <uc3:Control_Fecha ID="Control_Fecha1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label5" runat="server" Text="Direccion"></asp:Label>
            </td>
            <td class="style3">
                <uc2:Control_String ID="Control_String4" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label>
            </td>
            <td class="style3">
                <uc4:Control_Int ID="Control_Int1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label7" runat="server" Text="Nit"></asp:Label>
            </td>
            <td class="style3">
                <uc4:Control_Int ID="Control_Int2" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label8" runat="server" Text="Rubro"></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="cbrubro" runat="server" Height="25px" Width="287px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td >
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar" 
                    onclick="btnGuardar_Click" />
                <asp:Label ID="Label11" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                Busqueda de cliente:</td>
            <td >
                    <asp:TextBox ID="txbbuscar" runat="server" Width="283px"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                        onclick="btnBuscar_Click" Text="Buscar" 
                         />
                    <asp:Button ID="btnImprimirKardex" runat="server" 
                        onclick="btnImprimirKardex_Click" Text="Ver Kardex" />
                    <asp:Button ID="btnInforme" runat="server" onclick="btnInforme_Click" 
                        Text="Informe" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td >
                    <asp:GridView ID="dgwcliente" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="573px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="idcliente" 
                                DataNavigateUrlFormatString="~/frmEditarCliente.aspx?idcliente={0}" 
                                DataTextField="nombre_cliente" DataTextFormatString="Editar" 
                                NavigateUrl="~/frmEditarCliente.aspx" />
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
