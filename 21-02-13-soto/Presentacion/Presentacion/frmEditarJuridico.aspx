<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEditarJuridico.aspx.cs" Inherits="Presentacion.frmEditarJuridico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style2
        {
            width: 114px;
        }
        .style3
        {
            width: 795px;
        }
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3" bgcolor="#FFCC99">
                Registro Juridico</td>
        </tr>
        <tr>
            <td class="style2">
                Idcliente</td>
            <td class="style3">
                <asp:TextBox ID="txbIdCliente" runat="server" BackColor="#FFCC99" 
                    Enabled="False">&lt;&lt;Autonumerico&gt;&gt;</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txbIdCliente" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Razon_social</td>
            <td class="style3">
                <asp:TextBox ID="txbRazon" runat="server" Height="22px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txbRazon" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Rte_legal</td>
            <td class="style3">
                <asp:TextBox ID="txbRteLegal" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txbRteLegal" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Nro_padron</td>
            <td class="style3">
                <asp:TextBox ID="txbNroPadron" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txbNroPadron" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                direccion</td>
            <td class="style3">
                <asp:TextBox ID="txbDireccion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txbDireccion" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
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
        </tr>
        <tr>
            <td class="style2">
                rubro</td>
            <td class="style3">
                <asp:DropDownList ID="cbrubro" runat="server" Height="16px" Width="300px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnGuardarEdicion" runat="server" onclick="Button1_Click" 
                    Text="Guardar Edicion" Width="142px" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
