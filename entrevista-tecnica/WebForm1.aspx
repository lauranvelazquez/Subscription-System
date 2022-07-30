<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="entrevista_tecnica.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1>Suscripción</h1>
    <p>Por favor, para realizar la suscripción complete los siguientes datos.</p>
    <form id="form1" runat="server">
        <h3>Buscar Suscriptor</h3>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Tipo de Documento:"></asp:Label>
            <asp:DropDownList ID="DropDownListTypeDni" runat="server">
                <asp:ListItem>DNI</asp:ListItem>
                <asp:ListItem>Pasaporte</asp:ListItem>
                <asp:ListItem>Libreta Civica</asp:ListItem>
                <asp:ListItem>Libreta de Enrolamiento</asp:ListItem>
            </asp:DropDownList>
            

            <asp:Label ID="Label2" runat="server" Text="Nùmero de Documento:"></asp:Label>
            <asp:TextBox ID="TextBoxDni" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />

        </div>
        <div>
            <asp:Label ID="Results" runat="server" Text=" "></asp:Label>
        </div>
        <div ID="DivData" runat="server">
            <h3>Datos del Suscriptor</h3>
        
            <div>
                <asp:Label ID="Label3" runat="server" Text="Nombre:"></asp:Label>
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>

                <asp:Label ID="Label4" runat="server" Text="Apellido:"></asp:Label>
                <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label5" runat="server" Text="Dirección"></asp:Label>
                <asp:TextBox ID="TextBoxAddress" runat="server"></asp:TextBox>

                <asp:Label ID="Label6" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label7" runat="server" Text="Teléfono:"></asp:Label>
                <asp:TextBox ID="TextBoxTelephone" runat="server"></asp:TextBox>

                <asp:Label ID="Label8" runat="server" Text="Estado:"></asp:Label>
                <asp:TextBox ID="TextBoxEstado" runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="Label9" runat="server" Text="Usuario:"></asp:Label>
                <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>

                <asp:Label ID="Label10" runat="server" Text="Contraseña:" ></asp:Label>
                <asp:TextBox ID="TextBoxPass" runat="server" TextMode="Password"></asp:TextBox>
            </div>
    </div>
        <div>
            <asp:Button ID="ButtonRegister" runat="server" Text="Dar de Alta" OnClick="ButtonRegister_Click" Visible="False" />
            <asp:Button ID="ButtonNew" runat="server" Text="Nuevo" OnClick="ButtonNew_Click" />
            <asp:Button ID="ButtonModify" runat="server" Text="Modificar" OnClick="ButtonModify_Click" Visible="False" />
            <asp:Button ID="ButtonSave" runat="server" Text="Guardar" OnClick="ButtonSave_Click" Visible="False" />
            <asp:Button ID="ButtonCancel" runat="server" Text="Cancelar" OnClick="ButtonCancel_Click" />
            <asp:Button ID="ButtonRegisterSusc" runat="server" Text="Registrar Suscripción" OnClick="ButtonRegisterSusc_Click" />
        </div>
    </form>
        
</body>
</html>
