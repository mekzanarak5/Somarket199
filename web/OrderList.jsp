<%-- 
    Document   : OrderList
    Created on : Nov 11, 2013, 7:22:43 PM
    Author     : Sorn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                <div class="panel-heading"><h4 class="panel-title">Your Orders</h4></div>


                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Slip Id</th>
                            <th>Order Status</th>
                            <th>Order Price</th>
                            <th>Order EMS_ID</th>
                            <th>ViewDetail</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="no" value="1"/>
                        <c:forEach items="${arr}" var="order">

                            <tr>
                                <td style="vertical-align: middle">
                                    ${no}
                                </td>
                                <td style="vertical-align: middle">                            
                                    ${order.orderId}
                                </td>
                                <td>
                                    ${order.time}        
                                </td>
                                <td style="vertical-align: middle">
                                     <form action="AddSlip" method="post">
                                         <div class="input-group" style="width: 220px"   >
                                        <input type="hidden" class="form-control" value="${order.orderId}" name="order_id">
                                        <input type="text" class="form-control" value=" ${order.slip}" name="slip" ${order.status=='Paid'?'disabled':''} >
                                        <span class="input-group-btn" >
                                            <button class="btn btn-default" type="submit"  ${order.status=='Paid'?'disabled':''}>Save</button>
                                        </span>
                                   
                                    </div>
                                     </form>
                                </td>
                                <td style="vertical-align: middle">
                                    
                                    ${order.status}
                                </td>
                                <td style="vertical-align: middle">
                                    
                                    ${order.total}
                                </td>
                                <td style="vertical-align: middle">
                                    ${order.ems}
                                </td>
                                <td>
                                    <%--<input type="hidden" name="orderid" value="${order.order_ID}">--%>
                                    <a href="DetailOrder?orderid=${order.orderId}&total=${order.total}"><button type="button" class="btn btn-success">View Detail</button></a>
                                </td>
                            </tr>
                            <c:set var="no" value="${no+1}"/>    

                        </c:forEach>  
                    </tbody>
                </table>
                

            </div>
        </div>
    </body>
</html>