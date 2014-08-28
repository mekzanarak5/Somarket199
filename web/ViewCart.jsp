<%-- 
    Document   : ViewCart
    Created on : Nov 20, 2013, 12:49:33 AM
    Author     : Sorn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/headerLogout2.jsp"/>
    </head>
    <body>
        <div class="container" style="padding-top: 150px;">
            <div class="panel panel-default" >
                <div class="panel-heading"><h4 class="panel-title">Your Cart</h4></div>
                <%if (request.getAttribute("msg2") != null) {%>
                <h1><%=request.getAttribute("msg2")%></h1>
                <%}%>
                <form action="updateCart" method="get">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th></th>
                                <th>Name</th>
                                <th>Unit</th>
                                <th>Price</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="no" value="1"/>
                            <c:forEach items="${cart.lineItems}" var="line">
                            <tr>
                                <td style="vertical-align: middle">
                                    ${no}
                                </td>
                                <td>
                                    <img src="${line.product.productImg}" width="70" height="100">
                                </td>
                                <td style="vertical-align: middle">
                                    ${line.product.productName}       
                                </td >
                                <td style="vertical-align: middle">
                                    <input type="hidden" value="${line.product.productId}" name="productId" >
                    <input style="text-align:right" type="number" name="unit" size='4' value="${line.unit}" required>
                                </td>
                                <td style="vertical-align: middle">
                                    <fmt:formatNumber pattern ="#,###.##" value="${line.product.productCost}" />
                                </td>
                                <td style="vertical-align: middle">
                                    <fmt:formatNumber pattern="#,###.##" value="${line.total}" />
                                </td>
                                <%--<td style="vertical-align: middle">
                                    &nbsp;&nbsp;&nbsp; <input type="text" name="units" style="width: 30px; margin-bottom: 20px;" value="${line.unit}">
                                </td>--%>
                                <td style="vertical-align: middle">
                                    <a href="RemoveLineItem?productId=${line.product.productId}"> <div class="btn btn-warning">Remove</div></a>
                                </td>
                                <c:set var="no" value="${no+1}"/>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                Total Price : ${cart.total}
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><button type="submit" class="btn btn-primary">Update</button></td>
                            <td><a href="ConfirmCart"><div  class="btn btn-success">Buy</div></a></td>
                        </tr>
                        </tbody>
                    </table>
                </form>

            </div>
        </div>
    </body>
</html>
