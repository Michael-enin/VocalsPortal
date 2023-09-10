<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-top:20px;">
        <div class="col-md-9">
           <div class="form-horizontal">
                    <h2 >Delivery Address</h2>
                    <hr />
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                        <div class="col-md-5">
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </div>
                    </div> 
               <div class="form-group">
                        <asp:Label ID="lblAddr" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                        <div class="col-md-5">
                            <asp:TextBox ID="addrName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="addrName"></asp:RequiredFieldValidator>
                        </div>
                    </div>
               <div class="form-group">
                        <asp:Label ID="lbl" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                        <div class="col-md-5">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="addrName"></asp:RequiredFieldValidator>
                        </div>
                 </div>
           </div>
         </div>
        <div class="col-md-3">
           <div class="form-horizontal">
              <h2  runat="server" id="id_PriceDetails">Price Details</h2>
              <hr />
                <div class="media" style="border-bottom:1px solid #eaeaec">
                    <div>
                        <label>Cart Total</label>
                        <span class="pull-right priceGray" runat="server" id="id_cartTotal">4000 Birr</span>
                    </div>
                     <div>
                        <label>Cart Discount</label>
                        <span class="pull-right priceGreen" runat="server" id="id_discountOnCart">-700 Birr</span>
                    </div>
                </div>
                <div class="itemPrice">
                        <label>Total</label>
                        <span class="pull-right priceGreen" runat="server" id="id_totalAmount">1234 Birr</span>
                </div>
                <div>
               
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <h5>Make Payment</h5>
        </div>
    </div>
</asp:Content>

