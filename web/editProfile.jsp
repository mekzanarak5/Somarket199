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
        <title>Social Market | Edit Profile</title>
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
                        firstname: {
                            required: true,
                            minlength: 4,
                            maxlength: 256
                        },
                        lastname: {
                            required: true,
                            minlength: 4,
                            maxlength: 256
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
        </script>
    </head>
<jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo_1.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li class="active">Edit</li>
                    </ol>
                    </font>
                </div>
                <form id="form" action="EditProfileServlet" method="get">
                    <div class="col-xs-12" style="margin:auto;">
                        <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                            <div class="form-horizontal">
                                <h3 class="col-md-12"  >Edit Profile</h3>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">First Name</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="firstname" class="form-control" value="${user.firstName}" name="firstname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Last Name</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="lastname" class="form-control" value="${user.lastName}" name="lastname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-3 control-label">Phone</label>
                                    <div class="col-sm-4">
                                        <input type="text" id="phone" class="form-control" value="${user.phone}" name="phone" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-10">
                                        <input type="hidden" value="${user.account_Id}" name="acctid">
                                        <button type="submit" class="btn btn-info">Submit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
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
