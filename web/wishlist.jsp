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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li class="active">Wish List</li>
                </ol>
                </font>
            </div>      
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                    <div class="row">
                        <h5 class="col-md-12">Wish List</h5>
                        <form action="DeleteWishlistServlet" method="get">
                            <div class="col-md-12">
                                <table class="table table-striped" id="table6" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                    <input type="hidden" name="acctid" value="${user.account_Id}">
                                    <td>Product Name</td>
                                    <td>Price</td>
                                    <td>Seller</td>
                                    <td><button type="submit" class="btn btn-xs btn-info" onclick="return confirm('Are you sure ?');"><img src="pic/bin.png" width="18px" height="18px" ></button></td>
                                    </tr>
                                    <c:forEach items="${wish}" var="a">
                                        <tr>
                                            <td><a href="ShowDetailServlet?productId=${a.productId}&acctid=${a.acct}">${a.name}</a></td>
                                            <td>${a.price}</td>
                                            <td>${a.seller}</td>
                                            <td>
                                            <input type="checkbox" name="wishid" value="${a.wish_Id}">
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
