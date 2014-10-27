<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.ProductPic"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Order Detail</title>
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
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="ShowOrder">Buy List</a></li>
                        <li class="active">Order Detail</li>
                    </ol>
                    </font>
                </div>
            </div>
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                    <div class="row">
                        <div style="padding: 20px;">
                            <h5 style="display: inline ">Order Detail</h5>
                            <p style="display: inline;margin-left: 15px; font-size: 22px">#</p>
                            <p style="display: inline; font-size: 22px; color: #666666">${order.orderId}</p>
                        </div>
                        <div class="panel panel-default col-md-11" style="margin-left: 45px ">
                            <h6 class="panel-heading">Item Detail</h6>
                            <table class="table table-striped" style="text-align: center">
                                <tr>
                                    <td>Seller</td>
                                    <td>Pic</td>
                                    <td>Name</td>
                                    <td>Unit Price</td>
                                    <td>Quantity</td>
                                    <td>Total</td>
                                </tr>
                                <c:forEach items="${detail.lineItems}" var="line">
                                    <c:set value="${wtf:getAccountById(line.product.acctID)}" var="n" />
                                    <tr>
                                        <td><a href="#">${n.username}</a></td>
                                        <td><a href="#"><img src="${line.product.pathFile}" style="width: 70px; height: 70px;" class="img-rounded"/></a></td>
                                        <td><a href="#">${line.product.name}</a></td>
                                        <td>${line.product.price}0</td>
                                        <td>${line.unit}</td>
                                        <td>${line.total}0</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <c:choose>
                            <c:when test="${user.username == order.username}" >
                                <c:choose>
                                    <c:when test="${order.status == 'rejected' || (order.payment == null && order.slip == null)}" >
                                        <div class="panel panel-default col-md-11" style="margin-left: 45px ">
                                            <h6 class="col-md-12 panel-heading">Payment Information</h6>

                                            <div class="col-md-12">
                                                <table class="table table-bordered" style="text-align: center">
                                                    <tr>
                                                        <td style="background: #ededed">Bank Name</td>
                                                        <td style="background: #ededed">Bank Account No.</td>
                                                        <td style="background: #ededed">Bank Account Name</td>

                                                    </tr>
                                                    <c:forEach items="${bank}" var="bb" >
                                                        <tr>
                                                            <td>${bb.bankName}</td>
                                                            <td>${bb.bankAccNo}</td>
                                                            <td>${bb.bankAccName}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                    <div align="center" style="margin-bottom: 20px">
                                        <a href="Transfer?id=${order.orderId}"><input type="button" class="btn btn-warning" value="Order Payment"></a> 
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="panel panel-default col-md-4" style="margin-left: 45px ">
                                        <h6 class="col-md-12 panel-heading">Tranfer Information</h6>
                                        <div class="col-md-12">
                                            <table class="table table-bordered" style="text-align: center">
                                                <tr>
                                                    <td style="background: #ededed">Transfer Date</td>
                                                    <td>Date</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #ededed">Transfer Time</td>
                                                    <td>Time</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #ededed">Amount</td>
                                                    <td>Amount</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel panel-default col-md-4" style="margin-left: 25px ">
                                        <h6 class="col-md-12 panel-heading">Shipping Address</h6>
                                        <div class="col-md-12">
                                            ${add.address}<br>
                                            ${add.canton}<br>
                                            ${add.provice}, ${add.post}
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${order.status=='shipping' || order.status=='completed'}"><div class="col-md-3">
                                                <a href="printnaja.jsp" target="_blank"><span class="glyphicon glyphicon-print"></span></a>
                                                <!--<form action="ViewFeedback" method="get"><input type="hidden" name="orderid" value="${order.orderId}"/>
                                                    <input type="hidden" name="url"/>-->
                                                    <button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Feedback</button><!--</form>-->
                                            </div></c:when></c:choose>
                                            <div class="panel panel-info col-md-8 " style="margin-left: 170px ">
                                                <h6 class="col-md-12 panel-heading" align="center">Status Enter EMS</h6>
                                                <div class="col-md-12" align="center" style="margin-bottom: 20px">
                                                    <input type="text" class="form-control" placeholder="Tranfer Time" name="ems" value="${order.ems}" disabled>
                                        </div>
                                        <!--<div align="center" style="margin-bottom: 20px">
                                            <a href="showems.html" class="btn btn-info">Submit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="" class="btn btn-default">Reset</a>
                                        </div>-->
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${order.status == 'rejected' || (order.payment == null && order.slip == null)}" >
                                    <div class="panel panel-info col-md-5 " style="margin-left: 380px ">
                                            <h6 class="col-md-12 panel-heading" align="center">Status</h6>
                                            <div class="col-md-12" align="center" style="margin-bottom: 20px">
                                                Waiting for payment
                                            </div>
                                        </div>
                                </c:when><c:otherwise>
                                    <div class="panel panel-default col-md-4" style="margin-left: 45px ">
                                        <h6 class="col-md-12 panel-heading">Tranfer Information</h6>
                                        <div class="col-md-12">
                                            <table class="table table-bordered" style="text-align: center">
                                                <tr>
                                                    <td style="background: #ededed">Transfer Date</td>
                                                    <td>วน</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #ededed">Transfer Time</td>
                                                    <td>วน</td>
                                                </tr>
                                                <tr>
                                                    <td style="background: #ededed">Amount</td>
                                                    <td>วน</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="panel panel-default col-md-4" style="margin-left: 25px ">
                                        <h6 class="col-md-12 panel-heading">Shipping Address</h6>
                                        <div class="col-md-12">
                                            ${add.address}<br>
                                            ${add.canton}<br>
                                            ${add.provice}, ${add.post}
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${order.status=='shipping' || order.status=='completed'}">
                                            <div class="col-md-3">
                                                <a href="printnaja.jsp" target="_blank"><span class="glyphicon glyphicon-print"></span></a>
                                                <%--<form action="ViewFeedback" method="get"><input type="hidden" name="orderid" value="${order.orderId}"/>
                                                    <input type="hidden" name="url"/>--%>
                                                    <button class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Feedback</button></form>
                                            </div></c:when></c:choose>
                                    <form action="OrderFinish" method="get" ><input type="hidden" name="orderid" value="${order.orderId}" />
                                        <div class="panel panel-info col-md-8 " style="margin-left: 170px ">
                                            <h6 class="col-md-12 panel-heading" align="center">Status Enter EMS</h6>
                                            <div class="col-md-12" align="center" style="margin-bottom: 20px">
                                                <c:choose><c:when test="${order.ems==null}">
                                                        <input type="text" class="form-control" placeholder="Enter EMS" name="ems" >
                                                        <div align="center" style="margin-bottom: 20px">
                                                            <button class="btn btn-info">Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default">Reject</button>
                                                        </div></c:when>
                                                    <c:otherwise><input type="text" class="form-control" name="ems" value="${order.ems}" disabled></c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div></form>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                </div>
            </div>
        </div>

        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <%--<c:choose>
                        <c:when test="${feba==null}">--%>
                            <form action="AddFeedback" method="get"><input type="hidden" name="id" value="${order.orderId}" />
                                <input type="hidden" name="url" />
                                <div class="form-horizontal" style="text-align: center">                               
                                    <h4 class="col-md-12">Feedback</h4>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">
                                        </label>
                                        <div class="col-sm-6">
                                            <textarea class="form-control" name="comment" rows="4" cols="50" required></textarea>
                                            <div class="rating">
                                                <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                                                <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                                <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                                                <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                                                <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">

                                            <button type="submit" class="btn btn-primary">Add</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </form>
                        <%--</c:when>
                        <c:otherwise>
                            <div class="form-horizontal" style="text-align: center">                               
                                <h4 class="col-md-12">Feedback</h4>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">
                                    </label>
                                    <div class="col-sm-6">
                                        <textarea class="form-control" name="comment" rows="4" cols="50" value="${feba.comment}" disabled=""></textarea>
                                        <div class="rating">
                                            <input type="radio" id="star${feba.rate}" name="rating" value="${feba.rate}" /><label for="star${feba.rate}" title="">${feba.rate} stars</label>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
    
                                        <button type="submit" class="btn btn-primary">Add</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>--%>
                        </div>
                    </div>
                </div>                
                <!--</div>-->

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
                <script src="http://vjs.zencdn.net/4.3/video.js"></script>
                <script src="js/application.js"></script>
                <script>
                    $(function() {
                        //$('.ui.accordion').accordion();
                        $('input[name=url]').val((window.location.href.toString()));
                    });

        </script>
<!--                <script type="text/javascript">
                    $(function() {
                        if (getParameterByName("show") == 'modal') {
                            $('.bs-example-modal-lg').modal();
                        }
                    });

                    function getParameterByName(name) {
                        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                                results = regex.exec(location.search);
                        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
                    }
                </script>-->

        <jsp:include page="footer.jsp"/>
    </body>
</html>
