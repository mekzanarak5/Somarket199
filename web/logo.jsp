<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="index.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>

<div id='cssmenu'>
    <ul>
        <c:forEach items="${cate}" var="entry">
            <li class='active has-sub'><a href='SearchProductServlet?id=&herolist=${entry.key.cateID}&x=0&y=6&s=a'><span>${entry.key.cateName}</span></a>
                <ul style="border: 1px #00a45b double">
                    <c:forEach items="${entry.value}" var="sub_entry">
                        <li>
                            <a href='SearchProductServlet?id=&herolist=${sub_entry.cateID}&x=0&y=6&s=a'><span>${sub_entry.cateName}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>
</div>