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
        <title>jQuery File Upload Demo</title>
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
                        <form id="fileupload" action="UploadServlet" method="POST" enctype="multipart/form-data">
                            <div class="form-horizontal" align="center">
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3">Product</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" placeholder="Name of product" name="name" required>
                                        <input type="hidden" class="form-control" value="${user.getAccount_Id()}" name="acctid" required>
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
                            </div>
                            <div class="row fileupload-buttonbar">
                                <div class="span7">
                                    <span class="btn btn-success fileinput-button">
                                        <i class="icon-plus icon-white"></i>
                                        <span>Add files...</span>
                                        <input type="file" name="files[]" accept="image/*" multiple>
                                    </span>
                                    <button type="submit" class="btn btn-primary start">
                                        <i class="icon-upload icon-white"></i>
                                        <span>Start upload</span>
                                    </button>
                                    <button type="reset" class="btn btn-warning cancel">
                                        <i class="icon-ban-circle icon-white"></i>
                                        <span>Cancel upload</span>
                                    </button>
                                    <button type="button" class="btn btn-danger delete">
                                        <i class="icon-trash icon-white"></i>
                                        <span>Delete</span>
                                    </button>
                                    <input type="checkbox" class="toggle">
                                </div>
                            </div>
                            <div class="fileupload-loading"></div>
                            <br>
                            <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-upload fade">
            <td class="preview"><span class="fade"></span></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else if (o.files.valid && !i) { %}
            <td>
            <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
            <button class="btn btn-primary hidden">
            <i class="icon-upload icon-white"></i>
            </button>
            {% } %}</td>
            {% } else { %}
            <td colspan="2"></td>
            {% } %}
            <td class="cancel">{% if (!i) { %}
            <button class="btn btn-warning">
            <i class="icon-ban-circle icon-white"></i>
            <span>Cancel</span>
            </button>
            {% } %}</td>
            </tr>
            {% } %}
        </script>
        <!-- The template to display files available for download -->
        <script id="template-download" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
            {% if (file.error) { %}
            <td></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else { %}
            <td class="preview">{% if (file.thumbnail_url) { %}
            <a href="{%=file.url%}" title="{%=file.name%}" rel="gallery" download="{%=file.name%}"><img src="{%=file.thumbnail_url%}"></a>
            {% } %}</td>
            <td class="name">
            <a href="{%=file.url%}" title="{%=file.name%}" rel="{%=file.thumbnail_url&&'gallery'%}" download="{%=file.name%}">{%=file.name%}</a>
            </td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            <td colspan="2"></td>
            {% } %}
            <td class="delete">
            <button class="btn btn-danger" data-type="{%=file.delete_type%}" data-url="{%=file.delete_url%}"{% if (file.delete_with_credentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
            <i class="icon-trash icon-white"></i>
            <span>Delete</span>
            </button>
            <input type="checkbox" name="delete" value="1">
            </td>
            </tr>
            {% } %}
        </script>
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
        <form action="AddProfilePic" method="post"
              enctype="multipart/form-data">
         <div class="form-group">            
                    <input id="file-3" type="file" name="file" multiple=true>
                    <input type="hidden" name="id" value="${user.account_Id}"/>
                </div>
                </form>
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
    </body> 
</html>