
<%@page import="model.Product"%>
<%@page import="model.Accounts"%>
<%@page import="model.Wishlist"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Product</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".mCustomScrollbar").mCustomScrollbar({axis: "x"});
            });
        </script>

        <style type="text/css">
            h4 {
                margin: 20px 10px 10px;
            }
            p {
                margin: 10px;
            }

            #carousel-example-generic {
                margin: 20px auto;
                width: 400px;
            }

            #carousel-custom {
                margin: 20px auto;
                width: 400px;
            }
            #carousel-custom .carousel-indicators {
                margin: 10px 0 0;
                overflow: auto;
                position: static;
                text-align: left;
                white-space: nowrap;
                width: 100%;
            }
            #carousel-custom .carousel-indicators li {
                background-color: transparent;
                -webkit-border-radius: 0;
                border-radius: 0;
                display: inline-block;
                height: auto;
                margin: 0 !important;
                width: auto;
            }
            #carousel-custom .carousel-indicators li img {
                display: block;
                opacity: 0.5;
            }
            #carousel-custom .carousel-indicators li.active img {
                opacity: 1;
            }
            #carousel-custom .carousel-indicators li:hover img {
                opacity: 0.75;
            }
            #carousel-custom .carousel-outer {
                position: relative;
            }
        </style>
        <%
            Accounts user = (Accounts) session.getAttribute("user");
            Product p = (Product) request.getAttribute("showDetail");
        %>
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <form action="AddToCart" class="form-horizontal" role="form">
                    <div class="col-md-12">
                        <font size="2">
                        <ol class="breadcrumb">
                            <li><a href="home.jsp">Home</a></li>
                            <li><a href="SearchProductServlet?id=&herolist=&x=0&y=6&s=a">Product</a></li>
                            <li><a href="SearchProductServlet?id=&herolist=${showDetail.cateID}&x=0&y=6&s=a">${showDetail.cateName}</a></li>
                            <li class="active">${showDetail.name}</li>
                        </ol>
                        </font>
                    </div> 
                        <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="col-md-5" style="margin-bottom: -40px">
                            <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
                                <div class='carousel-outer'>
                                    <!-- Wrapper for slides -->
                                    <div class='carousel-inner'>
                                        <div class='item active'>
                                            <img src='${pic1.pathFile}' alt='' height="260px" width="400"/>
                                        </div>
                                        <c:forEach items="${picsum}" var="a">
                                            <div class='item'>
                                                <img src='${a.pathFile}' alt='' height="260px" width="400"/>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                                        <span class='glyphicon glyphicon-chevron-left'></span>
                                    </a>
                                    <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                                        <span class='glyphicon glyphicon-chevron-right'></span>
                                    </a>
                                </div>
                                <ol class='carousel-indicators mCustomScrollbar'>
                                    <c:set value="0" var="no" />
                                    <c:forEach items="${pic}" var="a">
                                        <li data-target='#carousel-custom' data-slide-to='${no}'>
                                            <img src='${a.pathFile}' alt='' width="150" height="100"/>
                                        </li>
                                        <c:set value="${no+1}" var="no" />
                                    </c:forEach>
                                </ol>
                            </div>      
                        </div>
                        <div class="col-md-7">
                            <h5>${showDetail.name}</h5><hr>
                            <div class="col-md-7">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5><div style="color: red">฿ ${showDetail.price}</div></h5>
                                    </div>
                                    <div class="panel-body">

                                        <div class="col-md-12" style="margin: auto;float: none">
                                            <c:choose><c:when test="${user.account_Id!=showName.account_Id || user==null}" >
                                                    <font size="2">
                                                    <div class="input-group input-group-sm" style="margin-bottom: 15px">
                                                        <span class="input-group-addon">Quatity</span>
                                                        <input type="number" class="form-control" placeholder="Quatity" value="1" required>
                                                    </div>
                                                    </font>
                                                    <input type="hidden" name="url" />
                                                    <input type="hidden" name="productId" value="${showDetail.productNO}" />
                                                    <input type="hidden" name="acctid" value="${showName.account_Id}" />
                                                    <input type="hidden" name="name" value="${showDetail.name}" />
                                                    <input type="hidden" name="des" value="${showDetail.description}" />
                                                    <button type="submit" class="btn btn-primary btn-sm btn-block" style="background-color: " >Add To Cart <span class="glyphicon glyphicon-shopping-cart"></button>
                                                </c:when></c:choose>
                                            </div>
                                        <c:choose>
                                            <c:when test="${user.account_Id!=showName.account_Id || user==null}" >
                                                <div align="center">
                                                    <%
                                                        if (Wishlist.findCountWish(user.getAccount_Id(), p.getProductNO()) == 0){
                                                    %>
                                                    <a href="AddWishList?acctid=${user.account_Id}&name=${showDetail.name}&price=${showDetail.price}&seller=${showName.username}&id=${showDetail.productNO}&accid=${showName.account_Id}"><button type="button" class="btn btn-xs btn-warning" style="margin-top: 15px">WishList<span class="fui-heart"></button>
                                                    </a>
                                                    <%}else{%>
                                                    <a href="DeleteWishlistProductza?proid=${showDetail.productNO}&acctid=${user.account_Id}&acct=${showName.account_Id}"><button type="button" class="btn btn-xs btn-warning" style="margin-top: 15px">Delete Wishlist <span class="fui-cross"></button>
                                                    </a>
                                                    <%}%>
                                                    <a href="AdminGetProId?proid=${showDetail.productNO}"><button type="button" class="btn btn-xs btn-danger" style="margin-top: 15px">Report</button>
                                                    </a>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <div class="fb-share-button" data-href="<%=request.getRequestURI()%>"></div> 
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-5">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Seller Information
                                    </div>
                                    <div class="panel-body">
                                        <a href="ShowAccount?acctid=${showName.account_Id}" >${showName.username} ( 999<span class="glyphicon glyphicon-star"></span> )</a>
                                        <font size="2">
                                        <br>Phone No. ${showName.phone}
                                        <a href="GetReceiverServlet?acctid=${showName.account_Id}" class="list-group-item">Send Private Message</a>
                                        </font>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <div class="col-md-9" style="margin-top: 30px">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Description</h3>
                                </div>
                                <div class="panel-body">
                                    ${showDetail.description}
                                </div>
                            </div>
                        </div>
                    </div>                              
</div>
                </form>
            </div>
        </div>
        <script language="JavaScript">
            function ChangeImage(image) {
                document.Image.src = image;
            }
        </script> 

        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/jquery-1.8.3.min.js"></script>
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
        <div id="fb-root"></div>
        <script>
            $(function() {
                //$('.ui.accordion').accordion();
                $('input[name=url]').val((window.location.href.toString()));
            });

        </script>
        <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <jsp:include page="footer.jsp"/>

    </body>
</html>
