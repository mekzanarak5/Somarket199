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
        <script>

            jQuery(function($) {
                $("#price").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#price').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });

        </script>
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo_1.jsp"/>
            </div>
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Post Product</li>
                    </ol>
                    </font>
                </div>

                <div class="col-xs-11" style="margin:auto;">
                    <div class="col-md-11" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h5 class="col-md-12">Post Product</h5>
                            <form action="AddProductPic" method="post" enctype="multipart/form-data">
                                <div class="form-horizontal" align="center">
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3">Product</label>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control" placeholder="Name of product" name="name" maxlength="50" required>                               
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3">Price</label>
                                        <div class="col-sm-6">
                                            <input type="text" id="price" class="form-control" placeholder="Price" name="price" maxlength="7" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3">Description</label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" name="des" rows="3" required></textarea> 
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-md-3">Available</label>
                                        <div class="col-md-3">
                                            <input type="number" value="1" class="form-control" name="available" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail3" class="col-sm-3">Category</label>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select id="mark" class="form-control">
                                                    <option value="">--</option>
                                                    <c:forEach items="${cate}" var="entry">
                                                        <option value="${entry.key.cateID}">${entry.key.cateName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="col-md-3" >
                                                <select id="series" class="form-control" name="cata">
                                                    <option value="">--</option>
                                                    <c:forEach items="${cate}" var="entry">
                                                        <c:forEach items="${entry.value}" var="sub_entry">
                                                            <option value="${sub_entry.cateID}" class="${entry.key.cateID}">${sub_entry.cateName}</option>
                                                        </c:forEach>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3">Brand</label>
                                        <div class="col-md-3">
                                            <select id="brand" class="form-control" name="brand">
                                                <option value="">--</option>
                                                <option value="ACER" class="11 12 14 15 16 21 22 23">ACER</option>
                                                <option value="APPLE" class="11 12 13 14 15 16 21 22 23">APPLE</option>
                                                <option value="ASUS" class="11 12 14 15 16 21 22 23">ASUS</option>
                                                <option value="BENQ" class="11 12 13 14 15 16 21 31 32 33 35 36">BENQ</option>
                                                <option value="COMPAQ" class="11 12 13 14 15 16 22">COMPAQ</option>
                                                <option value="CANON" class="31 32 33 34 35 36 37">CANON</option>
                                                <option value="LUMIX" class="31 32 33 34 35 36 37">LUMIX</option>
                                                <option value="NIKON" class="31 32 33 34 35 36 37">NIKON</option>
                                                <option value="DELL" class="11 12 13 14 15 16 22">DELL</option>
                                                <option value="FUJITSU" class="11 12 13 14 15 16 31 32 33 34 35 36 37">FUJITSU</option>
                                                <option value="GATEWAY" class="12 13 31 32 33 34 35 36 37">GATEWAY</option>
                                                <option value="GIGABITE" class="14 15">GIGABITE</option>
                                                <option value="HP" class="11 12 13 14 15 16 22">HP</option>
                                                <option value="KOHJINSHA" class="12 14 15">KOHJINSHA</option>
                                                <option value="LENOVO" class="11 12 13 14 15 16 17 21 22 23">LENOVO</option>
                                                <option value="MSI" class="11 12 13 14 15 16 17 22">MSI</option>
                                                <option value="SUMSUNG" class="11 12 13 14 15 16 17 21 22 23 31 32 33 34 35 36 37">SUMSUNG</option>
                                                <option value="SONY" class="11 12 13 14 15 16 21 22 23 31 32 33 34 35 36 37">SONY</option>
                                                <option value="SVOA" class="12">SVOA</option>
                                                <option value="TOSHIBA" class="11 12 13 14 15 16 21 22 23 31 35">TOSHIBA</option>
                                                <option value="STEELSERIES" class="14">STEELSERIES</option>
                                                <option value="ROCCAT" class="14">ROCCAT</option>
                                                <option value="RAZER" class="14">RAZER</option>
                                                <option value="TTESPORTS" class="14">TTESPORTS</option>
                                                <option value="DUCKY" class="14">DUCKY</option>
                                                <option value="CMSTORM" class="14">CMSTORM</option>
                                                <option value="NEOLUTION ESPORT" class="14">NEOLUTION ESPORT</option>
                                                <option value="ROSE" class="14">ROSE</option>
                                                <option value="GOOGLE" class="21 22 23">GOOGLE</option>
                                                <option value="i-MOBILE" class="21 22 23">i-MOBILE</option>
                                                <option value="NEXUS" class="21 22 23">NEXUS</option>
                                                <option value="XIAO MI" class="21 22 23">XIAO MI</option>
                                            </select>
                                        </div>
                                        <input type="hidden" name="acctid" value="${user.account_Id}"/>
                                    </div>
                                    <div class="form-group col-md-12">            
                                        <input id="file-3" type="file" name="file" accept="image/*" multiple=true>

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
                $("#brand").chainedTo("#series");
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