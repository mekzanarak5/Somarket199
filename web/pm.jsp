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
        <title>Social Market | PM</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

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
                    <li class="active">PM</li>
                </ol>
            </div>      
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 400px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">PM</h3>
                        <div class="col-md-12">
                            <table class="table table-striped" style="text-align: center">
                                <tr bgColor="#ffffff">
                                    <td></td>
                                    <td>Sender</td>
                                    <td>Receiver</td>
                                    <td>Private Message</td>
                                    <td>Time</td>
                                    <td>Delete</td>
                                    <td>Reply</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="radio"><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" data-toggle="radio"></label>
                                    </td>
                                    <td><a href="#">Sitproject</a></td>
                                    <td><a href="#">boss451</a></td>
                                    <td><a href="feedback.html">Please Feedback for Sitproject !</a></td>
                                    <td>10:50 AM</td>
                                <form action="deletePM" method="post">
                                    <input type="hidden" name="pmid">
                                    <input type="hidden" name="userid">
                                    <td><input type="submit" class="btn btn-default" value="Delete !"></td>
                                </form>
                                <td><a href="#"><input type="button" class="btn btn-default" value="Reply !"></a></td>
                                </tr>
                            </table>
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
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
    </body>
</html>
