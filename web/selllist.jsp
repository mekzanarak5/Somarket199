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
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li class="active" >Sell</li>
                    </ol>
                    </font>
                </div>
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <div id="cbp-vm" class="cbp-vm-switcher">
                                <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li role="presentation" class="active" style="text-align: center; font-size: 18.5px; font-style: oblique;font-weight: bold; "><a href="ShowSellServlet?id=${user.account_Id}#">Item</a>
                                        <ul class="nav nav-pills nav-justified" role="tablist">
                                            <li role="presentation" class="active" style="font-size: 12px; font-weight: normal;" ><a href="ShowSellServlet?id=${user.account_Id}" >On sale</a></li>
                                            <li role="presentation" style="font-size: 12px; font-weight: normal"><a href="ShowSoldList?username=${user.username}">Sold Out</a></li>
                                        </ul></li>
                                    <li role="presentation" style="font-size: 16px ;"><a href="SellerOrder?vi=1">
                                            <!--<button type="button" class="btn btn-default" style="font-size: 13.5px ;">
                                                <span style="color: #293a4a">Ongoing</span>-->Order
                                            <%
                                                Accounts user = (Accounts) session.getAttribute("user");
                                                if (order.findCountSell(user.getUsername()) != 0) {
                                            %>
                                            <span class="badge btn-danger"><%=order.findCountSell(user.getUsername())%> </span>
                                            <%}%>
                                            <!--</button>-->
                                        </a></li>
                                        <!--<li role="presentation" style="font-size: 16px ;"><a href="ShowSoldList?username=${user.username}">Sold List</a></li>-->
                                </ul>
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
                                            <td>฿ <fmt:formatNumber pattern ="#,###.##" value="${a.price}" /></td>
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
