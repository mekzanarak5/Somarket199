<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Cart</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>
        <script>

            function function3() {
                type = $("#type").val();

                if (type === "default") {
                    alert("Please Select Type");
                    $("#type").focus().freeze();
                }

                $("#form").submit();
            }


            $(document).ready(function() {

                $("#form").validate({
                    rules: {
                        unit: {
                            required: true,
                            minlength: 1,
                            maxlength: 4,
                            min: 1
                        }
                    }
                });
            });
            jQuery(function($) {
                $("#unit").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#unit').on("paste", function(e)
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
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Cart</li>
                    </ol>
                    </font>
                </div>      
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h5 class="col-md-12">Cart</h5>
                            <form id="form" action="UpdateCart" method="get">
                                <table class="table table-striped" style="text-align: center">
                                    <tr bgColor="#ffffff">
                                        <td>Seller</td>
                                        <td>Pic</td>
                                        <td>Name</td>
                                        <td>Unit Price</td>
                                        <td width="15%">Quantity</td>
                                        <td>Total</td>
                                        <td></td>
                                    </tr>
                                    <c:set var="no" value="1"/>
                                    <c:forEach items="${map}" var="entry">
                                        <c:forEach items="${cart.lineItems}" var="line">
                                            <c:choose>
                                                <c:when test="${entry.key==line.product.acctID}">
                                                    <c:set value="${wtf:getAccountById(line.product.acctID)}" var="n" />
                                                    <tr >
                                                        <td>
                                                            <a href="ShowAccount?acctid=${line.product.acctID}">${n.username}</a>
                                                        </td>
                                                        <td>
                                                            <a href="ShowDetailServlet?productId=${line.product.productNO}&acctid=${line.product.acctID}">
                                                                <img src="${line.product.pathFile}" style="width: 50px; height: 50px;" class="img-rounded"/>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="ShowDetailServlet?productId=${line.product.productNO}&acctid=${line.product.acctID}">
                                                                ${line.product.name}
                                                            </a>
                                                        </td>
                                                        <td><fmt:formatNumber pattern ="#,###.##" value="${line.product.price}" /> ฿</td>
                                                        <td><input type="hidden" value="${line.product.productNO}" name="productId" >
                                                            <input style="text-align:right" id="unit" type="text" maxlength="4" class="form-control" name="unit" size='4' value="${line.unit}" required></td>
                                                        <td><fmt:formatNumber pattern ="#,###.##" value="${line.total}" /> ฿</td>
                                                        <td><a href="RemoveLineItem?productId=${line.product.productNO}"> <div class="btn btn-warning">Remove</div></a></td>
                                                    </tr>
                                                </c:when>
                                            </c:choose>
                                        </c:forEach>
                                        <tr>
                                            <td>TOTAL</td>
                                            <td><fmt:formatNumber pattern ="#,###.##" value="${price[entry.key]}" /> ฿</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><button type="submit" class="btn btn-primary" >Update</button></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </form>
                                    <div class="col-md-4"><h5>Payment Method:</h5></div><div class="col-md-3" style="margin-left: -10%"><p style="margin-top: 17px">Bank Transfer</p></div>
                            <div style="float: right; margin-right: 20px">
                                <a href="ConfirmCart"><input type="button" class="btn btn-danger" value="Check out"></a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<c:forEach items="${map}" var="entry">
            ‡®È“¢Õß : ${entry.key}<br />
            <ul>
                <c:forEach items="${entry.value}" var="product">
                    <c:choose>
                        <c:when test="${entry.key==product.acctID}">
                            <li>${product}</li>
                            </c:when>
                        </c:choose>
                    </c:forEach>
            </ul>
            <hr />
        </c:forEach> --%>

        <!--<script src="js/jquery-1.8.3.min.js"></script>-->
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
        <!--<script>$("#update").click(function() {
                window.location.href = 'UpdateCart';
            });
        </script>-->
        <jsp:include page="footer.jsp"/>
    </body>
</html>