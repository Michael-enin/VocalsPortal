<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

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
                      <li class="active"><a href="Default.aspx">Home</a></li>
                      <li><a href="#">About</a></li>
                      <li><a href="#">Contact</a></li>

                      <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Items<span class="caret"></span></a>
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
           <!--carasoul-->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
        <img src="images/01.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="images/02.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>

      <div class="item">
      <img src="images/03.jpg" alt="...">
      <div class="carousel-caption">
        <h3>amazing</h3>
      </div>
    </div>

      <div class="item">
      <img src="images/04.jpg" alt="...">
      <div class="carousel-caption">
       <h3> nothing coming </h3>
      </div>
    </div>

      <div class="item">
      <img src="images/05.jpg" alt="...">
      <div class="carousel-caption">
        <h3> new very comfortable</h3>
      </div>
    </div>
    ...
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

<!--carasoul-->
</div>
        <br/>
        <br/>
       
           <!--Middle Contents-->
    <div class="container center">
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle" src="images/06.jpg" alt="thumb06" height="140" width="140"/>
                    <h2>Wine</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet ullamcorper erat in fermentum. Sed eu ullamcorper purus. Mauris in pellentesque nisi. Nulla non risus nulla. Morbi fringilla vulputate neque ut consectetur. Nulla neque nisi, mollis in pretium ut, venenatis nec nibh. Maecenas sollicitudin fringilla ligula at commodo. Duis nec felis faucibus, maximus urna quis, finibus ante.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="images/07.jpg" alt="thumb06" height="140" width="140"/>
                    <h2>Inverted</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet ullamcorper erat in fermentum. Sed eu ullamcorper purus. Mauris in pellentesque nisi. Nulla non risus nulla. Morbi fringilla vulputate neque ut consectetur. Nulla neque nisi, mollis in pretium ut, venenatis nec nibh. Maecenas sollicitudin fringilla ligula at commodo. Duis nec felis faucibus, maximus urna quis, finibus ante.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <img class="img-circle" src="images/05.jpg" alt="thumb06" height="140" width="140"/>
                    <h2>Sider Locker</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet ullamcorper erat in fermentum. Sed eu ullamcorper purus. Mauris in pellentesque nisi. Nulla non risus nulla. Morbi fringilla vulputate neque ut consectetur. Nulla neque nisi, mollis in pretium ut, venenatis nec nibh. Maecenas sollicitudin fringilla ligula at commodo. Duis nec felis faucibus, maximus urna quis, finibus ante.</p>
                    <p><a class="btn btn-default" href="#" role="button">View &raquo;</a></p>
                </div>
            </div>
    </div>
 
    <!--Middle Contents-->
        <!--footer Contents-->
        <hr />
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#" > Back To Top</a></p>
                <p>&copy; 2021 ServoProducts.com &middot;<a href="Default.aspx">Home</a> &middot;<a href="#" >About</a>&middot;<a href="#" >Contact</a>&middot;<a href="#" >Products</a>&middot;</p>

            </div>
        </footer>
        <!--footer Contents-->
    </form>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>
