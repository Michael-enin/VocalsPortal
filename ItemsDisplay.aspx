<%@ Page Title="" Language="C#" MasterPageFile="~/Client.master" AutoEventWireup="true" CodeFile="ItemsDisplay.aspx.cs" Inherits="ItemsDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-top:50px">
        <div class="col-md-5">
            <div style="max-width:480px:" class="thumbnail">
               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      </ol>

                      <!-- Wrapper for slides -->
                      <div class="carousel-inner" role="listbox">
                          <asp:Repeater ID="imagesDisplayRepeater" runat="server">
                              <ItemTemplate>
                                    <div class="item <%# getActiveItemsOnly(Container.ItemIndex) %>">
                                      <img src="images/ItemImages/<%#Eval("ItemId") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>">
                                      
                                    </div>
                               </ItemTemplate>                              
                        </asp:Repeater>
                      </div>

                      <!-- Controls -->
                      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                 </div>
            </div>
        </div>
        <div class="col-md-7">
            <asp:Repeater ID="itemsDetialsRepeater" OnItemDataBound="itemsDetialsRepeater_ItemDataBound" runat="server">
                <ItemTemplate>
                    <div class="divDet1">
                         <h1 class="itemNameDisplay"><%#Eval("ItemName") %></h1>
                         <span class="itemsOriginalPriceDisplay"><%#Eval("ItemPrice") %> Birr</span><span class="ItemPriceDiscount"> (<%#string.Format("{0}", Convert.ToInt64(Eval("ItemPrice"))-Convert.ToInt64(Eval("ItemSellPrice"))) %>% Discount)</span>
                         <p class="ItemsSellingPrice"><%#Eval("ItemSellPrice") %> Birr</p>
                     </div>
                    <div>
                         <h5 class="highSize">Size</h5>
                        <div>
                            <asp:RadioButtonList ID="radioBtnSizes" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        
                            </asp:RadioButtonList>  
                        </div>
                     </div>
                    <div class="divDet1">
                        <asp:Button ID="addCartBtn" OnClick="addCartBtn_Click"  CssClass="majorButton" runat="server" Text="Add To Cart" />
                        <asp:Label ID="errorLabel" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                    <div class="divDet1">
                         <h5 class="highSize">Description</h5>
                        <p><%#Eval("ItemDescription") %></p>
                        
                    </div>
                    <div class="divDet1">
                         <h5 class="highSize">Details</h5>
                        <p><%#Eval("ItemDetails") %></p>                       
                    </div>
                    <div>
                        <p><%# ((int)Eval("freedelivery")==1)?"Free Delivery":"" %></p>
                        <p><%# ((int)Eval("30daysreturn")==1)?"30 Days Return":"" %></p>
                    </div>
                    <asp:HiddenField ID="hiddenFieldBrandId" Value='<%#Eval("BrandId") %>' runat="server" />
                    <asp:HiddenField ID="hiddenFieldCategoryId" Value='<%#Eval("CategoryId") %>' runat="server" />
                    <asp:HiddenField ID="hiddenFieldSubCategoryId" Value='<%#Eval("SubCategoryId") %>' runat="server" />
                    <asp:HiddenField ID="hiddenFieldGenderId" Value='<%#Eval("GenderID") %>' runat="server" />
                    
                  </ItemTemplate>
             </asp:Repeater>
        </div>
    </div>
</asp:Content>

