
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Product</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/jasny-bootstrap.min.css"/>

        <!-- Loading Flat UI -->
        <link href="css/flat-ui.css" rel="stylesheet">
        <link href="css/demo.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/favicon.ico">
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-xs-9">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Product</li>
                </ol>
            </div>  
            <div class="col-md-12" align="center">
                <div class="col-md-5">
                    <img name="Image" src="img/ip1.jpeg" width="250" height="250"><br /><br /> 
                    <a onclick="ChangeImage('img/ip1.jpeg')"><img src="img/ip1.jpeg" width="50" height="50"></a> 
                    <a onclick="ChangeImage('img/ip2.jpeg')"><img src="img/ip2.jpeg" width="50" height="50"></a> 
                    <a onclick="ChangeImage('img/ip3.jpeg')"><img src="img/ip3.jpeg" width="50" height="50"></a> 

                </div>
                <div class="col-md-6">
                    <a href="#" class="list-group-item active">
                        <h6 class="list-group-item-heading">Price ${showDetail.price}</h6>
                    </a>
                    <a href="#" class="list-group-item">
                        <h6 class="list-group-item-heading">Sitproject@st.sit.ac.th ( 999<span class="glyphicon glyphicon-star"></span> )</h6>
                    </a>
                    <a href="#" class="list-group-item">
                        <h6 class="list-group-item-heading">Phone No. 081-111-1111</h6>
                    </a>
                    <a href="#" class="list-group-item">
                        <h6 class="list-group-item-heading">Send Private Message</h6>
                    </a>
                    <a href="#" class="list-group-item">
                        <h6 class="list-group-item-heading"><img src="img/Facebook_Button_short.png" width="50em"><img src="img/twitter share button.png" width="50em"><img src="img/index_followme.png" width="50em"></h6>
                    </a>
                    <br />
                </div>
                <div class="col-md-1">
                    <a href=""><button type="button" class="btn btn-danger">Report</button></a>
                </div>
            </div>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" placeholder="Name of product" name="name" value="${showDetail.name}" disabled="disabled">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-7">
                        <textarea class="form-control" name="des" rows="3" disabled>${showDetail.description}</textarea> 
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Quatity</label>
                    <div class="col-sm-3">
                        <input type="number" class="form-control" placeholder="Quatity" value="1" required>
                    </div>
                </div>
                <div class="well col-md-6" style="margin: auto;float: none">
                    <a href="cart.html"><button type="button" class="btn btn-primary btn-lg btn-block">Add To Cart</button></a>
                </div>
            </form>
        </div>
        <script language="JavaScript">
            function ChangeImage(image) {
                document.Image.src = image;
            }
        </script> 
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/flatui-checkbox.js"></script>
        <script src="js/flatui-radio.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
    </body>
</html>
