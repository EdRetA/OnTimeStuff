<%@ Page Title="Trabajadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_trabajadores.aspx.cs" Inherits="OnTimeStuff.frm_trabajadores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Label ID="lbltitulo" runat="server" Text=""></asp:Label></h2>

    <div class="row">
        <div class="col-md-4">

            <p>
                <asp:Label ID="lblBuscar" runat="server" Text="Buscar por Identificación: "></asp:Label>
                <asp:TextBox ID="txtId" runat="server" MinLength="9" MaxLength="9"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
            ControlToValidate="txtId" runat="server"
            ErrorMessage="Sólo ingrese números"
            ValidationExpression="\d+" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
            ControlToValidate="txtId" runat="server"
            ErrorMessage="Ingrese 9 dígitos"
            ValidationExpression="\d{9}" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:RegularExpressionValidator>
            </p>
            
            <br />
            <asp:Button ID="cmdBuscar" runat="server" OnClick="cmdBuscar_Click" Text="Buscar" />


            <asp:GridView ID="gvTrabajadores" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsProfesiones" OnSelectedIndexChanged="gvTrabajadores_SelectedIndexChanged" PageSize="15">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Identificación" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido1" HeaderText="Primer Apellido" SortExpression="Apellido1" />
                    <asp:BoundField DataField="Apellido2" HeaderText="Segundo Apellido" SortExpression="Apellido2" />
                    <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso" Visible="False" />
                    <asp:BoundField DataField="Edificio" HeaderText="Edificio" SortExpression="Edificio" Visible="False" />
                    <asp:BoundField DataField="Profesión" HeaderText="Profesión" SortExpression="Profesión" Visible="False" />
                    <asp:BoundField DataField="grado" HeaderText="grado" SortExpression="grado" Visible="False" />
                    <asp:BoundField DataField="salario" HeaderText="salario" SortExpression="salario" Visible="False" />
                    <asp:CommandField ShowSelectButton="True" SelectText="Seleccionar" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-4">
            <p>
                <asp:Label ID="lblCedula" runat="server" Text="Cédula: "></asp:Label>
                <asp:Label ID="lbtCedula" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:Label ID="lbtNombre" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblApellido1" runat="server" Text="Primer Apellido: "></asp:Label>
                <asp:Label ID="lbtApellido1" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblApellido2" runat="server" Text="Segundo Apellido: "></asp:Label>
                <asp:Label ID="lbtApellido2" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblCalendario" runat="server" Text="Fecha de Ingreso: "></asp:Label>
                <asp:Label ID="lbtCalendario" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblProfesion" runat="server" Text="Profesión: "></asp:Label>
                <asp:Label ID="lbtProfesion" runat="server" Text=""></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblEdificio" runat="server" Text="Edificio: "></asp:Label>
                <asp:Label ID="lbtEdificio" runat="server" Text=""></asp:Label>
            </p>
            <p>
            <asp:Button ID="cmdEntrada" runat="server" OnClick="cmdEntrada_Click" Text="Entrada" />
            <asp:Button ID="cmdAscenso" runat="server" OnClick="cmdAscenso_Click" Text="Ascender" />
            </p>
            <br/>
            
     <p>
         <asp:Label ID="lbl_FechaAscenso" runat="server" Text="Fecha del Ascenso: "></asp:Label>

         <asp:Calendar ID="calAscenso" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
             <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
             <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
             <OtherMonthDayStyle ForeColor="#999999" />
             <SelectedDayStyle BackColor="#333399" ForeColor="White" />
             <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
             <TodayDayStyle BackColor="#CCCCCC" />
         </asp:Calendar>
          </p>
         <br/>
         <p><asp:Label ID="lblAscensoProfesion" runat="server" Text="Nuevo puesto: "></asp:Label>
       
         <asp:DropDownList ID="ddprofesion" runat="server" DataSourceID="dsPuestos" DataTextField="nombre" DataValueField="id">
         </asp:DropDownList>
       
    </p>

    

        </div>
    </div>

    <asp:SqlDataSource ID="dsTrabajador" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [v_empleados] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsProfesiones" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [v_empleados]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsPuestos" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [profesiones]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsEdificios" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [edificios]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsMarca" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" DeleteCommand="DELETE FROM [marcas] WHERE [id] = @id" InsertCommand="INSERT INTO [marcas] ([fk_empleado]) VALUES (@fk_empleado)">
        <InsertParameters>
            <asp:Parameter Name="fk_empleado" Type="Int32" />         
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsPersona" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT [id], [fk_profesion], [FechaIngreso] FROM [empleados] WHERE ([id] = @id)" UpdateCommand="UPDATE [empleados] SET [fk_profesion] = @fk_profesion, [FechaIngreso] = @FechaIngreso WHERE [id] = @id">
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="fk_profesion" Type="Int32" />
            <asp:Parameter DbType="Date" Name="FechaIngreso" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="fk_profesion" Type="Int32" />
            <asp:Parameter DbType="Date" Name="FechaIngreso" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsAscensos" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" InsertCommand="INSERT INTO [ascensos] ([fk_empleado], [fk_puestoNuevo], [fk_puestoAnterior], [fecha_ascenso]) VALUES (@fk_empleado, @fk_puestoNuevo, @fk_puestoAnterior, @fecha_ascenso)" >
                  
        <InsertParameters>
            <asp:Parameter Name="fk_empleado" Type="Int32" />
            <asp:Parameter Name="fk_puestoNuevo" Type="Int32" />
            <asp:Parameter Name="fk_puestoAnterior" Type="Int32" />
            <asp:Parameter DbType="Date" Name="fecha_ascenso" />
        </InsertParameters>                      
        
                        
    </asp:SqlDataSource>

</asp:Content>
