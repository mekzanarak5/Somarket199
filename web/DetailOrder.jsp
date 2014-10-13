<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.ProductPic"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Order Detail</title>
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
                <jsp:include page="logo_1_1.jsp"/>
            </div>
            <div class="col-md-9">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="">Buy List</a></li>
                        <li class="active">Order Detail</li>
                    </ol>
                </div>
            </div>
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                    <div class="row">
                        <h5 class="col-md-12 panel panel-heading">Order Detail</h5>
                        <div class="panel panel-default col-md-11" style="margin-left: 45px ">
                            <h6 class="panel-heading">Item Detail</h6>
                            <table class="table table-striped" style="text-align: center">
                                <tr>
                                    <td>Seller</td>
                                    <td>Pic</td>
                                    <td>Name</td>
                                    <td>Unit Price</td>
                                    <td>Quantity</td>
                                    <td>Total</td>
                                </tr>
                                <tr>
                                    <td><a href="#">วน</a></td>
                                    <td><a href=""><img src="img/ip1.jpeg" style="width: 70px; height: 70px;" class="img-rounded"/></a></td>
                                    <td>
                                        <a href="">
                                            วน</a></td>
                                    <td>วน</td>
                                    <td>วน</td>
                                    <td>วน</td>
                                </tr>
                            </table>
                        </div>
                        <div class="panel panel-default col-md-11" style="margin-left: 45px ">
                            <h6 class="col-md-12 panel-heading">Payment Information</h6>
                            <div class="col-md-4">
                                <table class="table table-bordered" style="text-align: center">
                                    <tr>
                                        <td style="background: #ededed">Bank Name</td>
                                        <td>วน</td>
                                    </tr>
                                    <tr>
                                        <td style="background: #ededed">Bank Account No.</td>
                                        <td>วน</td>
                                    </tr>
                                    <tr>
                                        <td style="background: #ededed">Bank Account Name</td>
                                        <td>วน</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div align="center">
                        <a href="tranfer.jsp"><input type="button" class="btn btn-warning" value="Transfer Order"></a> 
                    </div>
                </div>
            </div>
        </div>
        <!--</div>-->
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
