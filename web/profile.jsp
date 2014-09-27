<%@page import="model.Accounts"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Profile</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>

    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <div style="margin-bottom: -20px">
            <jsp:include page="header1.jsp"/>
        </div>
        <div class="row">
        <div class="col-md-3">
            <jsp:include page="logo_1.jsp"/>
        </div>
        <div class="col-md-9">
            <jsp:include page="header.jsp"/>
            <div class="col-xs-12">

                <ol class="breadcrumb">
                    <li><a href="home.jsp">Home</a></li>
                    <li class="active">Profile</li>
                </ol>

            </div>       
            <div class="col-md-12">
                <div class="col-md-4" align="center">
                    <form action="AddProfilePic" method="post"
                          enctype="multipart/form-data">
                        <img src="${user.pic}" alt="..." class="img-thumbnail" width="250px" height="250px">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <span class="btn btn-default btn-file"><span class="fileinput-new">Edit Profile Pic</span><span class="fileinput-exists">Change</span><input type="file" name="file" onchange="this.form.submit();" accept="image/*" ></span>
                
                            <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="float: none">&times;</a>
                        </div>
                        <input type="hidden" name="id" value="${user.account_Id}"/>
                    </form>
                </div>
                <form class="form-horizontal col-md-8" role="form" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 230px;background: #FFFFFF">
                    <h5>Personal Info</h5>
                    <table>
                        <tr>
                            <td class="col-md-2" style="color: #2980b9">
                                E-mail
                            </td>
                            <td class="col-md-6">
                                ${user.email}
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="col-md-3" style="color: #2980b9">
                                First name
                            </td>
                            <td class="col-md-6">
                                ${user.firstName}
                            </td>
                        </tr>
                        <tr>
                            <td class="col-md-2" style="color: #2980b9">
                                Last name
                            </td>
                            <td class="col-md-6">
                                ${user.lastName}
                            </td>
                        </tr>
                        <tr>
                            <td class="col-md-2" style="color: #2980b9">
                                Phone
                            </td>
                            <td class="col-md-6">
                                ${user.phone}
                            </td>
                        </tr>
                    </table> 
                </form>
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
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script>
            $(function() {
                $('.fileinput').fileinput()
            });
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
