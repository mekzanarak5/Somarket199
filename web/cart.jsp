<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Cart</title>
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
        <div class="col-xs-9">
            <jsp:include page="header.jsp"/>
            <div class="col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Cart</li>
                </ol>
            </div>      
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 600px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-3">Cart</h3>
                        <div class="col-xs-12">
                            <table class="table table-striped" style="text-align: center">
                                <tr bgColor="#ffffff">
                                    <td>Seller</td>
                                    <td>Pic</td>
                                    <td>Name</td>
                                    <td>Unit Price</td>
                                    <td>Quantity</td>
                                    <td>Total</td>
                                    <td></td>
                                </tr>
                                <c:set var="no" value="1"/>
                                <c:forEach items="${cart.lineItems}" var="line">
                                    <c:set value="${wtf:getAccountById(line.product.acctID)}" var="n" />
                                    <tr >
                                        <td><a href="ShowAccount?acctid=${line.product.acctID}">${n.dispName}</a></td>
                                        <td><a href="ShowDetailServlet?productId=${line.product.productNO}&acctid=${line.product.acctID}"><img src="img/ip1.jpeg" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                                        <td>
                                            <a href="ShowDetailServlet?productId=${line.product.productNO}&acctid=${line.product.acctID}">
                                                ${line.product.name}</a></td>
                                        <td>${line.product.price}</td>
                                        <td><select class="form-control">
                                                <option>${line.unit}</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                            </select></td>
                                        <td>${line.total}</td>
                                        <td><a href="RemoveLineItem?productId=${line.product.productNO}"> <div class="btn btn-warning">Remove</div></a></td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td>TOTAL</td>
                                    <td>${line.total}</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button type="submit" class="btn btn-primary" id="update" >Update</button></td>
                                    <td></td>
                                </tr>
                            </table>
                            <div><h3>Payment Methond</h3><hr></div>
                            <div class="radio" style="margin-left:100px">
                                <label>
                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                    Bank Tranfer
                                </label>
                            </div>
                            <div style="margin-left:300px">
                                <a href="orderin.html"><input type="button" class="btn btn-danger" value="Check out"></a> 
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
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script>$("#update").click(function() {
                window.location.href = 'UpdateCart';
                });
        </script>
    </body>
</html>
