<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Pizza_Store._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron text-white text-center" style="background-image: url('/img/bg_3.jpg'); background-size: cover; background-position: center; height: 500px; display: flex; align-items: center; justify-content: center;">
    <div class="container">
        <h1 class="display-4">Welcome to Pizza Paradise!</h1>
        <p class="lead">The best pizza in town, fresh from our oven to your table.</p>
        <a href="~/Menu.aspx" class="btn btn-primary btn-lg">View Menu</a>
    </div>
</div>
        <h2 class="text-center">Top Pick of the Day</h2>

    <div class="row">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="pizza d-flex flex-column p-4  m-4 align-content-center justify-content-center" style="width: 18rem;">
                    <img src='<%# Eval("ImagePath") %>' class="img rounded-circle cover" width="250px" height="250px" alt='<%# Eval("Name") %>'>
                    <div class="d-flex flex-column align-items-center justify-content-center">
                       
                        <h3><%# Eval("Name") %></h3>
                       <p class="text"> <%# GetShortDescription(Eval("ShortDescription")) %></p>
                        <asp:Button ID="btnAddToCart" runat="server" CssClass="btn btn-white btn-outline-white" Text="View Details" CommandArgument='<%# Eval("PizzaID") %>'  OnClick="btnAddToCart_Click"/>
                    </div>
                </div>

            </ItemTemplate>
        </asp:DataList>
    </div>
    


</asp:Content>
