<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Message"%>
<%@page import="model.Accounts"%>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<%@taglib uri="/WEB-INF/tlds/mf.tld" prefix="wtf" %>
<%
    Accounts user = (Accounts) session.getAttribute("user");
%>

<a href="index.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title ">${showName.username}</h3>
        <c:set value="${wtf:feedAVG(showName.username)}" var="n" />
        <c:set value="${wtf:feedcount(showName.username)}" var="m" />

        <c:choose>
            <c:when test="${n==5.0}">
                <c:forEach begin="1" end="5">
                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                </c:forEach>    
                (${m})
            </c:when>
            <c:when test="${n>=4}">
                <c:forEach begin="1" end="4">
                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                </c:forEach>
                <c:forEach begin="1" end="1">
                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>
                </c:forEach>    
                (${m})
            </c:when>
            <c:when test="${n>=3}">
                <c:forEach begin="1" end="3">
                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                </c:forEach>
                <c:forEach begin="1" end="2">
                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>
                </c:forEach>
                (${m})
            </c:when>
            <c:when test="${n>=2}">
                <c:forEach begin="1" end="2">
                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                </c:forEach>
                <c:forEach begin="1" end="3">
                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>
                </c:forEach>
                (${m})
            </c:when>
            <c:when test="${n>=1}">
                <c:forEach begin="1" end="1">
                    <span class="glyphicon glyphicon-star" style="color: #ffcc66"></span>
                </c:forEach>
                <c:forEach begin="1" end="4">
                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>
                </c:forEach>
                (${m})
            </c:when>
            <c:when test="${n==0}">
                <c:forEach begin="1" end="5">
                    <span class="glyphicon glyphicon-star-empty" style="color: #ffcc66"></span>
                </c:forEach>
                (${m})
            </c:when>
        </c:choose><br>
        <font size="2">${n} out of 5 stars
        </font>
    </div>
    <font size="2">
        <div class="panel-body">
            <ul class="nav nav-sidebar ">
                <li><a href="ShowSellServletOther?id=${showName.account_Id}">Sell List</a></li>
                <li><a href="ViewFeedback?facct=${showName.username}">Feedback</a></li>
            </ul>
        </div>
    </font>
</div>