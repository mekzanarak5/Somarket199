<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
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
        <jsp:include page="cssup.jsp"/>
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <div style="margin-bottom: -20px">
            <jsp:include page="header1.jsp"/>
        </div>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="sidecat.jsp"/>
            </div>
            <div class="col-md-9">
                <jsp:include page="header.jsp"/>
                <%-- String url = request.getRequestURI();--%>
                <div class="col-md-12">
                    <div class="col-md-8">
                        <ol class="breadcrumb">
                            <li><a href="home.jsp">Home</a></li>
                            <li class="active">Search</li>
                        </ol>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                Sort By <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=6&s=a">New Arrival</a></li>
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=6&s=h">High Price</a></li>
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=6&s=l">Low Price</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                Choose Size <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=3&s=${s}">3</a></li>
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=6&s=${s}">6</a></li>
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=12&s=${s}">12</a></li>
                                <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=18&s=${s}">18</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <center>
                    <div class="col-md-12" style="margin:auto;border: 1px solid #ffffff ;border-radius: 15px;height: auto;width: 800px;background: #FFFFFF" >
                        <div class="col-md-12" style="margin-left: 10px;border: 1px solid #ffffff ;border-radius: 15px;height: auto;width: 750px;background: #FFFFFF">
                            <div class="row">
                                <h3 class="col-md-12">Search</h3>
                                <div class="row">
                                    <c:forEach items="${products}" var="a">
                                        <form action="AddToCart" method="get">
                                            <div class="col-md-4" style="height: 350px" >
                                                <div class="thumbnail">
                                                    <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" style="width: 190; height: 140px;" class="img-rounded"></a>                                               
                                                    <div class="caption" >
                                                        <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"<p>${a.name}</p><p>${a.price}0 ฿</p></a>                                      
                                                        <input type="hidden" name="url" />
                                                        <input type="hidden" name="productId" value="${a.productNO}" />
                                                        <input type="hidden" name="acctid" value="${a.acctID}" />
                                                        <c:choose>
                                                            <c:when test="${user.account_Id!=a.acctID || user.account_Id==null}">
                                                                <p><button class="btn btn-primary" role="button ">Add to cart</button> <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}" class="btn btn-default" role="button">Detail</a></p>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </c:forEach>
                                    <%-- out.print(url); --%>
                                </div>
                            </div>
                            <table style="width: 30%" align="center">
                                <tr>
                                    <c:choose>
                                        <c:when test="${x-y>=0}">
                                            <td style="width: 50px;height: 20px;text-align: center ">
                                                <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${x-y}&y=${y}&s=${s}">Prev</a></td> 
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
                                                <td style="width: 50px;height: 20px;text-align: center ">
                                                    ${i} 
                                                </td>
                                            </c:when>

                                            <c:otherwise>
                                                <td style="width: 50px;height: 20px;text-align: center ">
                                                    <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${y*(i-1)}&y=${y}&s=${s}">${i}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="i" value="${i+1}"/>
                                    </c:forEach>

                                    <c:choose>
                                        <c:when test="${currentPage<totalPage}">
                                            <td style="width: 50px;height: 20px;text-align: center ">
                                                <a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=${x+y}&y=${y}&s=${s}">Next</a></td> 
                                            </c:when>
                                            <c:otherwise>
                                            <td style="width: 50px;height: 20px;text-align: center;color: #02639d ">
                                                Next</td>
                                            </c:otherwise>
                                        </c:choose> 
                                </tr>
                            </table>
                        </div>
                    </div>
                </center>
            </div>
        </div>
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
        <jsp:include page="footer.jsp"/>
        <script>
            $(function() {
                $('.ui.accordion').accordion();
            });
            $(document).ready(function() {
                $('input[name=url]').val((window.location.href.toString()));
            });
        </script>

    </body>
</html>