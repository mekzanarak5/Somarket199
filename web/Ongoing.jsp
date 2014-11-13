<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="model.order"%>
<%@page import="model.Accounts"%>
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
        <title>Social Market | Ongoing</title>
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
                        <li class="active">Sell</li>
                    </ol>
                    </font>
                </div>
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <div id="cbp-vm" class="cbp-vm-switcher">
                                <!--<div class="btn-group btn-group-justified" style="margin-bottom: 20px">-->
                                <ul class="nav nav-tabs nav-justified" role="tablist">
                                    <li role="presentation" style="font-size: 16px; "><a href="ShowSellServlet?id=${user.account_Id}#">Item</a>
                                    </li>
                                    <li role="presentation" class="active" style="text-align: center; font-size: 18.5px ; font-style: oblique;font-weight: bold;">
                                        <a href="SellerOrder?vi=1#">
                                            <!--<button type="button" class="btn btn-default" style="font-size: 13.5px ;">
                                                <span style="color: #293a4a">Ongoing</span>-->Order
                                            <%
                                                Accounts user = (Accounts) session.getAttribute("user");
                                            %>
                                            <!--</button>-->
                                        </a><ul class="nav nav-pills nav-justified" role="tablist">
                                            <li role="presentation" class="${views==1?'active':''}"  style="font-size: 13px; font-weight: normal;" ><a href="SellerOrder?vi=1" >All Selling</a></li>
                                            <li role="presentation" class="${views==2?'active':''}" style="font-size: 13px; font-weight: normal"><a href="SellerOrder?vi=2">Purchased
                                                    <% if (order.findCountSell(user.getUsername()) != 0) {%>
                                                    <span class="badge btn-danger"><%=order.findCountSell(user.getUsername())%> </span>
                                                    <%}%></a></li>
                                            <li role="presentation" class="${views==3?'active':''}" style="font-size: 13px; font-weight: normal"><a href="SellerOrder?vi=3">Shipping labels</a></li>
                                            <li role="presentation" class="${views==4?'active':''}" style="font-size: 13px; font-weight: normal"><a href="SellerOrder?vi=4">Cancels/ Returns</a></li>
                                        </ul></li>
                                    <!--<li role="presentation" style="font-size: 16px ;"><a href="ShowSoldList?username=${user.username}">Sold List</a></li>-->
                                </ul>
                                <!--/div>-->
                                <c:choose><c:when test="${views==2}">
                                        <table class="table table-striped" id="table6" style="text-align: center">
                                            <tr bgColor="#ffffff">
                                                <td width="20%">Order ID
                                                    <!--                                                    <br>
                                                                                                        <input type="submit" class="btn btn-xs btn-default" style="background-color: #16A085" value="Paid"/>
                                                                                                        <input type="submit" class="btn btn-xs btn-danger" value="Invalid"/>
                                                                                                        <input type="submit" class="btn btn-xs btn-default" value="Return"/>-->
                                                </td>
                                                <td width="20%">Order Date</td>
                                                <td>Total Price</td>
                                                <td>Status</td>
                                                <td width="7%"></td>
                                            </tr>
                                            <c:forEach items="${oldorders}" var="a">
                                                <c:choose><c:when test="${a.status=='Verifying... ' || a.status=='Paid'}">
                                                        <tr>
                                                            <td><input type="checkbox" name="pmid" value="">&nbsp;&nbsp;${a.orderId}</td>
                                                            <td><a href="#"></a>${a.time}</td>
                                                            <td>${a.total}0</td>
                                                            <c:choose>
                                                                <c:when test="${a.status != 'shipping' && a.status != 'Waiting for payment.'}">
                                                                    <td><div style="color: red">${a.status}</div>${a.payment}</td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <td>${a.status}</td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td><a href="DetailOrder?orderid=${a.orderId}" target="_blank"><input type="button" class="btn btn-xs btn-warning" value="Detail" name="detail" /></a></td>
                                                        </tr>
                                                    </c:when></c:choose>
                                            </c:forEach>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <input type="submit" class="btn btn-default" style="background-color: #16A085" value="Paid"/>
                                                    </td>
                                                    <td><input type="submit" class="btn btn-danger" value="Invalid"/></td>
                                                    <td><input type="submit" class="btn btn-default" value="Return"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </table></c:when>

                                    <c:when test="${views==3}">
                                        <table class="table table-striped" id="table6" style="text-align: center">
                                            <tr bgColor="#ffffff">
                                                <td width="20%">Order ID</td>
                                                <td width="20%">Order Date</td>
                                                <td>Total Price</td>
                                                <td>Status</td>
                                                <td width="7%"></td>
                                            </tr>
                                            <c:forEach items="${oldorders}" var="a">
                                                <c:choose><c:when test="${a.status=='shipping' || a.status=='complete'}">
                                                        <tr>
                                                            <td>${a.orderId}</td>
                                                            <td><a href="#"></a>${a.time}</td>
                                                            <td>${a.total}0</td>
                                                            <c:choose>
                                                                <c:when test="${a.status != 'shipping' && a.status != 'Waiting for payment.'}">
                                                                    <td><a href="DetailOrder?orderid=${a.orderId}" style="color: red">${a.status}</a></td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <td>${a.status}<div style="color: red">${a.ems}</div></td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <td><a href="DetailOrder?orderid=${a.orderId}" target="_blank"><input type="button" class="btn btn-xs btn-warning" value="Detail" name="detail" /></a></td>
                                                        </tr>
                                                    </c:when></c:choose>
                                            </c:forEach>
                                        </table></c:when>

                                    <c:when test="${views==4}">
                                        <table class="table table-striped" id="table6" style="text-align: center">
                                            <tr bgColor="#ffffff">
                                                <td width="20%">Order ID</td>
                                                <td width="20%">Order Date</td>
                                                <td>Total Price</td>
                                                <td>Status</td>
                                            </tr>
                                            <c:forEach items="${oldorders}" var="a">
                                                <c:choose><c:when test="${a.status=='cancels' || a.status=='returns'}">
                                                        <tr>
                                                            <td><a href="DetailOrder?orderid=${a.orderId}">${a.orderId}</a></td>
                                                            <td><a href="#"></a>${a.time}</td>
                                                            <td>${a.total}0</td>
                                                            <c:choose>
                                                                <c:when test="${a.status != 'shipping' && a.status != 'Waiting for payment.'}">
                                                                    <td><a href="DetailOrder?orderid=${a.orderId}" style="color: red">${a.status}</a></td>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <td><a href="DetailOrder?orderid=${a.orderId}">${a.status}</a></td>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                        </tr>
                                                    </c:when></c:choose>
                                            </c:forEach>
                                        </table></c:when>

                                    <c:otherwise>
                                        <table class="table table-striped" id="table6" style="text-align: center">
                                            <tr bgColor="#ffffff">
                                                <td width="20%">Order ID</td>
                                                <td width="20%">Order Date</td>
                                                <td>Total Price</td>
                                                <td>Status</td>
                                            </tr>
                                            <c:forEach items="${oldorders}" var="a">
                                                <tr>
                                                    <td><a href="DetailOrder?orderid=${a.orderId}">${a.orderId}</a></td>
                                                    <td><a href="#"></a>${a.time}</td>
                                                    <td>${a.total}0</td>
                                                    <c:choose>
                                                        <c:when test="${a.status != 'shipping' && a.status != 'Waiting for payment.'}">
                                                            <td><a href="DetailOrder?orderid=${a.orderId}" style="color: red">${a.status}</a></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <td><a href="DetailOrder?orderid=${a.orderId}">${a.status}</a></td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                </tr>
                                            </c:forEach>
                                        </table></c:otherwise>
                                </c:choose>
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
