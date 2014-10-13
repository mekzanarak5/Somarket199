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
        <link href="css/demo.css" rel="stylesheet">
        <link href="bootstrap/css/drop.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/favicon.ico">
        <!--<link href="css/flat-ui.css" rel="stylesheet">-->
        <link rel="stylesheet" href="upload/css/style.css">
        <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
        <link rel="stylesheet" href="upload/css/jquery.fileupload.css">
        <link rel="stylesheet" href="upload/css/jquery.fileupload-ui.css">
        <noscript><link rel="stylesheet" href="upload/css/jquery.fileupload-noscript.css"></noscript>
        <noscript><link rel="stylesheet" href="upload/css/jquery.fileupload-ui-noscript.css"></noscript>
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
                        <form class="form-horizontal" align="center" action="product" enctype="multipart/form-data">
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
                            <div class="form-group">
                                <!-- Redirect browsers with JavaScript disabled to the origin page -->
                                <noscript><input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/"></noscript>
                                <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                                <div class="row fileupload-buttonbar">
                                    <div class="col-lg-12">
                                        <!-- The fileinput-button span is used to style the file input field as button -->
                                        <span class="btn btn-success fileinput-button">
                                            <i class="glyphicon glyphicon-plus"></i>
                                            <span>Add files...</span>
                                            <input type="file" name="files[]" multiple>
                                        </span>
                                        <button type="submit" class="btn btn-primary start">
                                            <i class="glyphicon glyphicon-upload"></i>
                                            <span>Start upload</span>
                                        </button>
                                        <button type="reset" class="btn btn-warning cancel">
                                            <i class="glyphicon glyphicon-ban-circle"></i>
                                            <span>Cancel upload</span>
                                        </button>
                                        <button type="button" class="btn btn-danger delete">
                                            <i class="glyphicon glyphicon-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                        <input type="checkbox" class="toggle">
                                        <!-- The global file processing state -->
                                        <span class="fileupload-process"></span>
                                    </div>
                                    <!-- The global progress state -->
                                    <div class="col-lg-5 fileupload-progress fade">
                                        <!-- The global progress bar -->
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                            <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                        </div>
                                        <!-- The extended global progress state -->
                                        <div class="progress-extended">&nbsp;</div>
                                    </div>
                                </div>
                                <!-- The table listing the files available for upload/download -->
                                <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                                
                            </div>
                            <div class="form-group">
                                <div class="col-md-8">
                                    <button type="submit" class="btn btn-info">Submit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                </div>
                            </div>
                        </form>
                                <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
                                    <div class="slides"></div>
                                    <h3 class="title"></h3>
                                    <a class="prev">‹</a>
                                    <a class="next">›</a>
                                    <a class="close">×</a>
                                    <a class="play-pause"></a>
                                    <ol class="indicator"></ol>
                                </div>
                    </div>        
                </div>
            </div>
        </div>
        <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-upload fade">
            <td>
            <span class="preview"></span>
            </td>
            <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
            </td>
            <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
            </td>
            <td>
            {% if (!i && !o.options.autoUpload) { %}
            <button class="btn btn-primary start" disabled>
            <i class="glyphicon glyphicon-upload"></i>
            <span>Start</span>
            </button>
            {% } %}
            {% if (!i) { %}
            <button class="btn btn-warning cancel">
            <i class="glyphicon glyphicon-ban-circle"></i>
            <span>Cancel</span>
            </button>
            {% } %}
            </td>
            </tr>
            {% } %}
        </script>
        <!-- The template to display files available for download -->
        <script id="template-download" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
            <tr class="template-download fade">
            <td>
            <span class="preview">
            {% if (file.thumbnailUrl) { %}
            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
            {% } %}
            </span>
            </td>
            <td>
            <p class="name">
            {% if (file.url) { %}
            <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
            {% } else { %}
            <span>{%=file.name%}</span>
            {% } %}
            </p>
            {% if (file.error) { %}
            <div><span class="label label-danger">Error</span> {%=file.error%}</div>
            {% } %}
            </td>
            <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
            </td>
            <td>
            {% if (file.deleteUrl) { %}
            <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
            <i class="glyphicon glyphicon-trash"></i>
            <span>Delete</span>
            </button>
            <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
            <button class="btn btn-warning cancel">
            <i class="glyphicon glyphicon-ban-circle"></i>
            <span>Cancel</span>
            </button>
            {% } %}
            </td>
            </tr>
            {% } %}
        </script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="upload/js/vendor/jquery.ui.widget.js"></script>
        <script src="http://blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
        <script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
        <script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
        <script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
        <script src="upload/js/jquery.iframe-transport.js"></script>
        <script src="upload/js/jquery.fileupload.js"></script>
        <script src="upload/js/jquery.fileupload-process.js"></script>
        <script src="upload/js/jquery.fileupload-image.js"></script>
        <script src="upload/js/jquery.fileupload-audio.js"></script>
        <script src="upload/js/jquery.fileupload-video.js"></script>
        <script src="upload/js/jquery.fileupload-validate.js"></script>
        <script src="upload/js/jquery.fileupload-ui.js"></script>
        <script src="upload/js/main.js"></script>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
     
        <script src="js/chained.js"></script>
        <script>
            $(function() {
                $("#series").chainedTo("#mark");
            });
        </script>
    </body>
</html>
