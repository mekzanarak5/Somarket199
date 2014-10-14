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
        <style type="text/css">
            body{
                /*height: 10000px;*/
                font-family: "Lato";
                background-color: #2980b9;
                margin: 0px;
            }

            h1,h2,h3,h4{
                padding: 0px;
                margin: 0px;
            }

            .caption-style-1{
                list-style-type: none;
                margin: 0px;
                padding: 0px;

            }

            .caption-style-1 li{
                float: left;
                padding: 0px;
                position: relative;
                overflow: hidden;
            }

            .caption-style-1 li:hover .caption{
                opacity: 1;

            }


            .caption-style-1 img{
                margin: 0px;
                padding: 0px;
                float: left;
                z-index: 4;
            }


            .caption-style-1 .caption{
                cursor: pointer;
                position: absolute;
                opacity: 0;
                -webkit-transition:all 0.45s ease-in-out;
                -moz-transition:all 0.45s ease-in-out;
                -o-transition:all 0.45s ease-in-out;
                -ms-transition:all 0.45s ease-in-out;
                transition:all 0.45s ease-in-out;

            }
            .caption-style-1 .blur{
                background-color: rgba(0,0,0,0.65);
                height: 300px;
                width: 400px;
                z-index: 5;
                position: absolute;
            }

            .caption-style-1 .caption-text h1{
                text-transform: uppercase;
                font-size: 24px;
            }
            .caption-style-1 .caption-text{
                z-index: 10;
                color: #fff;
                position: absolute;
                width: 320px;
                height: 240px;
                text-align: center;
                top:100px;
            }

            /** Nav Menu */
            ul.nav-menu{
                padding: 0px;
                margin: 0px;
                list-style-type: none;
                width: 490px;
                margin: 60px auto;
            }

            ul.nav-menu li{
                display: inline;
                margin-right: 10px;
                padding:10px;
                border: 1px solid #ddd;
            }

            ul.nav-menu li a{
                color: #eee;
                text-decoration: none;
                text-transform: uppercase;
            }

            ul.nav-menu li a:hover, ul.nav-menu li a.active{
                color: #2c3e50;
            } 

            /** content **/
            .content{
                margin-top: 100px;
                margin-left: 100px;
                width: 700px;
            }
            .content h1, .content h2{
                font-family: "Source Sans Pro",sans-serif;
                color: #ecf0f1;
                padding: 0px;
                margin: 0px;
                font-weight: normal;
            }

            .content h1{
                font-weight: 900;
                font-size: 64px;
            }

            .content h2{
                font-size:26px;
            }

            .content p{
                color: #ecf0f1;
                font-family: "Lato";
                line-height: 28px;
                font-size: 15px;
                padding-top: 50px;
            }

            p.credit{
                padding-top: 20px;
                font-size: 12px;
            }

            p a{
                color: #ecf0f1;
            }

            /** fork icon**/
            .fork{
                position: absolute;
                top:0px;
                left: 0px;
            }

        </style>
    </head>
   <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
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
                        <h3 class="col-md-2">Account</h3>
                        <div class="col-md-12">
                            <table class="table table-striped" style="text-align: center">
                                <tr bgColor="#ffffff">
                                    <td>Account ID</td>
                                    <td>Buy List</td>
                                    <td>Sell List</td>
                                    <td>Ongoing</td>
                                    <td>Waiting For Check</td>
                                    <td>Sold List</td>
                                </tr>
                                <c:forEach items="${acc}" var="a">
                                    <tr>
                                        <td>${a.account_Id}</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td width="20%">
                                            <div class="btn-group">                                              
                                                <a href="AdminShowCategory?proid=${a.productNO}"><button class="btn btn-primary">Edit</button></a>
                                                <a href="AdminDeleteProduct?id=${a.productNO}"><button class="btn btn-danger">Delete</button></a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>                           
                        </div>
                        <!--                        <p> Register
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
                                            </div>-->
                    </div>
                    <div class="tab-pane" id="product">
                        <div class="row">
                            <h3 class="col-md-2" style="margin-top: 50px">Product</h3>
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
                                                    <a href="AdminShowCategory?proid=${a.productNO}"><button class="btn btn-primary">Edit</button></a>
                                                    <a href="AdminDeleteProduct?id=${a.productNO}"><button class="btn btn-danger">Delete</button></a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
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
                                <label for="inputEmail3" class="col-sm-3 control-label">Big Category Name</label>
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
                        <form action="AdminAddCategorySmall" method="get" class="form-horizontal" style="margin-top: 50px">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3 control-label">Small Category Name</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" placeholder="Category Name" name="cateName" required>
                                    <select name="parentid" class="form-control">
                                        <option value="">--</option>
                                        <c:forEach items="${cateID}" var="a">
                                            <option value="${a.cateID}">${a.cateName}</option>
                                        </c:forEach>
                                    </select>
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
            $(function () {
                $('.demo.menu .item')
                        .tab('deactivate all')
                        .tab('activate tab', 'third')
                        .tab('activate navigation', 'third')
                        ;
            });
        </script>
        <script>
            $(function () {
                $("#series").chainedTo("#mark");
            });
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
