<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Forgot Pass</title>

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
                  <a class="navbar-brand" href="Default.aspx"><span> <img alt ="Logo" src="images/sing.jpg" height="30"/></span>Vocals Portal</a>
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
                      <li><a href="SignUp.aspx">Sign Up</a></li>
                      <li><a href="SignIn.aspx">Sign In</a></li>
                  </ul>
              </div>

     </div>
    </div>
  </nav>
    </div>
        <div class="container">
            <div class="form-horizontal">
                <h2>Recover Password</h2>
                <hr />
                <h3>please enter your email, we will send you instructions to reset </h3>
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Your Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="emailTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" class="text-danger" ControlToValidate="emailTextBox" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"> </div>
                    <div class="col-md-6">
                            <asp:Button ID="btnPassReset" runat="server" CssClass="btn btn-default" Text="send" OnClick="btnPassReset_Click" />
                        <asp:Label ID="lblPassCheck" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!--footer-->
     <hr />
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#" > Back To Top</a></p>
                <p>&copy; 2021 ServoProducts.com &middot;<a href="Default.aspx">Home</a> &middot;<a href="#" >About</a>&middot;<a href="#" >Contact</a>&middot;<a href="#" >Products</a>&middot;</p>
            </div>
        </footer>
        <!--footer Contents-->
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
