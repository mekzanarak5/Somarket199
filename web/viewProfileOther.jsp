
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
<jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo_1_1.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
<font size="2">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li class="active">Profile</li>
                    </ol>
</font>
                </div>
                <div class="col-md-12">
                    <div class="col-md-4" align="center">   
                        <img src="${showName.pic}" alt="..." class="img-thumbnail" width="250px" height="250px">
                        <a href="GetReceiverServlet?acctid=${showName.account_Id}"><button type="button" class="btn btn-danger btn-xs">PM</button></a>
                    </div>
                    <form class="form-horizontal col-md-8" role="form" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 230px;background: #FFFFFF">
                        <h5>Personal Info</h5>
                        <table>
                            <tr>
                                <td class="col-md-2" style="color: #2980b9">
                                    E-mail
                                </td>
                                <td class="col-md-6">
                                    ${showName.email}
                                </td>
                            </tr>

                            <tr>
                                <td class="col-md-3" style="color: #2980b9">
                                    First name
                                </td>
                                <td class="col-md-6">
                                    ${showName.firstName}
                                </td>
                            </tr>
                            <tr>
                                <td class="col-md-2" style="color: #2980b9">
                                    Last name
                                </td>
                                <td class="col-md-6">
                                    ${showName.lastName}
                                </td>
                            </tr>
                            <tr>
                                <td class="col-md-2" style="color: #2980b9">
                                    Phone
                                </td>
                                <td class="col-md-6">
                                    ${showName.phone}
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
        <jsp:include page="footer.jsp"/>
    </body>
</html>
