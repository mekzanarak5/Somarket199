`<%-- 
    Document   : showOldOrder
    Created on : Dec 7, 2013, 3:39:47 PM
    Author     : Sorn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="panel-heading"><h4 class="panel-title">Your Ordered</h4></div>
               
                
                
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
                        <c:forEach items="${detail.lineItems}" var="line"> 

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
                                <td style="vertical-align: middle">
                                    
                                </td>
                            <c:set var="no" value="${no+1}"/>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>
                                
                            </td>
                            <td></td>
                            <td></td>
                            <td> Total Price :</td>
                            <td><%=request.getAttribute("total")%></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                

            </div>
            <footer>
                <p>&copy; Company 2013</p>
            </footer>
        </div>

    </body>
</html>
