<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header pull-right">
            <form class="navbar-form navbar-left" role="search">
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
                        <a href="profile.jsp">${user.username}</a>
                        <a href="seachcata" class="btn btn-warning" >Post</a>
                        <a href="profile.jsp"><img src="img/face.png" width="30" height="30" style="size:" /></a>
                        <a href="${loginAndOut}" class="btn btn-info" >Logout</a>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </div>
</nav>