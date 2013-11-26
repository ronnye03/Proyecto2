<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Control_Fecha.ascx.cs" Inherits="Presentacion.Control_Fecha" %>
<asp:TextBox ID="txtFn" runat="server" OnTextChanged="txtFn_TextChanged" 
    Width="184px"></asp:TextBox>
<asp:ImageButton ID="ImageButton1" runat="server" 
    ImageUrl="~/Images/calendar.JPG" OnClick="ImageButton1_Click" />
<asp:CompareValidator ID="CompareValidator1" runat="server" 
    ControlToValidate="txtFn" ErrorMessage="(Día/Mes/Año)" ForeColor="Red" 
    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
<asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" 
    BorderColor="#FFCC66" BorderWidth="1px" 
    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
    ForeColor="#663399" Height="200px" 
    OnSelectionChanged="Calendar1_SelectionChanged" Width="220px" 
    ShowGridLines="True">
    <DayHeaderStyle BackColor="#FFCC66" Height="1px" Font-Bold="True" />
    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
    <OtherMonthDayStyle ForeColor="#CC9966" />
    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
    <SelectorStyle BackColor="#FFCC66" />
    <TitleStyle BackColor="#990000" 
        Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
</asp:Calendar>

