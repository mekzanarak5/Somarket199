<%-- 
    Document   : upload
    Created on : Nov 3, 2012, 12:31:16 PM
    Author     : Amila
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Force latest IE rendering engine or ChromeFrame if installed -->
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Post</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">
        <!-- Bootstrap CSS Toolkit styles -->
        <!-- Generic page styles -->
        <!--<link rel="stylesheet" href="css/style.css">-->
        <!-- Bootstrap styles for responsive website layout, supporting different screen sizes -->
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <!-- Bootstrap CSS fixes for IE6 -->
        <!--[if lt IE 7]><link rel="stylesheet" href="http://blueimp.github.com/cdn/css/bootstrap-ie6.min.css"><![endif]-->
        <!-- Bootstrap Image Gallery styles -->
        <link rel="stylesheet" href="css/bootstrap-image-gallery.min.css">
        <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
        <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
        <!-- Shim to make HTML5 elements usable in older Internet Explorer versions -->
        <!--[if lt IE 9]><script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
        <jsp:include page="cssup.jsp"/>
        <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <div style="margin-bottom: -20px">
            <jsp:include page="header1.jsp"/>
        </div>
        <div class="row">
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
                    <div class="col-md-11" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h3 class="col-md-12">Post</h3>
                            <form action="AddProductPic" method="post" enctype="multipart/form-data">
                                <div class="form-horizontal" align="center">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3">Product</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" placeholder="Name of product" name="name" required>                               
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
                                    <div class="form-group col-md-12">            
                                        <input id="file-3" type="file" name="file" multiple=true>
                                        <input type="hidden" name="acctid" value="${user.account_Id}"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js1/vendor/jquery.ui.widget.js"></script>
        <script src="js1/tmpl.min.js"></script>
        <script src="js1/load-image.min.js"></script>
        <script src="js1/canvas-to-blob.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/bootstrap-image-gallery.min.js"></script>
        <script src="js1/jquery.iframe-transport.js"></script>
        <script src="js1/jquery.fileupload.js"></script>
        <script src="js1/jquery.fileupload-fp.js"></script>
        <script src="js1/jquery.fileupload-ui.js"></script>
        <script src="js1/locale.js"></script>
        <script src="js1/main.js"></script>
        <script src="js1/fileinput.js" type="text/javascript"></script>

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

        <script>
            $("#file-1").fileinput({
                initialPreview: ["<img src='Desert.jpg' class='file-preview-image'>", "<img src='Jellyfish.jpg' class='file-preview-image'>"],
                overwriteInitial: false,
                maxFileSize: 100,
                maxFilesNum: 10
            });
            $("#file-3").fileinput({
                showCaption: false,
                browseClass: "btn btn-primary btn-lg",
                fileType: "any"
            });
            $(".btn-warning").on('click', function() {
                if ($('#file-4').attr('disabled')) {
                    $('#file-4').fileinput('enable');
                } else {
                    $('#file-4').fileinput('disable');
                }
            });
        </script>
        <jsp:include page="footer.jsp"/>
    </body> 
</html>