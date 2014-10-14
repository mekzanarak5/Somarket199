<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | PM</title>
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
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">PM</li>
                    </ol>
                    </font>
                </div>      
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h3 class="col-md-2">PM</h3>
                            <form action="SendReplyServlet" method="get">

                                <div class="col-md-12">
                                    <hr>
                                    <div class="col-md-4">
                                        <ul class="media-list">
                                            <li class="media">
                                                <a class="pull-left" href="#">
                                                    <img class="media-object" src="${pm.pic}" alt="..." width="80px" height="100px">
                                                </a>
                                                <div class="media-body">
                                                    <h4 class="media-heading">Sender</h4>
                                                    ${pm.senderName}
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">Subject</div>
                                            <div class="panel-body">
                                                ${pm.subject}
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-12">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">Message</div>
                                        <div class="panel-body">
                                            <c:forEach items="${reply}" var="a" begin="0" end="${pm1.count}">
                                                ${a.senderName} Say: ${a.pm}
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-sm-10 " style="margin-bottom: 50px">
                                            <textarea class="form-control" name="pm" rows="3" placeholder="Reply" required></textarea> 
                                        </div>
                                    </div>
                                    <input type="hidden" name="subject" value="${pm.subject}"/>
                                    <input type="hidden" name="receiverID" value="${pm.senderID}"/>
                                    <input type="hidden" name="receiverName" value="${pm.senderName}"/>
                                    <input type="hidden" name="senderName" value="${pm.receiverName}"/>
                                    <input type="hidden" name="relate" value="${pm.relate}"/>
                                    <button type="submit" class="btn btn-info">Reply</button>
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
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
