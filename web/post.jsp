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
        <title>Social Market | Post</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="css/flat-ui.css" rel="stylesheet">
        <!--<link href="css/demo.css" rel="stylesheet">-->
        <link href="bootstrap/css/drop.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/favicon.ico">
        <!--<link href="css/flat-ui.css" rel="stylesheet">-->

    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-xs-9">
            <jsp:include page="header.jsp"/>
            <div class="col-xs-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Post</li>
                </ol>
            </div>      
            <div class="col-xs-11" style="margin:auto;">
                <div class="col-md-11" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 580px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">Post</h3>
                        <form class="form-horizontal" align="center" action="product">
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Product</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Name of product" name="name" required>
                                    <input type="hidden" class="form-control" value="${user.username}" name="acctid" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Price</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="Price" name="price" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3">Description</label>
                                <div class="col-sm-6">
                                    <textarea class="form-control" name="des" rows="3" required></textarea> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Available</label>
                                <div class="col-sm-3">
                                    <select value="Yes" class="form-control" name="available" >
                                        <option value="yes">Yes</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3">Category</label>
                                <div class="row">
                                    <div class="col-md-2">
                                        <select id="mark" class="form-control">
                                            <option value="">--</option>
                                            <c:forEach items="${cateID}" var="a">
                                                <option value="${a.cateID}">${a.cateName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-2" >
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
                                </div>
                            </div>
                                <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3">Brand</label>
                                <div class="col-sm-3">
                                    <select value="Yes" class="form-control" name="brand" >
                                        <option value="1">Yes</option>
                                        <option value="0">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <button type="submit" class="btn btn-info">Submit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
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
        <script src="js/chained.js"></script>
        <script>
            $(function() {
                $("#series").chainedTo("#mark");
            });
        </script>
    </body>
</html>
