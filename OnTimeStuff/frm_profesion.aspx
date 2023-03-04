<%@ Page Title="Ingresar Profesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_profesion.aspx.cs" Inherits="OnTimeStuff.frm_profesion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    
    <p><asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
       <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
    </p>  
         <p><asp:Label ID="lblsalario" runat="server" Text="Salario: "></asp:Label>
       
         <asp:DropDownList ID="ddsalario" runat="server" DataSourceID="SqlDataSource1" DataTextField="grado" DataValueField="id">
         </asp:DropDownList>
       
    </p>    
    <br />
    <asp:Button ID="cmdAgregar" runat="server" OnClick="Button1_Click" Text="Guardar" />
    <asp:Button ID="cmdLimpiar" runat="server" OnClick="Button2_Click" Text="Limpiar" />
    <br />
    <br />    
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT [id], [grado] FROM [salarios]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" DeleteCommand="DELETE FROM [profesiones] WHERE [id] = @id" InsertCommand="INSERT INTO [profesiones] ([nombre], [fk_grado]) VALUES (@nombre, @fk_grado)" SelectCommand="SELECT * FROM [profesiones]" UpdateCommand="UPDATE [profesiones] SET [nombre] = @nombre, [fk_grado] = @fk_grado WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="fk_grado" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="fk_grado" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
</asp:Content>