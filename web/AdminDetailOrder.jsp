<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Admin</title>
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
            .dataTables_filter label {
                float:right
            }

            .pagination {
                margin-top:0;
                float:right;
            }
        </style>
    </head>
    <%--<jsp:include page="header1.jsp"/>--%>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;">
        <div style="margin-bottom: 30px">
        </div>
        <div class="row col-md-12">
            <div class="col-md-1" style="margin-top: 5px;margin-right: -70px">
                <a href="index.jsp"><span class="glyphicon glyphicon-chevron-left"></span></a>
            </div>
            <div class="col-md-3">
                <h4>Administrator Page</h4>
            </div>
            <div class="col-md-1" style="margin-top: 5px;margin-left: -50px">
                <a href="AdminShowReport"><span class="glyphicon glyphicon-home"></span>
                </a>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 30px">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <li><a href="AdminProduct.jsp">Product</a></li>
                <li><a href="AdminAccount.jsp">Account</a></li>
                <li class="active"><a href="AdminOrder.jsp">Order</a></li>
                <li><a href="AdminReport.jsp">Lawless Report</a></li>
                <li><a href="AdminChartRegis?year=2014">Report Chart</a></li>
                <li><a href="AdminSetting.jsp">Setting</a></li>
            </ul>
            <hr>
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
                            <c:when test="${order.status == 'invalid' || order.paydate == null}" >
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
                                            <td style="background: #ededed">Transfer Date<br>Transfer Time<br>Amount</td>
                                            <td>${order.paydate}<br>${order.paytime}<br>${order.payamount}</td>
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
                                        <form action="ViewFeedback" method="get"><input type="hidden" name="orderid" value="${order.orderId}"/>
                                            <input type="hidden" name="url"/>
                                            <button class="btn btn-primary">Feedback</button></form>
                                    </div></c:when></c:choose>
                                    <div class="panel panel-info col-md-8 " style="margin-left: 170px ">
                                        <h6 class="col-md-12 panel-heading" align="center">Status Enter EMS</h6>
                                        <div class="col-md-12" align="center" style="margin-bottom: 20px">
                                            <input type="text" class="form-control" name="ems" value="${order.ems}" disabled>
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
                        <c:when test="${order.status == 'invalid' || order.paydate == null}" >
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
                                            <td style="background: #ededed">Transfer Date<br>Transfer Time<br>Amount</td>
                                            <td>${order.paydate}<br>${order.paytime}<br>${order.payamount}</td>
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
                                        <form action="ViewFeedback" method="get"><input type="hidden" name="orderid" value="${order.orderId}"/>
                                            <input type="hidden" name="url"/>
                                            <button class="btn btn-primary">Feedback</button></form>
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
    var $rows = $('#table tr');
    $('#search').keyup(function() {
        var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

        $rows.show().filter(function() {
            var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
            return !~text.indexOf(val);
        }).hide();
    });
</script>
<script language="javascript" type="text/javascript">
    //<![CDATA[  
    var table6_Props = {
        paging: true,
        paging_length: 10,
        rows_counter: true,
        rows_counter_text: "Rows:",
    };
    var tf6 = setFilterGrid("table6", table6_Props);
    //]]>  
</script>  
<script language="javascript" type="text/javascript">
//<![CDATA[  
    var table10_Props = {
        paging: true,
        paging_length: 5,
        col_2: 'select',
        col_3: 'select',
        sort_num_asc: [2],
        sort_num_desc: [3],
        refresh_filters: true
    };
    var tf10 = setFilterGrid("table10", table10_Props);
//]]>  
</script>
<script language="javascript" type="text/javascript">
//<![CDATA[  
    var table9_Props = {
        paging: true,
        paging_length: 2,
        results_per_page: ['# rows per page', [2, 4, 6]],
        rows_counter: true,
        rows_counter_text: "Rows:",
        btn_reset: true,
        btn_next_page_html: '<a href="javascript:;" style="margin:3px;">Next ></a>',
        btn_prev_page_html: '<a href="javascript:;" style="margin:3px;">< Previous</a>',
        btn_last_page_html: '<a href="javascript:;" style="margin:3px;"> Last >|</a>',
        btn_first_page_html: '<a href="javascript:;" style="margin:3px;"><| First</a>',
        loader: true,
        loader_html: '<h4 style="color:red;">Loading, please wait...</h4>'
    };
    var tf9 = setFilterGrid("table9", table9_Props);
//]]>  
</script> 
</body>
</html>
