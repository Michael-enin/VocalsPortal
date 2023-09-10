<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Sign Up</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/custom.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
           <nav  class="navbar navbar-default navbar-fixed-top" role="navigation">
     <div class="navbar navbar-defualt navbar-fixed-top" role="navigation">
         <div class ="container">
             <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="Defualt.aspx"><span> <img alt ="Logo" src="images/sing.jpg" height="30"/></span>Vocals Portal</a>
         </div>
              <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                      <li><a href="Default.aspx">Home</a></li>
                      <li><a href="#">About</a></li>
                      <li><a href="#">Contact</a></li>

                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Products<span class="caret"></span></a>
                               <ul class="dropdown-menu">
                                   <li class="dropdown-header">ORIGINAL</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">Aering </a></li>
                                   <li><a href="#">flying </a></li>
                                   <li><a href="#">nothing</a></li>
                                   <li role="separator" class="divider"></li>
                                   <li class="dropdown-header">HIGH COPY</li>
                                   <li role="separator" class="divider"></li>
                                   <li><a href="#">Aering </a></li>
                                   <li><a href="#">flying </a></li>
                                   <li><a href="#">nothing</a></li>
                               </ul>
                      </li>
                      <li class="active"><a href="SignUp.aspx">Sign Up</a></li>
                       <li><a href="SignIn.aspx">Sign In</a></li>
                  </ul>
                    </div>
               </div>
            </div>
          </nav>
    </div>
       <!--sign up-->
        <div class="center-page">
            <label class="col-xs-11">User Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbUname" runat="server" CssClass="form-control" placeholder="UserName"></asp:TextBox>
            </div>

             <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbPass" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>

              <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbCpass" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>

             <label class="col-xs-11">Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
            </div>

             <label class="col-xs-11">Email</label>
            <div class="col-xs-11">
                <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
            </div>

            <div class="col-xs-11 vert">
                <asp:Button ID="btSignUp" runat="server" Class ="btn btn-success" Text="SignUp" OnClick="btSignUp_Click" /> 
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
           </div>

            
        </div>
        <!--sign up-->
             <!--footer Contents-->
        <hr/>
        <footer class="footer-pos">
            <div class="container">
                <p class="pull-right"><a href="#" > Back To Top</a></p>
                <p>&copy; 2021 ServoProducts.com &middot;<a href="Default.aspx">Home</a> &middot;<a href="#" >About</a>&middot;<a href="#" >Contact</a>&middot;<a href="#" >Products</a>&middot;</p>

            </div>
        </footer>
        <!--footer Contents-->
        <p>
            &nbsp;</p>
        
    </form>
    <script src="js/jquery-3.5.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
