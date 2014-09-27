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
        <h3 class="panel-title ">My Account</h3>
    </div>
    <div class="panel-body">
        <ul class="nav nav-sidebar ">
            <li style="color: #FFB70A"><a href="seachcata" style="color: #FFB70A">Post</a></li>
            <li><a href="ShowPmServlet?id=${user.account_Id}">Private Message <span class="badge btn-default"><%=Message.findCount(user.getAccount_Id())%> </span></a></li>
            <li><a href="editProfile.jsp">Edit</a></li>
            <li><a href="changePassword.jsp">Change Password</a></li>
            <li><a href="ShowOrder">Buy List</a></li>
            <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List</a></li>
            <li><a href="ShowAddressServlet?id=${user.account_Id}">Profile</a></li>
            <li><a href="ShowWishlistServlet?id=${user.account_Id}">Wish List</a></li>
            <li><a href="feedback.jsp">Feedback</a></li>
            <li style="color: red"><a href="${loginAndOut}" style="color: red">Logout</a></li>
        </ul>
    </div>
</div>
