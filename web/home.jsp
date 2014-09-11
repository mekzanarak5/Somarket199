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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="bootstrap/css/jasny-bootstrap.min.css"/>
        <link href="bootstrap/css/semantic.css" rel="stylesheet">
        <link href="bootstrap/css/dropdown.css" rel="stylesheet">
        <!-- Loading Flat UI -->
        <link href="css/flat-ui.css" rel="stylesheet">
        <link href="css/demo.css" rel="stylesheet">
        <link href="css/cat.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/favicon.ico">
        <script type="text/javascript" src="js1/jquery-2.1.0.min.js"></script>
        <script type="text/javascript" src="js1/jssor.core.js"></script>
        <script type="text/javascript" src="js1/jssor.utils.js"></script>
        <script type="text/javascript" src="js1/jssor.slider.js"></script>
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="row">
            <div class="col-md-3">
                <jsp:include page="logo.jsp"/>
                <div id='cssmenu'>
                    <c:forEach items="${cateID}" var="a">
                        <ul>
                            <li class='active has-sub'><a href='#'><span>${a.cateName}</span></a>
                                <ul>
                                    <c:forEach items="${cateID1}" var="b">
                                        <li class='has-sub'><a href='#'><span>${b.cateName}</span></a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-9">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <style> 
                        .captionOrange, .captionBlack
                        {
                            color: #fff;
                            font-size: 20px;
                            line-height: 30px;
                            text-align: center;
                            border-radius: 4px;
                        }
                        .captionOrange
                        {
                            background: #EB5100;
                            background-color: rgba(235, 81, 0, 0.6);
                        }
                        .captionBlack
                        {
                            font-size:16px;
                            background: #000;
                            background-color: rgba(0, 0, 0, 0.4);
                        }
                        a.captionOrange, A.captionOrange:active, A.captionOrange:visited
                        {
                            color: #ffffff;
                            text-decoration: none;
                        }
                        a.captionOrange:hover
                        {
                            color: #eb5100;
                            text-decoration: underline;
                            background-color: #eeeeee;
                            background-color: rgba(238, 238, 238, 0.7);
                        }
                        .bricon
                        {
                            background: url(img/browser-icons.png);
                        }
                    </style>

                    <script>
                        jQuery(document).ready(function($) {
                            //Reference http://www.jssor.com/development/slider-with-slideshow-jquery.html
                            //Reference http://www.jssor.com/development/tool-slideshow-transition-viewer.html

                            var _SlideshowTransitions = [
                                //Swing Outside in Stairs
                                {$Duration: 1200, $Delay: 20, $Cols: 8, $Rows: 4, $Clip: 15, $During: {$Left: [0.3, 0.7], $Top: [0.3, 0.7]}, $FlyDirection: 9, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 260, $Easing: {$Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad}, $ScaleHorizontal: 0.2, $ScaleVertical: 0.1, $Outside: true, $Round: {$Left: 1.3, $Top: 2.5}}

                                //Dodge Dance Outside out Stairs
                                , {$Duration: 1500, $Delay: 20, $Cols: 8, $Rows: 4, $Clip: 15, $During: {$Left: [0.1, 0.9], $Top: [0.1, 0.9]}, $SlideOut: true, $FlyDirection: 9, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 260, $Easing: {$Left: $JssorEasing$.$EaseInJump, $Top: $JssorEasing$.$EaseInJump, $Clip: $JssorEasing$.$EaseOutQuad}, $ScaleHorizontal: 0.3, $ScaleVertical: 0.3, $Outside: true, $Round: {$Left: 0.8, $Top: 2.5}}

                                //Dodge Pet Outside in Stairs
                                , {$Duration: 1500, $Delay: 20, $Cols: 8, $Rows: 4, $Clip: 15, $During: {$Left: [0.3, 0.7], $Top: [0.3, 0.7]}, $FlyDirection: 9, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 260, $Easing: {$Left: $JssorEasing$.$EaseInWave, $Top: $JssorEasing$.$EaseInWave, $Clip: $JssorEasing$.$EaseOutQuad}, $ScaleHorizontal: 0.2, $ScaleVertical: 0.1, $Outside: true, $Round: {$Left: 0.8, $Top: 2.5}}

                                //Dodge Dance Outside in Random
                                , {$Duration: 1500, $Delay: 20, $Cols: 8, $Rows: 4, $Clip: 15, $During: {$Left: [0.3, 0.7], $Top: [0.3, 0.7]}, $FlyDirection: 9, $Easing: {$Left: $JssorEasing$.$EaseInJump, $Top: $JssorEasing$.$EaseInJump, $Clip: $JssorEasing$.$EaseOutQuad}, $ScaleHorizontal: 0.3, $ScaleVertical: 0.3, $Outside: true, $Round: {$Left: 0.8, $Top: 2.5}}

                                //Flutter out Wind
                                , {$Duration: 1800, $Delay: 30, $Cols: 10, $Rows: 5, $Clip: 15, $During: {$Left: [0.3, 0.7], $Top: [0.3, 0.7]}, $SlideOut: true, $FlyDirection: 5, $Reverse: true, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 2050, $Easing: {$Left: $JssorEasing$.$EaseInOutSine, $Top: $JssorEasing$.$EaseOutWave, $Clip: $JssorEasing$.$EaseInOutQuad}, $ScaleHorizontal: 1, $ScaleVertical: 0.2, $Outside: true, $Round: {$Top: 1.3}}

                                //Collapse Stairs
                                , {$Duration: 1200, $Delay: 30, $Cols: 8, $Rows: 4, $Clip: 15, $SlideOut: true, $Formation: $JssorSlideshowFormations$.$FormationStraightStairs, $Assembly: 2049, $Easing: $JssorEasing$.$EaseOutQuad}

                                //Collapse Random
                                , {$Duration: 1000, $Delay: 80, $Cols: 8, $Rows: 4, $Clip: 15, $SlideOut: true, $Easing: $JssorEasing$.$EaseOutQuad}

                                //Vertical Chess Stripe
                                , {$Duration: 1000, $Cols: 12, $FlyDirection: 8, $Formation: $JssorSlideshowFormations$.$FormationStraight, $ChessMode: {$Column: 12}}

                                //Extrude out Stripe
                                , {$Duration: 1000, $Delay: 40, $Cols: 12, $SlideOut: true, $FlyDirection: 2, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Assembly: 260, $Easing: {$Left: $JssorEasing$.$EaseInOutExpo, $Opacity: $JssorEasing$.$EaseInOutQuad}, $ScaleHorizontal: 0.2, $Opacity: 2, $Outside: true, $Round: {$Top: 0.5}}

                                //Dominoes Stripe
                                , {$Duration: 2000, $Delay: 60, $Cols: 15, $SlideOut: true, $FlyDirection: 8, $Formation: $JssorSlideshowFormations$.$FormationStraight, $Easing: $JssorEasing$.$EaseOutJump, $Round: {$Top: 1.5}}
                            ];

                            var options = {
                                $AutoPlay: true, //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                                $AutoPlaySteps: 1, //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                                $AutoPlayInterval: 4000, //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                                $PauseOnHover: 1, //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, default value is 1

                                $ArrowKeyNavigation: true, //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                                $SlideDuration: 500, //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                                $MinDragOffsetToSlide: 20, //[Optional] Minimum drag offset to trigger slide , default value is 20
                                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                                $SlideSpacing: 0, //[Optional] Space between each slide in pixels, default value is 0
                                $DisplayPieces: 1, //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                                $ParkingPosition: 0, //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                                $UISearchMode: 1, //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                                $PlayOrientation: 1, //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                                $DragOrientation: 3, //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                                $SlideshowOptions: {//[Optional] Options to specify and enable slideshow or not
                                    $Class: $JssorSlideshowRunner$, //[Required] Class to create instance of slideshow
                                    $Transitions: _SlideshowTransitions, //[Required] An array of slideshow transitions to play slideshow
                                    $TransitionsOrder: 1, //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                                },
                                $BulletNavigatorOptions: {//[Optional] Options to specify and enable navigator or not
                                    $Class: $JssorBulletNavigator$, //[Required] Class to create navigator instance
                                    $ChanceToShow: 2, //[Required] 0 Never, 1 Mouse Over, 2 Always
                                    $AutoCenter: 0, //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                                    $Steps: 1, //[Optional] Steps to go for each navigation request, default value is 1
                                    $Lanes: 1, //[Optional] Specify lanes to arrange items, default value is 1
                                    $SpacingX: 10, //[Optional] Horizontal space between each item in pixel, default value is 0
                                    $SpacingY: 10, //[Optional] Vertical space between each item in pixel, default value is 0
                                    $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                                },
                                $ArrowNavigatorOptions: {
                                    $Class: $JssorArrowNavigator$, //[Requried] Class to create arrow navigator instance
                                    $ChanceToShow: 2                                //[Required] 0 Never, 1 Mouse Over, 2 Always
                                }
                            };

                            var jssor_slider2 = new $JssorSlider$("slider2_container", options);

                            //responsive code begin
                            //you can remove responsive code if you don't want the slider scales while window resizes
                            function ScaleSlider() {
                                var parentWidth = jssor_slider2.$Elmt.parentNode.clientWidth;
                                if (parentWidth)
                                    jssor_slider2.$SetScaleWidth(Math.min(parentWidth, 750));
                                else
                                    window.setTimeout(ScaleSlider, 30);
                            }

                            ScaleSlider();

                            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                                $(window).bind('resize', ScaleSlider);
                            }


                            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
                            //    $(window).bind("orientationchange", ScaleSlider);
                            //}
                            //responsive code end
                        });
                    </script>
                    <!-- Jssor Slider Begin -->
                    <!-- You can move inline styles to css file or css block. -->
                    <div id="slider2_container" style="position: relative; width: 750px;
                         height: 300px;">

                        <!-- Loading Screen -->
                        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                                 background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
                            </div>
                            <div style="position: absolute; display: block; background: url(img/loading.gif) no-repeat center center;
                                 top: 0px; left: 0px;width: 100%;height:100%;">
                            </div>
                        </div>

                        <!-- Slides Container -->
                        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 750px; height: 300px;
                             overflow: hidden;">
                            <div>
                                <a u=image href="#"><img src="img/landscape/01.jpg" /></a>
                            </div>
                            <div>
                                <a u=image href="#"><img src="img/landscape/02.jpg" /></a>
                            </div>
                            <div>
                                <a u=image href="#"><img src="img/landscape/03.jpg" /></a>
                            </div>
                            <div>
                                <a u=image href="#"><img src="img/landscape/04.jpg" /></a>
                            </div>
                        </div>

                        <!-- Bullet Navigator Skin Begin -->
                        <!-- jssor slider bullet navigator skin 01 -->
                        <style>
                            /*
                            .jssorb01 div           (normal)
                            .jssorb01 div:hover     (normal mouseover)
                            .jssorb01 .av           (active)
                            .jssorb01 .av:hover     (active mouseover)
                            .jssorb01 .dn           (mousedown)
                            */
                            .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av
                            {
                                filter: alpha(opacity=70);
                                opacity: .7;
                                overflow:hidden;
                                cursor: pointer;
                                border: #000 1px solid;
                            }
                            .jssorb01 div { background-color: gray; }
                            .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
                            .jssorb01 .av { background-color: #fff; }
                            .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }
                        </style>
                        <!-- bullet navigator container -->
                        <div u="navigator" class="jssorb01" style="position: absolute; bottom: 16px; right: 10px;">
                            <!-- bullet navigator item prototype -->
                            <div u="prototype" style="POSITION: absolute; WIDTH: 12px; HEIGHT: 12px;"></div>
                        </div>
                        <!-- Bullet Navigator Skin End -->

                        <!-- Arrow Navigator Skin Begin -->
                        <style>
                            /* jssor slider arrow navigator skin 05 css */
                            /*
                            .jssora05l              (normal)
                            .jssora05r              (normal)
                            .jssora05l:hover        (normal mouseover)
                            .jssora05r:hover        (normal mouseover)
                            .jssora05ldn            (mousedown)
                            .jssora05rdn            (mousedown)
                            */
                            .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
                            {
                                position: absolute;
                                cursor: pointer;
                                display: block;
                                background: url(img/a17.png) no-repeat;
                                overflow:hidden;
                            }
                            .jssora05l { background-position: -10px -40px; }
                            .jssora05r { background-position: -70px -40px; }
                            .jssora05l:hover { background-position: -130px -40px; }
                            .jssora05r:hover { background-position: -190px -40px; }
                            .jssora05ldn { background-position: -250px -40px; }
                            .jssora05rdn { background-position: -310px -40px; }
                        </style>
                        <!-- Arrow Left -->
                        <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 123px; left: 8px;">
                        </span>
                        <!-- Arrow Right -->
                        <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 123px; right: 8px">
                        </span>
                        <!-- Arrow Navigator Skin End -->
                        <a style="display: none" href="http://www.jssor.com">slideshow</a>
                    </div>
                </div>  
            </div>
            <div class="col-md-12">   


                <div class="col-xs-12" style="margin:auto;padding-top: 50px">
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
    </body>
</html>
