<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div< class="container">
            <div class="form-horizontal">
                <h2>Add Brand</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Brand Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tboxBrandName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="tboxBrandName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                     <div class="col-md-2"></div>
                     <div class="col-md-6">
                         <asp:Button ID="btnAdd" CssClass="btn btn-default"  runat="server" Text="Add" OnClick="btnAdd_Click" />    
                     </div>
              </div>
            </div>
           <h1>Brands</h1>
           <hr />
           <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading">All Brands</div>
               <!--Repeater-->
               <asp:Repeater ID="brandsRepeater" runat="server">
                   <HeaderTemplate>
                        <table class="table">
                           <thead>
                               <tr>
                                   <th>Id</th>
                                   <th>Brands</th>
                                   <th>Actions</th>
                               </tr>
                           </thead>
                      <tbody>
                   </HeaderTemplate>
                   <ItemTemplate>
                        <tr>
                          <td><%#Eval("BrandId") %></td>
                          <td><%#Eval("Name") %></td>
                          <td>edit</td>
                      </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                        </tbody>
                       </table>
                   </FooterTemplate>
               </asp:Repeater>
               <!--Repeater-->
              <!-- Table -->
          
           </div>
        </div>
</asp:Content>

