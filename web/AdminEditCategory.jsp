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
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
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
                                <img src="pic/Pikachu.png" width="200px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Pikachu.png" width="200px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Pikachu.png" width="200px" alt="...">
                                <div class="carousel-caption">
                                </div>
                            </div>
                            <div class="item">
                                <img src="pic/Pikachu.png" width="200px" alt="...">
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
            <div class="col-md-12"> 
                <form action="AdminEditCategory" method="get">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-12"><h4>Edit Category</h4></label>
                        <div class="row">
                            <div class="col-sm-offset-1 col-md-3">
                                <select id="mark" class="form-control">
                                    <option value="">--</option>
                                    <c:forEach items="${cateID}" var="a">
                                        <option value="${a.cateID}">${a.cateName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3" >
                                <select id="series" class="form-control" name="cata">
                                    <option value="">--</option>
                                    <c:forEach items="${childCateID1}" var="a">
                                        <option value="${a.cateID}" class="1">${a.cateName}</option>
                                    </c:forEach>
                                    <c:forEach items="${childCateID2}" var="a">
                                        <option value="${a.cateID}" class="2">${a.cateName}</option>
                                    </c:forEach>
                                    <c:forEach items="${childCateID3}" var="a">
                                        <option value="${a.cateID}" class="3">${a.cateName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3" >
                                <input type="hidden" name="proid" value="${pro}">
                                <button type="submit" class="btn btn-primary">Change</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--<script src="js/jasny-bootstrap.min.js"></script>-->
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
                $("#series").chainedTo("#mark");
            });
        </script>

    </body>
</html>
