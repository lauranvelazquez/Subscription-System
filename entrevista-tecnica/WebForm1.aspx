<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="entrevista_tecnica.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1 style="text-align:center; color:blueviolet; font-family:Arial, Helvetica, sans-serif">SUSCRIPCIÓN</h1>
    <hr />
    <p style="font-family:Arial, Helvetica, sans-serif">Para realizar la suscripción complete los siguientes datos.</p>
    <form id="form1" runat="server">
        <h3 style="font-family:Arial, Helvetica, sans-serif; color:darkmagenta">Buscar Suscriptor</h3>

        <div style="align-content:center">
            <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label1" runat="server" Text="Tipo de Documento:"></asp:Label>
            <asp:DropDownList  style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="DropDownListTypeDni" runat="server">
                <asp:ListItem>DNI</asp:ListItem>
                <asp:ListItem>Pasaporte</asp:ListItem>
                <asp:ListItem>Libreta Civica</asp:ListItem>
                <asp:ListItem>Libreta de Enrolamiento</asp:ListItem>
            </asp:DropDownList>
            

            <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label2" runat="server" Text="Nùmero de Documento:"></asp:Label>
            <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="TextBoxDni" runat="server"></asp:TextBox>

            <asp:Button style="background-color:cadetblue; border:cadetblue; padding: 10px; margin: 10px; width:10%; height:30px" ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />

        </div>
        <div>
            <hr />
            <asp:Label style="font-family:Arial, Helvetica, sans-serif; color:indigo" ID ="Results" runat="server" Text=" "></asp:Label>
        </div>
        <div style="align-content:center" ID="DivData" runat="server">
            <hr />
            <h3 style="font-family:Arial, Helvetica, sans-serif; color:darkmagenta">Datos del Suscriptor</h3>
        
            <div style="align-content:center">
                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label3" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="TextBoxName" runat="server"></asp:TextBox>

                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label4" runat="server" Text="Apellido:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; width:10%" ID="TextBoxLastName" runat="server"></asp:TextBox>
            </div>
            <div style="align-content:center">
                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label5" runat="server" Text="Dirección"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="TextBoxAddress" runat="server"></asp:TextBox>

                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px;; display:inline-flex; width:8%" ID="Label6" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; width:10%" ID="TextBoxEmail" runat="server"></asp:TextBox>
            </div>
            <div style="align-content:center">
                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label7" runat="server" Text="Teléfono:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="TextBoxTelephone" runat="server"></asp:TextBox>

                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label8" runat="server" Text="Estado:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; width:10%" ID="TextBoxEstado" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div style="align-content:center">
                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label9" runat="server" Text="Usuario:"></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; display:inline-flex; width:10%" ID="TextBoxUsername" runat="server"></asp:TextBox>

                <asp:Label style="font-family:Arial, Helvetica, sans-serif; padding: 10px; margin: 10px; display:inline-flex; width:8%" ID="Label10" runat="server" Text="Contraseña:" ></asp:Label>
                <asp:TextBox style="color:dimgrey; padding: 10px; margin: 10px; width:10%" ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox>
                <hr />
            </div>
    </div>
        <div style="align-content:center">
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonRegister" runat="server" Text="Dar de Alta" OnClick="ButtonRegister_Click" Visible="False" />
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonNew" runat="server" Text="Nuevo" OnClick="ButtonNew_Click" />
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonModify" runat="server" Text="Modificar" OnClick="ButtonModify_Click" Visible="False" />
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonSave" runat="server" Text="Guardar" OnClick="ButtonSave_Click" Visible="False" />
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonCancel" runat="server" Text="Cancelar" OnClick="ButtonCancel_Click" />
            <asp:Button style="background-color:cadetblue; border:cadetblue; display:inline-flex; width:10%; height:30px" ID="ButtonRegisterSusc" runat="server" Text="Registrar Suscripción" OnClick="ButtonRegisterSusc_Click" />
            <hr />
        </div>
    </form>
        
</body>
</html>
