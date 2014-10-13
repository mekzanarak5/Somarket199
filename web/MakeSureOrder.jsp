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
        <title>Social Market | Make Sure Order</title>
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
            <div class="col-md-9">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">Make Sure Order</li>
                    </ol>
                </div>
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <c:forEach items="${arr}" var="entry">
                                <c:set value="${entry.value}" var="order" />
                                <c:set value="${wtf:getAccountById(entry.key)}" var="n" />
                                <h5 class="col-md-5">Order Information</h5> 
                                <form action="DetailOrder" method="get" > 
                                <div id="cbp-vm" class="cbp-vm-switcher">
                                    <table class="table table-striped" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                            <td>Order ID</td>
                                            <td>Seller</td>
                                            <td>Order Date</td>
                                            <td>Total Price</td>
                                        </tr>
                                        <tr>
                                            <td>${order.orderId}</td>
                                            <td>${n.username}</td>
                                            <td>${order.time}</td>
                                            <td>${order.total}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div style="margin-left:300px">
                                    <a href="DetailOrder?orderid=${order.orderId}"><input type="button" class="btn btn-warning" value="Detail" name="detail" /></a>
                                </div>
                                </form>
                            </c:forEach>
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
