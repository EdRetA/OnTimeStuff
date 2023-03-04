<%@ Page Title="Ingresar Nuevo Trabajador"Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_trabajador.aspx.cs" Inherits="OnTimeStuff.frm_trabajador" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p><asp:Label ID="lblCedula" runat="server" Text="Cédula: "></asp:Label>
       <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
    </p>
    <p><asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
       <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    </p>
     <p><asp:Label ID="lblApellido1" runat="server" Text="Primer Apellido: "></asp:Label>
       <asp:TextBox ID="txtApellido1" runat="server"></asp:TextBox>
    </p>
     <p><asp:Label ID="lblApellido2" runat="server" Text="Segundo Apellido: "></asp:Label>
       <asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>
    </p>
     <p><asp:Label ID="lbl_Fechaingreso" runat="server" Text="Fecha de Ingreso: "></asp:Label>

         <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
             <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
             <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#999999" />
             <SelectedDayStyle BackColor="#333399" ForeColor="White" />
             <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
             <TodayDayStyle BackColor="#CCCCCC" />
         </asp:Calendar>

    </p>
    
     <p><asp:Label ID="lblProfesion" runat="server" Text="Profesión: "></asp:Label>
       
         <asp:DropDownList ID="ddprofesion" runat="server" DataSourceID="dsProfesiones" DataTextField="nombre" DataValueField="id">
         </asp:DropDownList>
       
    </p>
    
     <p><asp:Label ID="lblEdificio" runat="server" Text="Edificio: "></asp:Label>
       
         <asp:DropDownList ID="ddEdificio" runat="server" DataSourceID="dsEdificios" DataTextField="nombre" DataValueField="id">
         </asp:DropDownList>
       
    </p>
    <br />
    <asp:Button ID="cmdAgregar" runat="server" OnClick="Button1_Click" Text="Guardar" />
    <asp:Button ID="cmdLimpiar" runat="server" OnClick="Button2_Click" Text="Limpiar" />
    <br />
    <br />
    <asp:SqlDataSource ID="dsTrabajador" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" DeleteCommand="DELETE FROM [empleados] WHERE [id] = @id" InsertCommand="INSERT INTO [empleados] ([id], [Nombre], [Apellido1], [Apellido2], [FechaIngreso], [fk_edificio], [fk_profesion]) VALUES (@id, @Nombre, @Apellido1, @Apellido2, @FechaIngreso, @fk_edificio, @fk_profesion)" SelectCommand="SELECT * FROM [empleados]" UpdateCommand="UPDATE [empleados] SET [Nombre] = @Nombre, [Apellido1] = @Apellido1, [Apellido2] = @Apellido2, [FechaIngreso] = @FechaIngreso, [fk_edificio] = @fk_edificio, [fk_profesion] = @fk_profesion WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido1" Type="String" />
            <asp:Parameter Name="Apellido2" Type="String" />
            <asp:Parameter DbType="Date" Name="FechaIngreso" />
            <asp:Parameter Name="fk_edificio" Type="Int32" />
            <asp:Parameter Name="fk_profesion" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombre" Type="String" />
            <asp:Parameter Name="Apellido1" Type="String" />
            <asp:Parameter Name="Apellido2" Type="String" />
            <asp:Parameter DbType="Date" Name="FechaIngreso" />
            <asp:Parameter Name="fk_edificio" Type="Int32" />
            <asp:Parameter Name="fk_profesion" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsProfesiones" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [profesiones]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsEdificios" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [edificios]"></asp:SqlDataSource>
    
</asp:Content>
