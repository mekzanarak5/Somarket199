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
        <title>Social Market | Login</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-md-9">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Login</li>
                </ol>
            </div>
            <form action="Login" method="get">
            <div class="col-xs-9" style="margin:auto;">
                <div class="col-md-9" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 400px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-3"  >Login</h3>
                        <div class="col-xs-12">
                            <div class="form-group">
                                <input type="text" name="username"  placeholder="username" class="form-control" />
                            </div>          
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group">
                                <input type="password" name="password" placeholder="password" class="form-control" />
                            </div>          
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-3">
                                <label class="checkbox" for="checkbox1">
                                    <input type="checkbox" value="" id="checkbox1" data-toggle="checkbox">
                                    Remember
                                </label>
                            </div> <!-- /checkboxes col-xs-3 -->
                        </div>
                        <div class="col-xs-12">
                            <input type="submit" class="btn btn-block btn-lg btn-info" value="Login">
                            <a class="login-link" href="#">Lost your password?</a>
                            <a href="#fakelink" class="btn btn-block btn-lg btn-block">Register</a>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
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
