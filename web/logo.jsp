<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>

<div id='cssmenu'>
    <ul>
        <c:forEach items="${cate}" var="entry">
            <li class='active has-sub'><a href='SearchProductServlet?id=${pro}&herolist=1&x=0&y=5&s=a'><span>${entry.key.cateName}</span></a>
                <ul>
                    <c:forEach items="${entry.value}" var="sub_entry">
                        <li><a href='#'><span>${sub_entry.cateName}</span></a></li>
                                </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>
</div>