<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="Items.aspx.cs" Inherits="Items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <asp:repeater ID="itemsRepeater" runat="server">
           <ItemTemplate>
                <div class="col-sm-3 col-md-3" style="padding-top:50px;">
                    <a style="text-decoration:none;" href="ItemsDisplay.aspx?ItemId=<%#Eval("ItemId") %>">
                        <div class="thumbnail">
                            <img src="images/ItemImages/<%#Eval("ItemId") %>/<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" onerror="this.src='images/noimage.jpg'">
                            <div class="caption">
                                <div class="itemBrand"><%#Eval("BrandName") %></div>
                                <div class="itemName"><%#Eval("ItemNAme") %></div>
                                <div class="itemPrice"><span class="itemOrgPrice"><%#Eval("ItemPrice") %> </span><%#Eval("ItemSellPrice") %> <span class="itemPriceDiscount">(<%#Eval("Discount")%>% off)</span></div>
                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
      </asp:repeater>
</div>
</asp:Content>

