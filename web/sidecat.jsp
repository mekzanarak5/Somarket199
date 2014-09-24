<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
    <h6 class="col-md-3">Catagory</h6>
    
    <c:forEach items="${cate}" var="entry">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">${entry.key.cateName}</h3>
            </div>
            <c:forEach items="${entry.value}" var="sub_entry">
                <div class="panel-body">
                    <ul class="nav nav-sidebar">
                        <li>${sub_entry.cateName}</li>
                    </ul>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
    <form action="PriceServlet" method="get">
        <h6 class="col-md-12">Price Range</h6>
        <div class="col-xs-12">
            <div class="row">
                <input type="hidden" name="id" value="${pro}">
                <input type="hidden" name="herolist" value="${cat}">
                <input type="hidden" name="x" value="${x}">
                <input type="hidden" name="y" value="${y}">
                <div class="col-md-6"><input class="form-control col-xs-5 pull-left" type="number" name="price1" size="7"></div>
                <div class="col-md-6"><input class="form-control col-xs-5 pull-right" type="number" name="price2" size="7"></div>
            </div>
        </div>
        <div class="col-xs-7">
            <br>
            <input type="submit" class="btn btn-block btn-lg btn-info" value="Search">
        </div>
    </form>
