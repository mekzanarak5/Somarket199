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
                            <h3 class="col-md-1">PM</h3>
                            <div class="col-md-1" style="margin-top: 30px">
                                <a href="ShowPmServlet?id=${user.account_Id}"><button class="btn btn-default">Inbox</button></a>
                            </div>
                            <div class="col-md-3" style="margin-top: 30px">
                                <a href="ShowSentServlet?id=${user.username}"><button class="btn btn-primary">Sent</button></a>
                            </div>
                            <div class="col-md-12">
                                <form action="DeleteSentServlet" method="get">
                                    <table class="table table-striped" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                        <td>Receiver</td>
                                        <td>Subject</td>
                                        <td>Time</td>
                                        <td><button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure ?');"><span class="glyphicon glyphicon-trash"></span></button></td>
                                        </tr>
                                        <c:forEach items="${pm}" var="a">
                                            <tr>
                                                <td><a href="#">${a.senderName}</a></td>
                                                <td><a href="ReplayServlet?id=${a.msgID}&relate=${a.relate}">${a.subject}</a></td>
                                                <td>${a.time}</td>
                                                <td><input type="checkbox" name="pmid" value="${a.msgID}"</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </form>
                                <!--                            <table class="table table-striped" style="text-align: center">
                                                                <tr bgColor="#ffffff">
                                                                    <td></td>
                                                                    <td>Sender</td>
                                                                    <td>Private Message</td>
                                                                    <td>Time</td>
                                                                    <td>Delete</td>
                                                                </tr>
                                <c:forEach items="${pm}" var="a">
                                <tr>
                                    <td>
                                        <label class="radio"><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" data-toggle="radio"></label>
                                    </td>
                                    <td><a href="#">${a.username}</a></td>
                                    <td><a href="#">${a.pm}</a></td>
                                    <td>${a.time}</td>
                                <td><a href="DeleteMessageServlet?pmid=${a.msgID}"><button class="btn btn-default">Delete !</button></a></td>
                                <td><a href="#"><input type="button" class="btn btn-default" value="Reply !"></a></td>
                                </tr>
                                </c:forEach>
                            </table>-->
                            </div>
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
