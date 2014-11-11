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
        <script>

            function function3() {
                type = $("#type").val();

                if (type === "default") {
                    alert("Please Select Type");
                    $("#type").focus().freeze();
                }

                $("#form").submit();
            }


            $(document).ready(function() {

                $("#form").validate({
                    rules: {
                        username: {
                            required: true,
                            minlength: 6,
                            maxlength: 15
                        }
                    }
                });
            });
            jQuery(function($) {
                $("#username").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-z0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#username').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
            $(document).ready(function() {
                $('#demo2').click(function() {
                    $.blockUI({css: {
                            border: 'none',
                            padding: '15px',
                            backgroundColor: '#000',
                            '-webkit-border-radius': '10px',
                            '-moz-border-radius': '10px',
                            opacity: .5,
                            color: '#fff'
                        }});

                    setTimeout($.unblockUI, 20000);
                });
            });

        </script>
        <style>
            .spinner {
                width: 40px;
                height: 40px;
                margin: 100px auto;
                background-color: #333;

                border-radius: 100%;
                -webkit-animation: scaleout 1.0s infinite ease-in-out;
                animation: scaleout 1.0s infinite ease-in-out;
            }

            @-webkit-keyframes scaleout {
                0% { -webkit-transform: scale(0.0) }
                100% {
                    -webkit-transform: scale(1.0);
                    opacity: 0;
                }
            }

            @keyframes scaleout {
                0% {
                    transform: scale(0.0);
                    -webkit-transform: scale(0.0);
                } 100% {
                    transform: scale(1.0);
                    -webkit-transform: scale(1.0);
                    opacity: 0;
                }
            }
        </style>
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
                        <li><a href="index.jsp">Home</a></li>
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
                                <c:choose>
                                    <c:when test="${msg1 != null}">
                                        <div class="col-md-12" style="margin-bottom: -20px;margin-top: 10px">
                                            <div class="alert alert-success fade in" role="alert">
                                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                                                <strong>${msg1}</strong>
                                            </div>
                                        </div>
                                    </c:when>
                                </c:choose>
                                <h5 class="col-md-5">Login</h5>
                                <div class="col-xs-12">
                                    <div class="input-group input-group-lg" style="margin-bottom: 15px">
                                        <input type="text" id="username" class="form-control" placeholder="username" maxlength="15" name="username" required>
                                        <span class="input-group-addon"><span class="fui-user"></span></span>
                                    </div>
                                    <div class="input-group input-group-lg" style="margin-bottom: 15px">
                                        <input type="password" class="form-control" placeholder="password" maxlength="15" name="password" required>
                                        <span class="input-group-addon"><span class="fui-lock"></span></span>
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

                                <div class="col-xs-12" style="margin-bottom: 15px">
                                    <input type="submit" class="btn btn-block btn-lg btn-info" value="Login" >
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
