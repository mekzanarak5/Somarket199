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
        <jsp:include page="header1.jsp"/>
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
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="pic/Showhome1.jpg" width="400px" height="300px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Showhome2.jpg" width="400px" height="300px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Showhome3.jpg" width="400px" height="300px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Showhome4.jpg" width="400px" height="300px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                        </div>

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
            <div class="col-md-12" style="margin:20px;" >
                <div class="container-a1">
                    <ul class="caption-style-1" >
                        <li>
                            <img src="pic/com1.png" class="img-rounded" alt="">
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h1>Computer</h1>
                                </div>
                            </div>
                        </li>
                        <li>
                            <img src="pic/mob1.png" class="img-rounded" alt="">
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h1>Mobile</h1>
                                </div>
                            </div>
                        </li>
                        <li>
                            <img src="pic/cam1.png" class="img-rounded" alt="">
                            <div class="caption">
                                <div class="blur"></div>
                                <div class="caption-text">
                                    <h1>Camera</h1>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="col-md-12">   
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff;border-radius: 15px;min-height: 230px;background: #ffffff">
                        <div class="row">
                            <h3 class="col-md-12">Hot Items of Smartphone</h3>
                            <div class="col-xs-12">
                                <hr>
                            </div>
                            <div>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12" style="padding-top: 20px">
                    <div class="col-md-12" style=" border: 1px solid #ffffff;border-radius: 15px;min-height: 230px;background: #ffffff">
                        <div class="row">
                            <h3 class="col-md-12">Hot Items of Tablet</h3>
                            <div class="col-xs-12">
                                <hr>
                            </div>
                            <div>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                                <a href="#"><img src='pic/iphone.png' width="200px" height="200px"></a>
                            </div>
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
            $(function() {
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
