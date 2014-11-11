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
        <title>Social Market | Login (Admin)</title>
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
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Login (Admin)</li>
                    </ol>
                    </font>
                </div>
                <div class="col-md-12">
                    <form action="LoginAdmin" method="get">
                        <div class="col-md-6" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF;margin-right: 10px">
                            <div class="row">
                                <h5 class="col-md-5"  >Login (Admin)</h5>
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
                                <div class="col-xs-12" style="margin-bottom: 10px">
                                    <input type="submit" class="btn btn-block btn-lg btn-info" value="Login (Admin)">
                                </div>
                            </div>
                        </div>
                    </form>
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
