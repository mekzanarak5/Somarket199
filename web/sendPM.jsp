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
        <title>Social Market | Send Message to</title>
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
            <jsp:include page="logo_1.jsp"/>
        </div>
        <div class="col-md-10">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <font size="2">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Private Message</li>
                </ol>
                </font>
            </div>
            <form action="SendPmServlet" method="get">
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h3 class="col-md-12"  >Send Private Message</h3>
                            <div class="col-xs-12">
                                <h3 class="demo-panel-title">Receiver</h3>
                                <input id="tagsinput" class="tagsinput" value="${showRe.username}" />
                                <input type="hidden" name="receiverID" value="${showRe.account_Id}" />
                                <input type="hidden" name="receiverName" value="${showRe.username}" />
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <input type="hidden" name="senderName"  value="${user.username}" />
                                    <input type="text" name="subject"  placeholder="subject" class="form-control" />
                                </div>          
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <textarea class="form-control" name="pm" rows="3" required></textarea> 
                                </div>          
                            </div>
                            <div class="col-xs-5" style="margin: auto;float: none;margin-bottom: 50px" >
                                <input type="submit" class="btn btn-block btn-lg btn-info" value="Send !">
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
    </body>
</html>
