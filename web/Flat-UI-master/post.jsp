<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Post</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="bootstrap/css/dropdown.css" rel="stylesheet">
        <link href="bootstrap/css/semantic.css" rel="stylesheet">
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
            <div class="col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Post</li>
                </ol>
            </div>      
            <div class="col-xs-11" style="margin:auto;">
                <div class="col-md-11" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 500px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">Post</h3>
                        <form class="form-horizontal" align="center">
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Product</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Name of product" name="name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Price</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Price" name="price" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3">Description</label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" name="des" rows="3" required></textarea> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Quatity</label>
                                <div class="col-sm-6">
                                    <input type="number" class="form-control" placeholder="Quatity" name="name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Color</label>
                                <div class="col-sm-3">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                            Choose Color <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Action</a></li>
                                            <li><a href="#">Another action</a></li>
                                            <li><a href="#">Something else here</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3">Catagory</label>
                                <div class="col-sm-3">
                                    <div class="ui inline dropdown">
                                        <input type="hidden" name="gender">
                                        <div class="text">Shiba Inu</div>
                                        <i class="dropdown icon"></i>
                                        <div class="menu">
                                            <div class="item">
                                                <i class="dropdown icon"></i>
                                                Dogs
                                                <div class="menu">
                                                    <div class="item">Shiba Inu</div>
                                                    <div class="item">Poodle</div>
                                                    <div class="item">Labrador</div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <i class="dropdown icon"></i>
                                                Cats
                                                <div class="menu">
                                                    <div class="item">Aegean</div>
                                                    <div class="item">Balinese</div>
                                                    <div class="item">Persian</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/dropdown.js"></script>
        <script src="js/semantic.js"></script>
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/flatui-checkbox.js"></script>
        <script src="js/flatui-radio.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script>
            $(function() {
                $('.ui.dropdown').dropdown();
            });
        </script>
    </body>
</html>
