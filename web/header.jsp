<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $('#ddlDemo').keyup(function(event) {
if(event.which==13)
{
  var text = $(this).val();
  alert(text);
}

});
</script>
<form class="navbar-form navbar-right"  action="SearchProductServlet" role="search" method="post">
    <div class="row" >
        <div class="col-md-2">
            <select name="herolist" id="ddlDemo" class="select-block">
                <option value="" >Choose Category</option>
                <c:forEach items="${cate}" var="entry">
                    <option value="${entry.key.cateID}">${entry.key.cateName}</option>
                </c:forEach>
            </select>
        </div>
        <!--<input name="herolist" type="hidden" value="">-->
        <div class="col-md-10">
            <div class="form-group">
                <div class="input-group">
                    <input class="form-control" id="navbarInput-01" name="id" type="search" placeholder="Search">
                    <span class="input-group-btn">
                        <input type="hidden" name="x" value="0">
                        <input type="hidden" name="y" value="12">
                        <input type="hidden" name="s" value="a">
                        <button type="submit" class="btn"><span class="fui-search"></span></button>
                    </span>
                </div>
            </div>
        </div>
    </div>
</form>
