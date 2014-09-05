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
        <title>Social Market | Sell List</title>
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
        <div class="col-md-9">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li>Profile</li>
                    <li class="active">Sell List</li>
                </ol>
            </div>
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 500px;background: #FFFFFF">
                    <div class="row">
                        <h6 class="col-md-3"  >Sell List</h6>
                        <div id="cbp-vm" class="cbp-vm-switcher">
                            <div class="btn-group btn-group-justified">
                                <div class="btn-group">
                                    <a href="mypost.html"><button type="button" class="btn btn-default">Now Sell</button></a>
                                </div>
                                <div class="btn-group">
                                    <a href="ongoing.html"><button type="button" class="btn btn-default">Ongoing</button></a>
                                </div>
                                <div class="btn-group">
                                    <a href="sold.html"><button type="button" class="btn btn-default">Sold List</button></a>
                                </div>
                            </div>
                            <div class="col-md-12"><h6>Now Sell</h6></div>
                            <hr>
                            <table class="table table-striped" style="text-align: center">
                                <tr bgColor="#ffffff">
                                    <td width="15%">Expiration Date</td>
                                    <td width="20%">Pic</td>
                                    <td width="20%">Name</td>
                                    <td>Price</td>
                                    <td>Manage Post</td>
                                </tr>
                                <c:forEach items="${sell}" var="a">
                                <tr>
                                    <td>${a.createOn}</td>
                                    <td><a href="productza.html"><img src="img/ip1.jpeg" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                                    <td>
                                        <a href="">
                                            ${a.name}</a></td>
                                    <td>${a.price}</td>
                                    <td width="20%"><div class="btn-group">
                                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                                Manage Post <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#">Edit</a></li>
                                                <li><a href="#">Increase</a></li>
                                                <li><a href="DeleteProductServlet?id=${a.productNO}">Delete</a></li>
                                            </ul>
                                        </div></td>
                                </tr>
                                </c:forEach>
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
