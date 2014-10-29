<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="model.Accounts"%>
<%@page import="model.order"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.ProductPic"%>
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
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li class="active">Sell List</li>
                    </ol>
                    </font>
                </div>
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h6 class="col-md-3">Sell List</h6>
                            <div id="cbp-vm" class="cbp-vm-switcher">
                                <div class="btn-group btn-group-justified" style="margin-bottom: 20px">
                                    <a href="ShowSellServlet?id=${user.account_Id}"><button type="button" class="btn btn-primary">Now Sell</button></a>
                                    <a href="SellerOrder">
                                        <button type="button" class="btn btn-default">
                                            Ongoing  
                                            <%
                                                Accounts user = (Accounts) session.getAttribute("user");
                                                if (order.findCountSell(user.getUsername()) != 0) {
                                            %>
                                            <span class="badge btn-danger"><%=order.findCountSell(user.getUsername())%> </span>
                                            <%}%>
                                        </button>
                                    </a>
                                    <a href="ShowSoldList?username=${user.username}"><button type="button" class="btn btn-default">Sold List</button></a>
                                </div>
                                <table class="table table-striped" id="table6" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                        <td>Date Created</td>
                                        <td>Pic</td>
                                        <td >Name</td>
                                        <td>Price</td>
                                        <td>Manage Post</td>
                                    </tr>
                                    <c:forEach items="${sell}" var="a">
                                        <tr>
                                            <td>${a.createOn}</td>
                                            <td><a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" style="width: 100px; height: 100px;" class="img-rounded"/></a></td>
                                            <td style="max-width: 200px">
                                                <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}">
                                                    ${a.name}
                                                </a>
                                            </td>
                                            <td>${a.price}0</td>
                                            <td width="20%"><div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
                                                        Manage Post <span class="caret"></span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="ShowEditProduct?id=${a.productNO}">Edit</a></li>
                                                        <li><a href="DeleteProductServlet?id=${a.productNO}&acctid=${user.account_Id}" onclick="return confirm('Are you sure ?');">Delete</a></li>
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
