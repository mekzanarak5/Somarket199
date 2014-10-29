<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
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
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="sidecat.jsp"/>
            </div>
            <div class="col-md-10">
                <%-- String url = request.getRequestURI();--%>
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb col-md-9" style="margin-right: 20px">
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">Search</li>
                    </ol>
                    </font>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
                            Sort By <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=12&s=a">New Arrival</a></li>
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=12&s=h">High Price</a></li>
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=12&s=l">Low Price</a></li>
                        </ul>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">
                            Choose Size <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=12&s=${s}">12</a></li>
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=24&s=${s}">24</a></li>
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=36&s=${s}">36</a></li>
                            <li><a href="SearchProductServlet?id=${pro}&herolist=${cat}&x=0&y=48&s=${s}">48</a></li>
                        </ul>
                    </div>
                </div>
                <center>
                    <div class="col-md-12" style="margin-left: 15px;border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF;" >
                        <div class="col-md-12" style="margin-left: 10px;border: 1px solid #ffffff ;border-radius: 15px;height: auto;width: 1010px;background: #FFFFFF">
                            <div class="row">
                                <h3 class="col-md-12">Search</h3>
                                <div class="row">
                                    <c:forEach items="${products}" var="a">
                                        <form action="AddToCart" method="get">
                                            <div class="col-md-3" style="height: 300px;font-size: 13px" >
                                                <div class="thumbnail">
                                                    <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" style="width: 170; height: 130px;" class="img-rounded"></a>                                               
                                                    <div class="caption" >
                                                        <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}">${a.name}<br>${a.price}0 ฿</a><br>                                    
                                                        <input type="hidden" name="url" />
                                                        <input type="hidden" name="productId" value="${a.productNO}" />
                                                        <input type="hidden" name="acctid" value="${a.acctID}" />
                                                        <c:choose>
                                                            <c:when test="${user.account_Id!=a.acctID || user.account_Id==null}">
                                                                <button class="btn btn-sm btn-primary" role="button ">Add to cart</button> 
                                                            </c:when>
                                                        </c:choose>
                                                        <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}" class="btn btn-sm btn-default" role="button">Detail</a>
                                                        <c:set value="${wtf:feedcount(a.username)}" var="m" />
                                                        <c:set value="${wtf:feedAVG(a.username)}" var="n" />
                                                        <br><c:choose>
                                                            <c:when test="${n>=5}">
                                                                <c:forEach begin="1" end="5">
                                                                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>(${m})
                                                                </c:forEach>    
                                                            </c:when>
                                                            <c:when test="${n>=4}">
                                                                <c:forEach begin="1" end="4">
                                                                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                                                                </c:forEach>
                                                                <c:forEach begin="1" end="1">
                                                                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>(${m})
                                                                </c:forEach>    
                                                            </c:when>
                                                            <c:when test="${n>=3}">
                                                                <c:forEach begin="1" end="3">
                                                                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                                                                </c:forEach>
                                                                <c:forEach begin="1" end="2">
                                                                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>(${m})
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:when test="${n>=2}">
                                                                <c:forEach begin="1" end="2">
                                                                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                                                                </c:forEach>
                                                                <c:forEach begin="1" end="3">
                                                                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>(${m})
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:when test="${n>=1}">
                                                                <c:forEach begin="1" end="1">
                                                                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                                                                </c:forEach>
                                                                <c:forEach begin="1" end="4">
                                                                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>(${m})
                                                                </c:forEach>
                                                            </c:when>
                                                        </c:choose>
                                                        <br><a href="ShowAccount?acctid=${a.acctID}" style="font-size: 13px">by ${a.username}</a>
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
        <!--<script src="http://vjs.zencdn.net/4.3/video.js"></script>-->
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