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
                        <h3 class="col-md-2">PM</h3>
                        <div class="col-md-1" style="margin-top: 30px">
                            <a href="ShowPmServlet?id=${user.account_Id}"><button class="btn btn-primary">Inbox</button></a>
                        </div>
                        <div class="col-md-3" style="margin-top: 30px">
                            <a href="ShowSentServlet?id=${user.account_Id}"><button class="btn btn-default">Sent</button></a>
                        </div>
                        <form action="DeleteMessageServlet" method="get">
                            <div class="col-md-12">
                                <table class="table table-striped" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                    <input type="hidden" name="acctid" value="${user.account_Id}">
                                    <td>Sender</td>
                                    <td>Subject</td>
                                    <td>Time</td>
                                    <td><button  type="submit"><img src="pic/bin.png" width="18px" height="18px" ></button></td>
                                    </tr>
                                    <c:forEach items="${pm}" var="a">
                                        <tr>
                                            <td><a href="#">${a.username}</a></td>
                                            <td><a href="ReplayServlet?id=${a.msgID}">${a.subject}</a></td>
                                            <td>${a.time}</td>
                                            <td><botton  class="checkbox"  for="checkbox1">
                                                    <input type="checkbox" name="pmid" value="${a.msgID}" id="checkbox1" data-toggle="checkbox">
                                                    </botton>
                                                       </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </form>
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
