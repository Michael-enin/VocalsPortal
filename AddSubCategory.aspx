<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddSubCategory.aspx.cs" Inherits="AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div< class="container">
            <div class="form-horizontal">
                <h2>Add Sub Category</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lblCategory" runat="server" CssClass="col-md-2 control-label" Text="Category Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label ID="lblSubCategory" runat="server" CssClass="col-md-2 control-label" Text="Sub Category Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tboxSubCategory" CssClass="form-control" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="tboxSubCategory"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                     <div class="col-md-2"></div>
                     <div class="col-md-6">
                         <asp:Button ID="btnAdd" CssClass="btn btn-default"  runat="server" Text="Add" OnClick="btnAdd_Click1" />    
                     </div>
                 </div>

            </div>
        <h1>Sub Category</h1>
           <hr />
           <div class="panel panel-default">
              <!-- Default panel contents -->
              <div class="panel-heading">Sub Categories</div>
               <!--Repeater-->
               <asp:Repeater ID="subCatRepeater" runat="server">
                   <HeaderTemplate>
                        <table class="table">
                           <thead>
                               <tr>
                                   <th>Id</th>
                                   <th>Sub Category</th>
                                   <th>Category</th>
                                   <th>Action</th>
                               </tr>
                           </thead>
                      <tbody>
                   </HeaderTemplate>
                   <ItemTemplate>
                        <tr>
                          <td><%#Eval("SubCategoryId") %></td>
                          <td><%#Eval("SubCategoryName") %></td>
                            <td><%#Eval("CategoryName") %></td>
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

