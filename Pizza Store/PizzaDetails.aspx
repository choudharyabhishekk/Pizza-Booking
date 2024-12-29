<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PizzaDetails.aspx.cs" Inherits="Pizza_Store.PizzaDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center ">
            <div class="col-lg-12 ">
                <div class="card shadow-lg  border-0">
                    <div class="row g-0">
                        <div class="col-md-6">
                            <img src="<%: Pizza.ImagePath %>" alt="<%: Pizza.Name %>" class="img-fluid rounded-start" style="object-fit: cover; height: 100%;">
                        </div>
                        <div class="col-md-6">
                            <div class="card-body p-4">
                                <h2 class="card-title fw-bold text-primary mb-3"><%: Pizza.Name %></h2>
                                <hr class="text-muted">
                                <p class="card-text text-muted mb-3"><%: Pizza.Description %></p>

                                <div class="d-flex justify-content-between align-items-center mb-1">
                                    <span class="h2  text-dark bold fw-bolder">$<%: Pizza.Price %></span>
                                </div>

                           <div class="mb-2 d-flex align-items-center"> <%-- Added d-flex and align-items-center --%>
                                    <label for="cart_quantity" class="form-label fw-bold me-2" style="width: 80px;">Quantity:</label> <%-- Added margin-right --%>
                                    <div style="width: 80px;">
                                        <asp:TextBox ID="cart_quantity" runat="server" CssClass="form-control" Type="Number" value="1" min="1"></asp:TextBox>
                                    </div>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Quantity" Type="Integer" Display="Dynamic" MinimumValue="1" ControlToValidate="cart_quantity" ForeColor="#dc3545" MaximumValue="10"></asp:RangeValidator>
                                </div>

                                <div class="mb-4">
                                    <label for="SizeDropDown" style="width: 80px;" class="form-label fw-bold" >Size:</label>
                                    <asp:DropDownList ID="SizeDropDown" AutoPostBack="True" runat="server" CssClass="form-select" OnSelectedIndexChanged="SizeDropDown_SelectedIndexChanged"></asp:DropDownList>
                                </div>

                                <% if (!Context.User.IsInRole("Admin"))
                                    { %>
                                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-primary w-100 btn-lg" CommandArgument='<%# Eval("Pizza.ProductID") %>' OnClick="btnAddToCart_Click" />
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="success-alert" class="alert alert-success alert-dismissible fade show mt-3" role="alert" style="display: none;">
            Success! Item added to Cart.
        </div>
    </div>

    <script>
        // Auto-hide alert after 4 seconds with smoother transition
        window.setTimeout(function () {
            const alertElement = document.getElementById('success-alert');
            if (alertElement) {
                alertElement.classList.add('fade-out'); // Add a CSS class for transition
                setTimeout(() => alertElement.remove(), 500); // Remove after transition
            }
        }, 3000); // Shortened to 3 seconds

        // CSS for smoother transition
        const style = document.createElement('style');
        style.innerHTML = `
            .fade-out {
                opacity: 0 !important;
                transition: opacity 0.5s ease-in-out;
            }
        `;
        document.head.appendChild(style);
    </script>
</asp:Content>