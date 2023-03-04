<%@ Page Title="Trabajadores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frm_trabajadores.aspx.cs" Inherits="OnTimeStuff.frm_trabajadores" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-4">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="dsProfesiones" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido1" HeaderText="Apellido1" SortExpression="Apellido1" />
                    <asp:BoundField DataField="Apellido2" HeaderText="Apellido2" SortExpression="Apellido2" />
                    <asp:ButtonField Text="Seleccionar" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-4">
            <p>
                <asp:Label ID="lblCedula" runat="server" Text="Cédula: "></asp:Label>
                <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="lblApellido1" runat="server" Text="Primer Apellido: "></asp:Label>
                <asp:TextBox ID="txtApellido1" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="lblApellido2" runat="server" Text="Segundo Apellido: "></asp:Label>
                <asp:TextBox ID="txtApellido2" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="lblCalendario" runat="server" Text="Fecha de Ingreso: "></asp:Label>

                <asp:Calendar ID="Calendario" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>

            </p>            
        </div>
    </div>








    <asp:SqlDataSource ID="dsTrabajadores" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT [id], [Nombre], [Apellido1], [Apellido2] FROM [v_empleados]"></asp:SqlDataSource>




    <asp:SqlDataSource ID="dsProfesiones" runat="server" ConnectionString="<%$ ConnectionStrings:pruebasConnectionString %>" SelectCommand="SELECT * FROM [v_empleados] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>




</asp:Content>