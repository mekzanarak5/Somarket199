<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="SearchProductServlet" method="get">
    <div class="row">
        <div class="col-xs-7">
            <div class="form-group">
                <input type="text" value="" name="id" placeholder="Inactive" class="form-control" />
            </div>
        </div>
        <div class="col-xs-3">
            <select name="herolist" class="select-block">
                <option value="" selected>Choose Category</option>
                <c:forEach items="${cateID}" var="a">
                    <option value="${a.cateID}">${a.cateName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-xs-2">
            <input type="hidden" name="x" value="0">
            <input type="hidden" name="y" value="5">
            <button type="submit" class="btn btn-block btn-lg btn-info">Search</button>
        </div>
    </div>
</form>
