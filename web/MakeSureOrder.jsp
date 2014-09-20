<%-- 
    Document   : confirmOrder
    Created on : Nov 22, 2013, 2:14:50 AM
    Author     : takelet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<!DOCTYPE html>
<html>
    <%--<head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/headerLogout2.jsp"/>
    </head>
    <body>
        <div class="container" style=" width: 55%; margin-top: 150px;" >
            <div class="panel panel-default">
                <div class="panel-heading"><h4 class="panel-title">Your Basic Information</h4></div>
                <table align="center" style="width: 550px">
                    <tr><td><br></td></tr>
                    <tr>
                        <td>Your Username : </td>
                        <td><input class="form-control" type="text" name="user" value="${user.username}" disabled=""</td>
                    </tr>
                    <tr>
                        <td>Your Name : </td>
                        <td><input class="form-control" type="text" name="firstname" value="${user.firstname}" disabled=""></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Your Surname : </td>
                        <td><input class="form-control" type="text" name="surname" value="${user.lastname}" disabled=""></td>
                    </tr>
                    <tr>
                        <td>Your Email :</td>
                        <td><input class="form-control" type="text" name="email" value="${user.email}" disabled=""></td>
                    </tr>
                  <!--  <tr>                    
                        <td></td>
                    <form action="choasenAdd" method="get">
                        <td><select name="showaddress" class="form form-control">
                                <option value="1">Address 1</option>
                                <option value="2">Address 2</option>
                                <option value="3">Address 3</option>
                            </select>
                            <button type="submit" class="btn btn-default">Check Address</button>
                    </form>
                    </td>       
                    </tr>-->
                    <tr>
                    <form action="ToOrder" method="get">
                        <td>Your Address :</td>
                        <td><textarea class="form-control" rows="2" name="address">${user.address}</textarea></td>       
                    </tr>
                    
                    <tr>
                        <td>Your Telephone :</td>
                        <td><input class="form-control" type="telephone" value="${user.phone}" disabled=""></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td></td>                       
                        <td><a href="ViewCart.jsp"><div class="btn btn-default">Back</div></a>
                            <button type="submit" class="btn btn-success">Confirm Information</button ></a>
                        </form>
                        </td>

                    </tr>
                    <tr><td><br></td></tr>
                </table>
            </div>
        </div>
    </body> --%>

    <%--@page contentType="text/html" pageEncoding="UTF-8" --%>
    <!DOCTYPE html>

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Social Market | Login</title>
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
                        <li class="active">Login</li>
                    </ol>
                </div>
                <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                    <div style="padding-left: 100px " ><h2>Order Information</h2><hr></div>
                        <c:forEach items="${arr}" var="entry">
                            <c:set value="${entry.value}" var="order" />
                            <c:set value="${wtf:getAccountById(entry.key)}" var="n" />
                        <table class="table table-striped" style="text-align: center">
                            <tr bgColor="#ffffff">
                                <td>Order ID</td>
                                <td>Seller</td>
                                <td>Order Date</td>
                                <td>Total Price</td>
                            </tr>
                            <tr >
                                <td>${order.orderId}</td>
                                <td>${n.dispName}</td>
                                <td>${order.time}</td>
                                <td>${order.total}</td>
                            </tr>
                        </table>
                        <!--<table class="table table-striped" style="text-align: center">
                            <tr bgColor="#ffffff">
                                <td>Seller</td>
                                <td>Pic</td>
                                <td>Name</td>
                                <td>Unit Price</td>
                                <td>Quantity</td>
                                <td>Total</td>
                            </tr>
                            <tr >
                                <td><a href="#">Sitproject</a></td>
                                <td><a href="productza.html"><img src="img/ip1.jpeg" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                                <td>
                                    <a href="">
                                        Iphone5S</a></td>
                                <td>19999</td>
                                <td>1</td>
                                <td>19999</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>TOTAL</td>
                                <td>19999</td>
                            </tr>
                        </table> -->
                        <div style="padding-left: 100px " ><h2>Payment Methond</h2><hr></div>
                        <label style="margin-left: 200px">
                            <table class="table" width="50%">
                                <tr>
                                    <td>Bank</td>
                                    <td>Siam Commercial Bank (SCB)</td>
                                </tr>
                                <tr>
                                    <td>Account No.</td>
                                    <td>999-99-999</td>
                                </tr>
                                <tr>
                                    <td>Account Name</td>
                                    <td>SIT KMUTT</td>
                                </tr>
                                <tr>
                                    <td>Brach</td>
                                    <td>Bangmod</td>
                                </tr>
                            </table>
                        </label>
                        <div style="margin-left:550px">
                            <a href="tranfer.html"><input type="button" class="btn btn-primary" value="Tranfer"></a> 
                        </div>
                    </c:forEach>
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

