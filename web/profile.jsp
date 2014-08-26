<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Register</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <!-- Loading Bootstrap -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <!-- Loading Flat UI -->
        <link href="css/flat-ui.css" rel="stylesheet">
        <link href="css/demo.css" rel="stylesheet">

        <link rel="shortcut icon" href="images/favicon.ico">
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-md-9">
            <jsp:include page="header.jsp"/>
            <div class="col-xs-12">

                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Profile</li>
                </ol>

            </div>       

            <div class="col-md-12">
                <nav class="navbar navbar-inverse navbar-embossed" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
                            <span class="sr-only">Toggle navigation</span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-collapse-01">
                        <ul class="nav navbar-nav navbar-left">           
                            <li><a href="#fakelink">Edit</a></li>
                            <li><a href="#fakelink">Change Password</a></li>
                            <li><a href="#fakelink">Buy List</a></li>
                            <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List</a></li>
                            <li><a href="address.jsp">Profile</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>
                <div class="col-md-2" align="center">   
                    <img src="pic/Pikachu.png" alt="..." class="img-thumbnail">
                    <a href="Address.html"><button type="button" class="btn btn-danger btn-xs">Report</button></a>
                </div>
                <form class="form-horizontal col-md-8" role="form" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 300px;background: #FFFFFF">
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
                <div class="col-md-12"><h2>Feedback</h2><hr></div>
                <table class="table" >
                    <tr bgColor="#ececea">
                        <td></td>
                        <td></td>
                        <td><select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select></td>
                    </tr>
                    <tr bgColor="#ececea">
                        <td width="70%">FeedBack</td>
                        <td>From Buyer</td>
                        <td>Date</td>
                    </tr>
                    <tr>
                        <td>แจ่มจุงเบย</td>
                        <td>boss451</td>
                        <td>10/05/2014</td>
                    </tr>
                </table>
            </div> 
        </div>
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
    </body>
</html>
