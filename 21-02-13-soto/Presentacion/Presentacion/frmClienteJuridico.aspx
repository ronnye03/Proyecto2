<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmClienteJuridico.aspx.cs" Inherits="Presentacion.frmClienteJuridico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 114px;
        }
        .style3
        {
            width: 795px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                Registro Juridico</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Idcliente</td>
            <td class="style3">
                <asp:TextBox ID="txbIdCliente" runat="server" BackColor="Red" Enabled="False">&lt;Autonumerico&gt;</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txbIdCliente" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Razon_social</td>
            <td class="style3">
                <asp:TextBox ID="txbRazon" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txbRazon" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Rte_legal</td>
            <td class="style3">
                <asp:TextBox ID="txbRteLegal" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txbRteLegal" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Nro_padron</td>
            <td class="style3">
                <asp:TextBox ID="txbNroPadron" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txbNroPadron" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                direccion</td>
            <td class="style3">
                <asp:TextBox ID="txbDireccion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txbDireccion" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                telefono</td>
            <td class="style3">
                <asp:TextBox ID="txbTelefono" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txbTelefono" ErrorMessage="(numero)" ForeColor="Red" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                nit</td>
            <td class="style3">
                <asp:TextBox ID="txbNit" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="txbNit" ErrorMessage="(numero)" ForeColor="Red" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                rubro</td>
            <td class="style3">
                <asp:DropDownList ID="cbrubro" runat="server" Height="16px" Width="300px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnGuardar" runat="server" onclick="Button1_Click" 
                    Text="Guardar" Width="142px" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Busqueda Juridica</td>
            <td class="style3">
                    <asp:TextBox ID="txbbuscar" runat="server" Width="283px"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" CausesValidation="False" 
                        onclick="btnBuscar_Click" Text="Buscar" 
                         />
                    </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                    <asp:GridView ID="dgwcliente" runat="server" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" Width="573px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:HyperLinkField DataNavigateUrlFields="IdCliente" 
                                DataNavigateUrlFormatString="~/frmEditarJuridico.aspx?idcliente={0}" 
                                DataTextField="Razon_social" DataTextFormatString="Editar" 
                                NavigateUrl="~/frmEditarJuridico.aspx" />
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
