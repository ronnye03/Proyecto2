<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Control_Int.ascx.cs" Inherits="Presentacion.Control_Int" %>
<asp:TextBox ID="txtInt" runat="server" MaxLength="15" 
    OnTextChanged="txtInt_TextChanged"></asp:TextBox>
<asp:CompareValidator ID="CompareValidator1" runat="server" 
    ControlToValidate="txtInt" ErrorMessage="(Número)" Font-Bold="False" 
    ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>

