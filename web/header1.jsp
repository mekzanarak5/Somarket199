<%@page import="model.Accounts"%>
<%@page import="model.Message"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Accounts user = (Accounts) session.getAttribute("user");
%>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header pull-right" style="margin-top: 5px">
                <c:choose>
                    <c:when test="${user == null}">
                        <c:set var="username" value="Guest"/>
                        <c:set var="loginAndOut" value="Login.jsp"/>
                        <a href="${loginAndOut}" class="btn btn-info">Login</a>
                        <a href="Register.jsp" class="btn btn-warning">Register</a>
                    </c:when>
                    <c:otherwise>
                        <c:set var="username" value="${user.username}"/>
                        <c:set var="loginAndOut" value="Logout"/>
                        <a href="profile.jsp">${user.dispName} <span class="fui-user"></span></a>
                        <a href="ShowPmServlet?id=${user.account_Id}"><img src="pic/Mail2.png" width="40" height="40" style="size:" /><span class="badge"><%=Message.findCount(user.getAccount_Id())%> </span></a>
                        <a href="ViewCart"><img src="pic/cart.png" width="30" height="30" style="size:" />
                            ${cart!=null?" ( ":""}
                            ${cart!= null? cart.unitItem:""}
                            ${cart!=null?" ) ":""}</a>
                        <a href="seachcata" class="btn btn-warning"  >Post</a>
                        <a href="${loginAndOut}" class="btn btn-danger" >Logout</a>
                    </c:otherwise>
                </c:choose>
        </div>
    </div>
</nav>