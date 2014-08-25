<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="profile.jsp">${user.username}</a>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header pull-right">
            <form class="navbar-form navbar-left" role="search">

                <a href="Login.jsp" class="btn btn-info">Login</a>
                <a href="Register.jsp" class="btn btn-warning">Register</a>
                <a href="profile.jsp" style="margin-top:20px"><img src="img/face.png" width="30" height="30" style="size:" /></a>

            </form>
        </div>
    </div>
</nav>