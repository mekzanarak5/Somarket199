<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Home</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <jsp:include page="cssup.jsp"/>
        <style type="text/css">
            body{
                /*height: 10000px;*/
                font-family: "Lato";
                background-color: #2980b9;
                margin: 0px;
            }

            h1,h2,h3,h4{
                padding: 0px;
                margin: 0px;
            }

            .caption-style-1{
                list-style-type: none;
                margin: 0px;
                padding: 0px;

            }

            .caption-style-1 li{
                float: left;
                padding: 0px;
                position: relative;
                overflow: hidden;
            }

            .caption-style-1 li:hover .caption{
                opacity: 1;

            }


            .caption-style-1 img{
                margin: 0px;
                padding: 0px;
                float: left;
                z-index: 4;
            }


            .caption-style-1 .caption{
                cursor: pointer;
                position: absolute;
                opacity: 0;
                -webkit-transition:all 0.45s ease-in-out;
                -moz-transition:all 0.45s ease-in-out;
                -o-transition:all 0.45s ease-in-out;
                -ms-transition:all 0.45s ease-in-out;
                transition:all 0.45s ease-in-out;

            }
            .caption-style-1 .blur{
                background-color: rgba(0,0,0,0.65);
                height: 300px;
                width: 400px;
                z-index: 5;
                position: absolute;
            }

            .caption-style-1 .caption-text h1{
                text-transform: uppercase;
                font-size: 24px;
            }
            .caption-style-1 .caption-text{
                z-index: 10;
                color: #fff;
                position: absolute;
                width: 320px;
                height: 240px;
                text-align: center;
                top:100px;
            }

            /** Nav Menu */
            ul.nav-menu{
                padding: 0px;
                margin: 0px;
                list-style-type: none;
                width: 490px;
                margin: 60px auto;
            }

            ul.nav-menu li{
                display: inline;
                margin-right: 10px;
                padding:10px;
                border: 1px solid #ddd;
            }

            ul.nav-menu li a{
                color: #eee;
                text-decoration: none;
                text-transform: uppercase;
            }

            ul.nav-menu li a:hover, ul.nav-menu li a.active{
                color: #2c3e50;
            } 

            /** content **/
            .content{
                margin-top: 100px;
                margin-left: 100px;
                width: 700px;
            }
            .content h1, .content h2{
                font-family: "Source Sans Pro",sans-serif;
                color: #ecf0f1;
                padding: 0px;
                margin: 0px;
                font-weight: normal;
            }

            .content h1{
                font-weight: 900;
                font-size: 64px;
            }

            .content h2{
                font-size:26px;
            }

            .content p{
                color: #ecf0f1;
                font-family: "Lato";
                line-height: 28px;
                font-size: 15px;
                padding-top: 50px;
            }

            p.credit{
                padding-top: 20px;
                font-size: 12px;
            }

            p a{
                color: #ecf0f1;
            }

            /** fork icon**/
            .fork{
                position: absolute;
                top:0px;
                left: 0px;
            }

        </style>
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <div style="margin-bottom: -20px">
            <jsp:include page="header1.jsp"/>
        </div>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-md-9">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <form action="ShowCategoryServlet" method="get">
                            <button type="submit">
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img src="pic/ip6.jpg" alt="...">
                                        <div class="carousel-caption">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="pic/s5.jpg" alt="...">
                                        <div class="carousel-caption">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="pic/mac.jpg" alt="...">
                                        <div class="carousel-caption">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <img src="pic/n7.jpg" alt="...">
                                        <div class="carousel-caption">
                                        </div>
                                    </div>
                                </div>
                            </button>
                        </form>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>  
            </div>
            <div class="col-md-12" style="margin-top: 10px">   
                <div class="col-xs-12" style="margin-:auto;">
                    <div class="col-md-12" style=" border: 3px solid #efefef;border-radius: 15px;min-height: 230px;background: #efefef;">
                        <h5 class="col-md-12" style="color: red">Hot Items <span class="glyphicon glyphicon-fire"></span></h5>
                        <div class="col-md-offset-1 col-md-3">
                            <div>
                                <c:forEach items="${pro1}" var="a">
                                    <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" class="img-rounded" width="200px" height="200px" style="margin-bottom: 10px"></a>
                                    </c:forEach>
                            </div>
                            <h6 class="col-md-12">Computer</h6>
                        </div>
                        <div class="col-md-3">
                            <div>
                                <c:forEach items="${pro2}" var="a">
                                    <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" class="img-rounded" width="200px" height="200px" style="margin-bottom: 10px"></a>
                                    </c:forEach>
                            </div>
                            <h6 class="col-md-12">Mobile&Tablet</h6>
                        </div>
                        <div class="col-md-4">
                            <div>
                                <c:forEach items="${pro3}" var="a">
                                    <a href="ShowDetailServlet?productId=${a.productNO}&acctid=${a.acctID}"><img src="${a.pathFile}" class="img-rounded" width="200px" height="200px" style="margin-bottom: 10px"></a>
                                    </c:forEach>
                            </div>
                            <h6 class="col-md-12">Camera</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/dropdown.js"></script>
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
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script>
            $(function () {
                $('.demo.menu .item')
                        .tab('deactivate all')
                        .tab('activate tab', 'third')
                        .tab('activate navigation', 'third')
                        ;
            });
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
