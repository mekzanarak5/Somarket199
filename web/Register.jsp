<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Register</title>
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
                        },
                        password: {
                            required: true,
                            minlength: 6,
                            maxlength: 15
                        },
                        confirmpassword: {
                            required: true,
                            minlength: 6,
                            maxlength: 15,
                            equalTo: "#password"
                        },
                        firstname: {
                            required: true,
                            minlength: 4,
                            maxlength: 256
                        },
                        lastname: {
                            required: true,
                            minlength: 4,
                            maxlength: 256
                        },
                        phone: {
                            required: true,
                            minlength: 10
                        },
                        email: {
                            required: true,
                            email: true
                        }
                    }
                });
            });
            jQuery(function($) {
                $("#phone").mask("999-999-9999");
            });
            jQuery(function($) {
                $("#username").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[a-z0-9 ]/g;
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
            jQuery(function($) {
                $("#firstname").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-zก-ฮ ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#firstname').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
            jQuery(function($) {
                $("#lastname").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-zก-ฮ ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#lastname').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
            jQuery(function($) {
                $("#password").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-z0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#password').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
            jQuery(function($) {
                $("#confirmpassword").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-z0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#confirmpassword').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
        </script>
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12" style="margin:auto">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Register</li>
                    </ol>
                    </font>
                </div>     
                <div class="col-xs-10" style="margin:auto;">
                    <div class="col-md-10" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <c:choose>
                            <c:when test="${msg != null}">
                                <div class="col-md-12" style="margin-bottom: -20px;margin-top: 10px">
                                    <div class="alert alert-danger fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert"><span class="sr-only">Close</span></button>
                                        <strong>${msg}</strong>
                                    </div>
                                </div>
                            </c:when>
                        </c:choose>
                        <div class="form-horizontal">
                            <h5 class="col-md-12">Register</h5>
                            <form id="form" action="register" method="get">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">E-mail<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input id="email" type="email" placeholder="somarket@example.com" name="email" class="form-control" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Username<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input id="username" type="text" class="form-control" placeholder="6-15 character" maxlength="15" name="username" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Password<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control" placeholder="6-15 character" maxlength="15" name="password" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Confirmed Password<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input type="password" id="confirmpassword" class="form-control" placeholder="6-15 character" maxlength="15" name="confirmpassword" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">First Name<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="firstname" placeholder="First Name" maxlength="50" name="firstname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Last Name<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="lastname" placeholder="Last Name" maxlength="50" name="lastname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Phone<font style="color: red">*</font></label>
                                    <div class="col-sm-6">
                                        <input type="text" id="phone" class="form-control" placeholder="Phone" name="phone" required>
                                    </div>
                                </div>
                                <script>
                                    function myFunction() {
                                        alert("${msg1}");
                                    }
                                </script>
                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-10">
                                        <c:choose>
                                            <c:when test="${msg1 != null}">
                                                <button type="submit" class="btn btn-info" onclick="myFunction()">Submit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="submit" class="btn btn-info">Submit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                            </c:otherwise>
                                        </c:choose>        
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>                 
            </div>
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
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
