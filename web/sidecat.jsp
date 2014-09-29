<%@page import="java.util.*"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Map<Category, List<Category>> c = (Map<Category, List<Category>>) session.getAttribute("cate");
%>
<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
    
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
        <input type="submit" class="btn btn-info" value="Search">
    </div>
</form><br><br><br><br><br><br>

<c:forEach items="${cate}" var="entry">
    <ul class="nav nav-pills nav-stacked btn-sm">
        <li class="active">
            <a href="#">
                <span class="badge pull-right">0</span>
                ${entry.key.cateName}
            </a>
        </li>
        <c:forEach items="${entry.value}" var="sub_entry">
            <li>
                <a href="#">
                    <span class="badge pull-right">0</span>
                    ${sub_entry.cateName}
                </a>
            </li>
        </c:forEach>
    </ul>
</c:forEach>


