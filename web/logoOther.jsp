<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Message"%>
<%@page import="model.Accounts"%>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<%
    Accounts user = (Accounts) session.getAttribute("user");
%>

<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title ">${showName.username}</h3>
    </div>
    <font size="2">
        <div class="panel-body">
            <ul class="nav nav-sidebar ">
                <li><a href="ShowSellServletOther?id=${showName.account_Id}">Sell List</a></li>
                <li><a href="feedback.jsp">Feedback</a></li>
            </ul>
        </div>
    </font>
</div>