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
        <title>Social Market | Wish List</title>
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
            <jsp:include page="logo_1.jsp"/>
        </div>
        <div class="col-xs-9">
            <jsp:include page="header.jsp"/>
            <div class="col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li class="active">Wish List</li>
                </ol>
            </div>      
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">Wish List</h3>
                        <form action="DeleteWishlistServlet" method="get">
                            <div class="col-md-12">
                                <table class="table table-striped" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                    <input type="hidden" name="acctid" value="${user.account_Id}">
                                    <td>Product Name</td>
                                    <td>Price</td>
                                    <td>Seller</td>
                                    <td><button type="submit" class="btn btn-info"><img src="pic/bin.png" width="18px" height="18px" ></button></td>
                                    </tr>
                                    <c:forEach items="${wish}" var="a">
                                        <tr>
                                            <td><a href="#">${a.name}</a></td>
                                            <td><a href="#">${a.price}</a></td>
                                            <td>${a.seller}</td>
                                            <td><botton  class="checkbox"  for="checkbox1">
                                            <input type="checkbox" name="wishid" value="${a.wish_Id}" id="checkbox1" data-toggle="checkbox">
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
