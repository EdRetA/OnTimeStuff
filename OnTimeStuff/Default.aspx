<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnTimeStuff._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Seleccione una opción para continuar</h1>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Personal</h2>
            <p><a href="frm_trabajador.aspx" class="btn btn-primary btn-lg">Personal</a></p>
        </div>
        <div class="col-md-4">
            <h2>Profesiones</h2>
            <p><a href="frm_profesion.aspx" class="btn btn-primary btn-lg">Profesiones</a></p>
        </div>
        <div class="col-md-4">
            <h2>Promover</h2>
            <p><a href="Contact.aspx" class="btn btn-primary btn-lg">Promover</a></p>
        </div>
    </div>

</asp:Content>
