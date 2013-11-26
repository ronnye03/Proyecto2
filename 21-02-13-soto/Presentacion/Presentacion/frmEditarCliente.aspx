<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEditarCliente.aspx.cs" Inherits="Presentacion.frmEditarCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style3
        {
            width: 538px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <table style="width: 100%;">
        <tr>
            <td>
                &nbsp;
            </td>
            <td  colspan="2" bgcolor="#FFCC99">
                
                <asp:Label ID="Label9" runat="server" Text="Editar Cliente"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td >
                <asp:Label ID="Label10" runat="server" Text="idcliente"></asp:Label>
            </td>
            <td class="style3" >
                <asp:TextBox ID="txbidcliente" runat="server" Enabled="False" 
                    BackColor="#FFCC99">&lt;&lt;Autonumerico&gt;&gt;</asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txbidcliente" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td >
               <asp:Label ID="Label1" runat="server" Text="Nombre"></asp:Label>
            </td>
            <td class="style3" >
               <asp:TextBox ID="txbnombre_cliente" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txbnombre_cliente" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td >
               
                <asp:Label ID="Label2" runat="server" Text="Ap. Paterno"></asp:Label>
            </td>
            <td class="style3" >
                <asp:TextBox ID="txbapp" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txbapp" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Ap. Materno"></asp:Label>
            </td>
            <td class="style3">
               <asp:TextBox ID="txbapm" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txbapm" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Fecha nacimiento"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txbfecha_nacimiento" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                    ImageUrl="~/images/calendar.JPG" onclick="ImageButton2_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txbfecha_nacimiento" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                    ControlToValidate="txbfecha_nacimiento" ErrorMessage="(dia/mes/ano)" 
                    Operator="DataTypeCheck" Type="Date" ForeColor="Red"></asp:CompareValidator>
                <asp:Calendar ID="Calendar2" runat="server" DayNameFormat="Shortest" 
                    onselectionchanged="Calendar2_SelectionChanged" Visible="False" 
                    BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    ShowGridLines="True" Width="220px">
                </asp:Calendar>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="Direccion"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txbdireccion" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txbdireccion" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Telefono"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txbtelefono" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txbtelefono" ErrorMessage="(Numero)" ForeColor="Red" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="Nit"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txbnit" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txbnit" ErrorMessage="(numero)" ForeColor="Red" 
                    Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
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
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td >
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Edicion" 
                    onclick="btnGuardar_Click" />
                <asp:Label ID="Label11" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <br />
    </p>
    <p>
    </p>
    <p>
    </p>
<p>
    &nbsp;</p>
</asp:Content>
