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
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">PM (Inbox)</li>
                    </ol>
                    </font>
                </div>      
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h5 class="col-md-1">PM</h5>
                            <div class="col-md-1" style="margin-top: 14px;margin-left: -30px">
                                <a href="ShowPmServlet?id=${user.account_Id}"><button class="btn btn-xs btn-primary">Inbox</button></a>
                            </div>
                            <div class="col-md-1" style="margin-top: 14px;margin-left: -30px">
                                <a href="ShowSentServlet?id=${user.account_Id}"><button class="btn btn-xs btn-default">Sent</button></a>
                            </div>
                            <form action="DeleteMessageServlet" method="get">
                                <div class="col-md-12">
                                    <table class="table table-striped" id="table6" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                        <td>Sender</td>
                                        <td>Subject</td>
                                        <td>Time</td>
                                        <td ><button type="submit" class="btn btn-xs btn-primary" onclick="return confirm('Are you sure ?');"><span class="glyphicon glyphicon-trash"></span></button></td>
                                        </tr>
                                        <c:forEach items="${pm}" var="a">
                                            <tr>
                                                <td><a href="#">${a.senderName}</a></td>
                                                <td><a href="ReplayServlet?id=${a.msgID}&relate=${a.relate}">${a.subject}</a></td>
                                                <td>${a.time}</td>
                                                <td><input type="checkbox" name="pmid" value="${a.msgID}"></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </form>
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
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script language="javascript" type="text/javascript">
            //<![CDATA[  
            var table6_Props = {
                paging: true,
                paging_length: 10,
                rows_counter: true,
                rows_counter_text: "Rows:",
            };
            var tf6 = setFilterGrid("table6", table6_Props);
            //]]>  
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
