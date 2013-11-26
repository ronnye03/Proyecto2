<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Control_String.ascx.cs" Inherits="Presentacion.Control_String" %>
<asp:TextBox ID="txtString" runat="server" MaxLength="60" 
    OnTextChanged="txtDir_TextChanged" Width="290px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtString" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>

