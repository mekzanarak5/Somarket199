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
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">

        <div style="margin-bottom: -20px">
            <jsp:include page="header1.jsp"/>
        </div>
        <div class="row">
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
                                                    ${pm.username}
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
                                            <c:forEach items="${reply}" var="a">
                                                ${a.username} Say: ${a.pm}
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-sm-10">
                                            <textarea class="form-control" name="pm" rows="3" placeholder="Reply" required></textarea> 
                                        </div>
                                    </div>
                                    <input type="hidden" name="sender"  value="${user.account_Id}" />
                                    <input type="hidden" name="subject" value="Re: ${pm.subject}"/>
                                    <input type="hidden" name="receiver" value="${pm.sender}"/>
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
