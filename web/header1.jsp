<%@page import="model.Accounts"%>
<%@page import="model.Message"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Accounts user = (Accounts) session.getAttribute("user");
%>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<nav class="navbar navbar-fixed-top" role="navigation">
    <div class="container-fluid" style="background-color: white;box-shadow: 0px 2px 5px gray">
        <!-- Brand and toggle get grouped for better mobile display -->
        <c:choose>
            <c:when test="${user == null}">
                <c:set var="username" value="Guest"/>
                <c:set var="loginAndOut" value="Login.jsp"/>
                <div class="btn-group navbar-header navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="ViewCart"><span class="glyphicon glyphicon-shopping-cart"></span>
                                ${cart!=null?" ( ":""}
                                ${cart!= null? cart.unitItem:""}
                                ${cart!=null?" ) ":""}
                            </a></li>
                        <li><button class="btn btn-sm btn-info" onclick="window.location.href = 'Login.jsp'" style="margin-top: 5px">Login</button></li>
                        <li><button class="btn btn-sm btn-default" onclick="window.location.href = 'Register.jsp'" style="margin-top: 5px">Register</button></li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <c:set var="username" value="${user.username}"/>
                <c:set var="loginAndOut" value="Logout"/>
                <!--<a href="profile.jsp"> <span class="fui-user"></span></a>-->
                <!-- Split button -->
                <div class="btn-group navbar-header">
                    <ul class="nav navbar-nav">           
                        <li><a href="seachcata">Post Product</a></li>
                        <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List</a></li>
                        <li><a href="ShowOrder">Buy List</a></li>
                        <li><a href="ShowPmServlet?id=${user.account_Id}">Inbox <span class="badge btn-default"><%=Message.findCount(user.getAccount_Id())%> </span></a></li>                            
                    </ul>
                </div>
                <div class="btn-group navbar-header navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="ViewCart"><span class="glyphicon glyphicon-shopping-cart"></span>
                                ${cart!=null?" ( ":""}
                                ${cart!= null? cart.unitItem:""}
                                ${cart!=null?" ) ":""}
                            </a></li>
                        <li><button class="btn dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" style="background-color: white;margin-top: 5px"><a href="profile.jsp"> ${user.username}</a> <span class="caret"></span></button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="profile.jsp">View Profile</a></li>
                            <li style="color: #FFB70A"><a href="seachcata" style="color: #FFB70A">Post Product</a></li>
                            <li><a href="ShowPmServlet?id=${user.account_Id}">Message <span class="badge btn-default"><%=Message.findCount(user.getAccount_Id())%> </span></a></li>
                            <li><a href="ShowOrder">Buy List</a></li>
                            <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List</a></li>
                            <li><a href="ShowWishlistServlet?id=${user.account_Id}">Wish List</a></li>
                            <li><a href="feedback.jsp">Feedback</a></li>
                            <li><a href="editProfile.jsp">Edit Profile</a></li>
                            <li><a href="ShowAddressServlet?id=${user.account_Id}">Address / Bank Account</a></li>
                            <li><a href="changePassword.jsp">Change Password</a></li>
                            <li style="color: red"><a href="${loginAndOut}" style="color: red">Logout</a></li>
                        </ul>
                        </li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</nav>