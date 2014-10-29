<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">Login</li>
                    </ol>
                    </font>
                </div>  
                <div class="col-md-12">
                    <form action="Login" method="get">
                        <div class="col-md-6" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF;margin-right: 10px">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${msg != null}">
                                        <div class="col-md-12" style="margin-bottom: -20px;margin-top: 10px">
                                        <div class="alert alert-danger fade in" role="alert">
                                            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                            <strong>${msg}</strong>
                                        </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <h5 class="col-md-5">Login</h5>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <input type="text" name="username"  placeholder="username" class="form-control" required=""/>
                                    </div>          
                                </div>
                                <div class="col-xs-12">
                                    <div class="form-group">
                                        <input type="password" name="password" placeholder="password" class="form-control" required=""/>
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
                                <div class="col-xs-12" style="margin-bottom: 10px">
                                    <input type="submit" class="btn btn-block btn-lg btn-info" value="Login">
                                    <a class="login-link" href="#">Lost your password?</a>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="col-md-5" align="center" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div style="margin-top: 87px;margin-bottom: 87px">
                            <h6>New to SoMarket?</h6><br>
                            Get started now. It's fast and easy!<br>
                            <a href="Register.jsp" class="btn btn-lg btn-default">Register</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--<script src="js/jquery-1.8.3.min.js"></script>-->
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/flatui-checkbox.js"></script>
        <script src="js/flatui-radio.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <!--<script src="http://vjs.zencdn.net/4.3/video.js"></script>-->
        <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
