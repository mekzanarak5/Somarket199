<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
<div style=" border: 1px solid #ffffff;border-radius: 15px;height: 800px;background: #ffffff">
    <h6 class="col-md-3">Catagory</h6>
    <div class="col-md-12">
        <c:forEach items="${cateID}" var="a">
        <div class="ui accordion">
            <div class="active title">
                <i class="dropdown icon"></i>
                ${a.cateName}
            </div>
            <div class="active content">                                    
                <div class="accordion">
                    <div class="active content">
                        <i class="dropdown icon"></i>
                        Level 1A
                    </div>
                </div>
            </div>   
        </div>
        </c:forEach>
    </div>
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
</div>
