<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Search</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="bootstrap/css/accordion.css" rel="stylesheet">
        <link href="bootstrap/css/semantic.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="css/flat-ui.css" rel="stylesheet">
        <link href="css/demo.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/favicon.ico">
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="sidecat.jsp"/>
        </div>
        <div class="col-xs-9">
            <jsp:include page="header.jsp"/>
            <% String url = request.getRequestURI();%>
            <div class="col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Search</li>
                </ol>
                 <form action="SearchProductServlet" method="get" style="text-align: right">
                    <input type="hidden" name="id" value="${pro}">
                    <input type="hidden" name="herolist" value="${cat}">
                    <input type="hidden" name="x" value="${x}">
                    <select name="y">
                        <option value="3" ${y==3?"selected":""}>3</option>
                        <option value="5" ${y==5?"selected":""}>5</option>
                        <option value="10" ${y==10?"selected":""}>10</option>
                        <option value="15" ${y==15?"selected":""}>15</option>
                    </select>
                    <input type="submit" value="Go" >
                </form>
            </div>      
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 900px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">Search</h3>
                        <div class="row">
                            <c:forEach items="${productNO}" var="a">
                            <form action="AddToCart" method="get"> 
                                <div class="col-sm-4">
                                    <div class="thumbnail">
                                        <img data-src="holder.js/300x300" alt="...">
                                        <div class="caption">
                                            <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"<p>${a.name}</p></a>
                                            <input type="hidden" name="url" />
                                            <input type="hidden" name="productId" value="${a.productNO}" />
                                            <input type="hidden" name="acctid" value="${a.acctID}" />
                                            
                                            <p><button class="btn btn-primary" role="button">Add to cart</button> <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}" class="btn btn-default" role="button">Detail</a></p>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            </c:forEach>
                            <%-- out.print(url); --%>
                        </div>
                    </div>
                </div>
            </div>
           <table style="width: 30%" align="center">
                <tr>
                    <c:choose>
                        <c:when test="${x-y>=0}">
                            <td style="width: 50px;height: 20px;text-align: center ">
                                <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${x-y}&y=${y}">Prev</a></td> 
                            </c:when>
                            <c:otherwise>
                            <td style="width: 50px;height: 20px;text-align: center;color: #02639d ">
                                Prev</td> 
                            </c:otherwise>
                        </c:choose>

                    <c:set var="i" value="1"/>
                    <c:forEach begin="1" end="${totalPage}">
                        <c:choose>
                            <c:when test="${y*(i-1)==x}">
                                <td style="background-color: #02639d;width: 50px;height: 20px;text-align: center ">
                                    ${i} 
                                </td>
                            </c:when>

                            <c:otherwise>
                                <td style="width: 50px;height: 20px;text-align: center ">
                                    <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${y*(i-1)}&y=${y}">${i}</a>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <c:set var="i" value="${i+1}"/>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${currentPage<totalPage}">
                            <td style="width: 50px;height: 20px;text-align: center ">
                                <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${x+y}&y=${y}">Next</a></td> 
                            </c:when>
                            <c:otherwise>
                            <td style="width: 50px;height: 20px;text-align: center;color: #02639d ">
                                Next</td> 
                            </c:otherwise>
                        </c:choose> 
                </tr>
            </table>
        </div>
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/accordion.js"></script>
        <script src="js/semantic.js"></script>
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

        <script>
            $(function() {
                $('.ui.accordion').accordion();
            });
            $(document).ready(function(){
               $('input[name=url]').val((window.location.href.toString())); 
            });
        </script>
    </body>
</html>
