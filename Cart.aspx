<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-top:50px;">
         <div class="col-md-9">
             <h5 class="itemNameDisplayCart" runat="server" id="numberOfItemsOnCart">My Cart (2 items)</h5>
             <asp:Repeater ID="cartItemsRepeater" runat="server">
                 <ItemTemplate>
                     <div class="media" style="border:1px solid #eaeaec">
                          <div class="media-left">
                            <a href="ItemsDisplay.aspx?ItemId=<%#Eval("ItemId") %>">
                             <img width="100px" class="media-object" src="images/ItemImages/<%#Eval("ItemId") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                            </a>
                          </div>
                          <div class="media-body">
                            <h5 class="media-heading itemNameDisplayCart"><%#Eval("ItemName") %></h5>
                           <p class="itemPriceDiscount">Size:<%#Eval("mySizeName") %></p>
                              <span class="itemOrgPrice"><%#Eval("ItemPrice", "{0:0, 00}") %> Birr</span>
                              <span class="itemPrice"><%#Eval("ItemSellPrice", "{0:c}") %> Birr</span>
                              <p>
                                  <asp:Button CommandArgument='<%#Eval("ItemId") +"-"+Eval("mySizeID")%>' ID="removeCartBtn" OnClick="removeCartBtn_Click1"  CssClass="rmvButton" runat="server" Text="Remove From Cart" />
                              </p>
                          </div>
                    </div>
               </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-3">            
          <h5 class="itemNameDisplayCart" runat="server" id="id_PriceDetails">Price Details</h5>
            <div class="media" style="border:1px solid #eaeaec">
                <div>
                    <label>Cart Total</label>
                    <span class="pull-right priceGray" runat="server" id="id_cartTotal"></span>
                </div>
                 <div>
                    <label>Cart Discount</label>
                    <span class="pull-right priceGreen" runat="server" id="id_discountOnCart">-700 Birr</span>
                </div>
            </div>
            <div class="itemPrice">
                    <label>Total</label>
                    <span class="pull-right priceGreen" runat="server" id="id_totalAmount"> Birr</span>
            </div>
            <div>
                <asp:Button ID="btnBuy" OnClick="btnBuy_Click"  CssClass="buy" runat="server" Text="Buy" />
            </div>
        </div>
    </div>
</asp:Content>

