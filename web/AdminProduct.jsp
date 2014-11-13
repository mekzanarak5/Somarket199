<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li class="active"><a href="AdminProduct.jsp">Product</a></li>
                <li><a href="AdminAccount.jsp">Account</a></li>
                <li><a href="AdminOrder.jsp">Order</a></li>
                <li><a href="AdminReport.jsp">Lawless Report</a></li>
                <li><a href="AdminChartRegis?year=2014">Report Chart</a></li>
                <li><a href="AdminSetting.jsp">Setting</a></li>
            </ul>
            <hr>
            <div class="row">
                <h5 class="col-md-2">Product</h5>
                <div class="col-md-12">
                    <!--<input type="text" id="search" placeholder="Type to search">-->
                    <table class="table table-striped display" id="table6" cellspacing="0" style="text-align: center;">
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
                                <td>${a.cateName}</td>
                                <td>${a.name}</td>
                                <td>${a.price}0</td>
                                <td>${a.createOn}</td>
                                <td width="20%">
                                    <div class="btn-group">                                              
                                        <a href="AdminShowCategory?proid=${a.productNO}"><button class="btn btn-xs btn-primary">Edit</button></a>
                                        <a href="AdminDeleteProduct?id=${a.productNO}"><button class="btn btn-xs btn-danger">Delete</button></a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>                           
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
