<%-- 
    Document   : viewProduct
    Created on : Nov 20, 2013, 11:43:05 PM
    Author     : takelet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/headerLogOut2.jsp"/>
    </head>
    <body>
        <div class="container" style="padding-top: 120px;">
            <ol class="breadcrumb">
               <li><a href="product.jsp"><i class="icon-dashboard"></i>All Product</a></li>
                <li class="active"><i class="icon-file-alt"></i>Detail</li>
            </ol>
            <form method="get" action="AddToCart" accept-charset="UTF-8">
                <input type="hidden" name="id" value="${p.id_product}">

                <div class="row " >
                    <legend>${p.name_product}</legend>                  
                    <div class="col-md-4" >
                        <img class="img-thumbnail img-responsive" src="${p.imgPath}" width="255px" height="374px;">                    
                    </div>
                    <div class="col-md-8">
                        <div class="table-responsive">
                            <table class="table ">
                                <colgroup>
                                    <col class="col-xs-1">
                                    <col class="col-xs-7">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <code>Product Name</code>
                                        </td>
                                        <td><h3>${p.name_product} </h3></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Color</code>
                                        </td>
                                        <td><h4>${p.color}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Composition</code>
                                        </td>
                                        <td><h4>${p.composition}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Fabric</code>
                                        </td>
                                        <td><h4>${p.fabric}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Fit Description</code>
                                        </td>
                                        <td><h4>${p.fitDescription}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Weight</code>
                                        </td>
                                        <td><h4>${p.weight}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Price</code>
                                        </td>
                                        <td><h4>${p.price}</h4></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <code>Size</code>
                                        </td>
                                        <td><h4><select name="size">
                                                    <c:forEach items="${p.listSize}" var="s"> 
                                                        <option  value="${s}">${s}</option>
                                                    </c:forEach>   
                                                </select></h4></td>
                                    </tr>

                                
                                </tbody>
                            </table>

                            <p><button type="submit" class="btn btn-info">Add to cart</button></p>
                        </div>
                    </div>   
                </div>   




        </div>  
    </body>
</html>
