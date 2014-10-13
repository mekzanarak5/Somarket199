
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Product</title>
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
                <jsp:include page="logo.jsp"/>
            </div>
            <div class="col-xs-9">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">Product</li>
                    </ol>
                </div>  
                <div class="col-md-12" align="center">
                    <div class="col-md-5">
                        <img name="Image" class="rounded" src="${pic1.pathFile}" width="250" height="250" ><br /><br /> 
                        <c:forEach items="${pic}" var="a">
                            <a onclick="ChangeImage('${a.pathFile}')"><img src="${a.pathFile}" width="50" height="50"></a> 
                            </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <a href="#" class="list-group-item active">
                            Price ${showDetail.price}
                        </a>
                        <a href="ShowAccount?acctid=${showName.account_Id}" class="list-group-item">
                            <h6 class="list-group-item-heading">${showName.username} ( 999<span class="glyphicon glyphicon-star"></span> )</h6>
                        </a>
                        <div class="list-group-item">
                            <h6 class="list-group-item-heading">Phone No. ${showName.phone}</h6>
                        </div>
                        <a href="GetReceiverServlet?acctid=${showName.account_Id}" class="list-group-item">
                            <h6 class="list-group-item-heading">Send Private Message</h6>
                        </a>
                        <div class="list-group-item">
                            <div class="fb-share-button" data-href="<%=request.getRequestURI()%>"></div>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-1">
                        <c:choose>
                            <c:when test="${user.account_Id!=showName.account_Id || user==null}" >
                                <a href="AdminGetProId?proid=${showDetail.productNO}"><button type="button" class="btn btn-danger">Report</button>
                                </a>
                                <a href="AddWishList?acctid=${user.account_Id}&name=${showDetail.name}&price=${showDetail.price}&seller=${showName.username}&id=${showDetail.productNO}&accid=${showName.account_Id}"><button type="button" class="btn btn-warning" style="margin-top: 5px">Add to WishList<span class="fui-heart"></button>
                                </a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 50px">
                    <form action="AddToCart" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Product</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" placeholder="Name of product" name="name" value="${showDetail.name}" disabled="disabled">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-7">
                                <textarea class="form-control" name="des" rows="3" disabled>${showDetail.description}</textarea> 
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Quatity</label>
                            <div class="col-sm-3">
                                <input type="number" class="form-control" placeholder="Quatity" value="1" required>
                            </div>
                        </div>
                        <c:choose><c:when test="${user.account_Id!=showName.account_Id || user==null}" >
                                <div class="well col-md-6" style="margin: auto;float: none">
                                    <!--<form action="AddToCart" method="get"> -->
                                    <input type="hidden" name="url" />
                                    <input type="hidden" name="productId" value="${showDetail.productNO}" />
                                    <input type="hidden" name="acctid" value="${showName.account_Id}" />
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Add To Cart">
                                </c:when></c:choose>
                            <%--<a href="AddToCart?productId=${showDetail.productNO}&acctid=${showName.account_Id}">--%><!--</a>-->
                            <!--</form>-->
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script language="JavaScript">
            function ChangeImage(image) {
                document.Image.src = image;
            }
        </script> 
        <script src="js/jasny-bootstrap.min.js"></script>
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
        <div id="fb-root"></div>
        <script>
            $(function() {
                //$('.ui.accordion').accordion();
                $('input[name=url]').val((window.location.href.toString()));
            });

        </script>
        <script>(function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));</script>
            <jsp:include page="footer.jsp"/>
    </body>
</html>
