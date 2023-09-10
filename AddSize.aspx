<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="AddSize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div< class="container">
            <div class="form-horizontal">
                <h2>Add Size</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lblSize" runat="server" CssClass="col-md-2 control-label" Text="Size Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tboxSizeName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="tboxSizeName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Brand"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="ddlBrand"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server"  CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lblSubCategory" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubCategory" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="ddlSubCategory"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lblGender" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlGenderName" CssClass="form-control"  runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="ddlGenderName"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                     <div class="col-md-2"></div>
                     <div class="col-md-6">
                         <asp:Button ID="btnAdd" CssClass="btn btn-default"  runat="server" Text="Add" OnClick="btnAdd_Click" />    
                     </div>
                </div>
            </div>

        <h1>Sizes</h1>
           <hr />
           <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading">All Sizes</div>
               <!--Repeater-->
               <asp:Repeater ID="sizeRepeater" runat="server">
                   <HeaderTemplate>
                        <table class="table">
                           <thead>
                               <tr>
                                   <th>Id</th>
                                   <th>Name</th>
                                   <th>Brand</th>
                                   <th>Category</th>
                                   <th>Sub Category</th>
                                   <th>Gender</th>
                                   <th>Actions</th>
                               </tr>
                           </thead>
                      <tbody>
                   </HeaderTemplate>
                   <ItemTemplate>
                        <tr>
                          <td><%#Eval("SizeId") %></td>
                          <td><%#Eval("SizeName") %></td>
                           <td><%#Eval("Name") %></td>
                            <td><%#Eval("CategoryName") %></td>
                            <td><%#Eval("SubCategoryName") %></td>
                            <td><%#Eval("GenderName") %></td>
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

