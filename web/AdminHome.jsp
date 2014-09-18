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
            <div class="col-md-12" style="margin-top: 50px">   
                <ul class="nav nav-tabs" style="text-align: center" role="tablist">
                    <li class="active col-md-2"><a href="#account" role="tab" data-toggle="tab">Account</a></li>
                    <li class="col-md-2"><a href="#product" role="tab" data-toggle="tab">Product</a></li>
                    <li class="col-md-2"><a href="#order" role="tab" data-toggle="tab">Order</a></li>
                    <li class="col-md-2"><a href="#report" role="tab" data-toggle="tab">Report</a></li>
                    <li class="col-md-2"><a href="#settings" role="tab" data-toggle="tab">Settings</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" style="margin-top: 50px" id="account">
                        <p> Register
                        <div style="width:50%">
                            <div>
                                <canvas id="canvas" height="450" width="600"></canvas>
                            </div>
                        </div>
                        <script>
                            var randomScalingFactor = function() {
                                return Math.round(Math.random() * 100)
                            };
                            var lineChartData = {
                                labels: ["January", "February", "March", "April", "May", "June", "July"],
                                datasets: [
                                    {
                                        label: "My Second dataset",
                                        fillColor: "rgba(151,187,205,0.2)",
                                        strokeColor: "rgba(151,187,205,1)",
                                        pointColor: "rgba(151,187,205,1)",
                                        pointStrokeColor: "#fff",
                                        pointHighlightFill: "#fff",
                                        pointHighlightStroke: "rgba(151,187,205,1)",
                                        data: [randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor(), randomScalingFactor()]
                                    }
                                ]

                            }

                            window.onload = function() {
                                var ctx = document.getElementById("canvas").getContext("2d");
                                window.myLine = new Chart(ctx).Line(lineChartData, {
                                    responsive: true
                                });
                            }
                        </script>
                    </div>
                    <div class="tab-pane" id="product">
                        <div class="row">
                            <h3 class="col-md-2">Product</h3>
                            <div class="col-md-12">
                                <table class="table table-striped" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                        <td>Account ID</td>
                                        <td>Category</td>
                                        <td>Name</td>
                                        <td>Price</td>
                                        <td>CreateOn</td>
                                        <td>Manage Post</td>
                                    </tr>
                                    <c:forEach items="${pro}" var="a">
                                        <tr>
                                            <td>${a.acctID}</td>
                                            <td>${a.category_ID}</td>
                                            <td>${a.name}</td>
                                            <td>${a.price}</td>
                                            <td>${a.createOn}</td>
                                            <td width="20%">
                                                <div class="btn-group">
                                                    <button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Edit</button>

                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="form-group">
                                                    <label for="inputEmail3" class="col-sm-12"><h4>Category</h4></label>
                                                    <form action="AdminEditCategory" method="get">
                                                        <c:forEach items="${pro}" var="a">
                                                        <input type="hidden" name="proid" value="${a.productNO}">
                                                        </c:forEach>
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
                                                                <button class="btn btn-primary">Change</button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="order">...</div>
                    <div class="tab-pane" id="report">
                        <div class="row">
                            <h3 class="col-md-2">Report</h3>
                            <form action="DeleteMessageServlet" method="get">
                                <div class="col-md-12">
                                    <table class="table table-striped" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                        <td>Sender</td>
                                        <td>Subject</td>
                                        <td>Time</td>
                                        <td><button  type="submit"><img src="pic/bin.png" width="18px" height="18px" ></button></td>
                                        </tr>
                                        <c:forEach items="${pm}" var="a">
                                            <tr>
                                                <td><a href="#">${a.username}</a></td>
                                                <td><a href="ReplayServlet?id=${a.msgID}">${a.subject}</a></td>
                                                <td>${a.time}</td>
                                                <td><botton  class="checkbox"  for="checkbox1">
                                                <input type="checkbox" name="pmid" value="${a.msgID}" id="checkbox1" data-toggle="checkbox">
                                            </botton>
                                            </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="tab-pane" id="settings">
                        <form action="AddCategory" method="get" class="form-horizontal" style="margin-top: 50px">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3 control-label">Category Name</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" placeholder="Category Name" name="cateName" required>
                                    <input type="hidden" name="parentid" value="NULL">
                                    <input type="hidden" name="value" value="NULL">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-info">Add</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
                            });
        </script>
        <script>
            $(function() {
                $("#series").chainedTo("#mark");
            });
        </script>
    </body>
</html>
