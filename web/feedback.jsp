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
        <title>Social Market | Feedback</title>
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
                        <li><a href="profile.jsp">Profile</a></li>
                        <li  class="active">FeedBack</li>
                    </ol>
                    </font>
                </div>   

                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <div class="col-md-12"><h4>Item Awaiting Feedback</h4></div>
                            <table class="table" >
                                <tr bgColor="#ececea">
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <div class="col-md-12"><h4>Recent Feedback</h4></div>
                            <table class="table" >
                                <tr bgColor="#ececea">
                                    <td width="45%">FeedBack</td>
                                    <td></td>
                                    <td>From</td>
                                    <td>Date</td>
                                    <td>order #</td>
                                </tr>
                                <c:forEach items="${flist}" var="feed" >
                                    <tr>
                                        <td>${feed.comment}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${feed.rate==5}">
                                                    <div style="color: #ffcc66">
                                                        <c:forEach begin="1" end="5">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                                <c:when test="${feed.rate==4}">
                                                    <div style="color: #ffcc66">
                                                        <c:forEach begin="1" end="4">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                        </c:forEach>
                                                            <c:forEach begin="1" end="1">
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                                <c:when test="${feed.rate==3}">
                                                    <div style="color: #ffcc66">
                                                        <c:forEach begin="1" end="3">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                        </c:forEach>
                                                            <c:forEach begin="1" end="2">
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                                <c:when test="${feed.rate==2}">
                                                    <div style="color: #ffcc66">
                                                        <c:forEach begin="1" end="2">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                        </c:forEach>
                                                            <c:forEach begin="1" end="3">
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                                <c:when test="${feed.rate==1}">
                                                    <div style="color: #ffcc66">
                                                        <c:forEach begin="1" end="1">
                                                            <span class="glyphicon glyphicon-star"></span>
                                                        </c:forEach>
                                                            <c:forEach begin="1" end="4">
                                                            <span class="glyphicon glyphicon-star-empty"></span>
                                                        </c:forEach>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td><c:choose><c:when test="${feed.type=='buyer'}">seller:</c:when><c:otherwise>buyer:</c:otherwise></c:choose>  ${feed.from}</td>
                                        <td>${feed.date}</td>
                                        <td align="center">${feed.order}</td>
                                    </tr></c:forEach>
                                </table>
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
            <!--<script src="http://vjs.zencdn.net/4.3/video.js"></script>-->
            <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
