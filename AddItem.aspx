<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div< class="container">
        <div class="form-horizontal">
            <h2>Add ITem</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tboxItemName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" class="text-danger" runat="server" ErrorMessage="Item must not be empity" ControlToValidate="tboxItemName"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" CssClass="col-md-2 control-label" Text="Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tboxPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="text-danger" runat="server" ErrorMessage="Please enter price" ControlToValidate="tboxPrice"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSellingPrice" runat="server" CssClass="col-md-2 control-label" Text="Selling Price"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tboxlSellingPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="text-danger" runat="server" ErrorMessage="Please enter selling price" ControlToValidate="tboxlSellingPrice"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Brand Name"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlistBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="ddlistBrand" initialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblCategory" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="ddlCategory" initialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSubCategory" runat="server" CssClass="col-md-2 control-label" Text="Sub Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSubCategoy" CssClass="form-control" runat="server"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="ddlSubCategoy" initialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblGender" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server"></asp:DropDownList>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="ddlGender" initialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSize" runat="server" CssClass="col-md-2 control-label" Text="Size"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tboxSize" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblDescription" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="tboxDescription" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="tboxDescription"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblItemDetail" runat="server" CssClass="col-md-2 control-label" Text="Item Details"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="lboxItemDetail" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="lboxItemDetail"></asp:RequiredFieldValidator>
                </div>
            </div>
             <div class="form-group">
                <asp:Label ID="lblfile01" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fileUpload01" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="fileUpload01"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblfile02" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fileUpload02" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="fileUpload02"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblfile03" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fileUpload03" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="fileUpload03"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblfile04" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="fileUpload04" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" class="text-danger" runat="server" ErrorMessage="This field is requiered" ControlToValidate="fileUpload04"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblFreeDelivery" runat="server" CssClass="col-md-2 control-label" Text="Free Delivary"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="checkBFreeDelivery" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbl30daysRet" runat="server" CssClass="col-md-2 control-label" Text="30 Days Return"></asp:Label>
                <div class="col-md-3">
                    <asp:CheckBox ID="checkB30DaysRet" runat="server" />
                </div>
            </div>
             <div class="form-group">
                 <div class="col-md-2"></div>
                 <div class="col-md-6">
                     <asp:Button ID="btnAdd" CssClass="btn btn-default"  runat="server" Text="Add" OnClick="btnAdd_Click" />    
                 </div>
            </div>
        </div>
   </div>
</asp:Content>

