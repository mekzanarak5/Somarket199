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
    </head>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;">
        <div style="margin-bottom: 30px">
        </div>
        <div class="row col-md-12">
            <div class="col-md-1" style="margin-top: 20px;margin-right: -70px">
                <a href="home.jsp"><span class="glyphicon glyphicon-chevron-left"></span></a>
            </div>
            <div class="col-md-3">
                <h4>Administrator Page</h4>
            </div>
            <div class="col-md-1" style="margin-top: 20px;margin-left: -50px">
                <a href="AdminShowReport"><span class="glyphicon glyphicon-home"></span>
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12"> 
                <form action="AdminEditCategory" method="get">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-12"><h5>Edit Category#${pro.productNO}</h5><h6> (Seller: ${pro.username})</h6>
                            <h6> (Product Name: ${pro.name})</h6></label>
                        
                        <div class="row">
                            <div class="col-sm-offset-1 col-md-3">
                                <select id="mark" class="form-control">
                                    <option value="">--</option>
                                    <c:forEach items="${cate}" var="entry">
                                        <option value="${entry.key.cateID}">${entry.key.cateName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3" >
                                <select id="series" class="form-control" name="cata">
                                    <option value="">--</option>
                                    <c:forEach items="${cate}" var="entry">
                                        <c:forEach items="${entry.value}" var="sub_entry">
                                            <option value="${sub_entry.cateID}" class="${entry.key.cateID}">${sub_entry.cateName}</option>
                                        </c:forEach>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-3" >
                                <input type="hidden" name="proid" value="${pro}">
                                <button type="submit" class="btn btn-primary">Change</button>
                            </div>
                        </div>
                    </div>
                </form>
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
                $("#series").chainedTo("#mark");
            });
        </script>

    </body>
</html>
