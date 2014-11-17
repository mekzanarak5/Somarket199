<%@page import="model.order"%>
<%@page import="model.Accounts"%>
<%@page import="model.Message"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Accounts user = (Accounts) session.getAttribute("user");
%>
<script>
    function myFunction() {
        alert("${msg1}");
    }
</script>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<nav class="navbar navbar-fixed-top" role="navigation">
    <div class="container-fluid" style="background-color: white;box-shadow: 0px 2px 5px gray">
        <!-- Brand and toggle get grouped for better mobile display -->
        <c:choose>
            <c:when test="${user == null}">
                <c:set var="username" value="Guest"/>
                <c:set var="loginAndOut" value="Login.jsp"/>
                <div class="btn-group navbar-header navbar-right" style="margin-right: 75px">
                    <ul class="nav navbar-nav">
                        <li><a href="ViewCart"><span class="glyphicon glyphicon-shopping-cart"></span>
                                <c:choose>
                                    <c:when test="${cart!=null && cart.unitItem!=0}">
                                        <span class="badge btn-danger">${cart.unitItem}</span>
                                    </c:when>
                                </c:choose>
                            </a>
                        </li>
                        <li style="margin-top: 12px">Hey!, Whats up? Guy</li>
                        <li><a href="Login.jsp">Login</a></li>
                        <li style="margin-top: 12px">or</li>
                        <li><a href="Register.jsp">Register</a></li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <c:set var="username" value="${user.username}"/>
                <c:set var="loginAndOut" value="Logout"/>
                <!--<a href="profile.jsp"> <span class="fui-user"></span></a>-->
                <!-- Split button -->
                <div class="btn-group navbar-header" style="margin-left: 50px">
                    <ul class="nav navbar-nav">           
                        <c:choose>
                            <c:when test="${msg1 != null}">
                                <li><a href="seachcata" onclick="myFunction()">Post Product</a></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="seachcata">Post Product</a></li>
                                </c:otherwise>
                            </c:choose>
                        <li><a href="ShowSellServlet?id=${user.account_Id}">Sell
                                <%
                                    if (order.findCountSell(user.getUsername()) != 0) {
                                %>
                                <span class="badge btn-danger"><%=order.findCountSell(user.getUsername())%> </span>
                                <%}%>
                            </a>
                        </li>
                        <li><a href="ShowOrder">Buy
                                <%
                                    if (order.findCountBuy(user.getUsername()) != 0) {
                                %>
                                <span class="badge btn-danger"><%=order.findCountBuy(user.getUsername())%> </span>
                                <%}%>
                            </a>
                        </li>

                    </ul>
                </div>
                <div class="btn-group navbar-header navbar-right" style="margin-right: 75px">
                    <ul class="nav navbar-nav">

                        <li><a href="ViewCart"><span class="glyphicon glyphicon-shopping-cart"></span>
                                <c:choose>
                                    <c:when test="${cart!=null && cart.unitItem!=0}">
                                        <span class="badge btn-danger">${cart.unitItem}</span>
                                    </c:when>
                                </c:choose>
                            </a>
                        </li>
                        <li><button class="btn dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" style="background-color: white;margin-top: 5px"><a href="profile.jsp"> ${user.username}</a> <span class="caret"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="profile.jsp">View Profile</a></li>
                                    <c:choose>
                                        <c:when test="${msg1 != null}">
                                        <li style="color: #FFB70A"><a href="seachcata" style="color: #FFB70A" onclick="myFunction()">Post Product</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li style="color: #FFB70A"><a href="seachcata" style="color: #FFB70A">Post Product</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                <li><a href="ShowPmServlet?id=${user.account_Id}">Inbox 
                                        <%
                                            if (Message.findCount(user.getAccount_Id()) != 0) {
                                        %>
                                        <span class="badge btn-danger"><%=Message.findCount(user.getAccount_Id())%> </span>
                                        <%}%>
                                    </a>
                                </li>        
                                <li><a href="ShowOrder">Buy List</a></li>
                                <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List</a></li>
                                <li><a href="ShowWishlistServlet?id=${user.account_Id}">Wish List</a></li>
                                <li><a href="ViewFeedback">Feedback</a></li>
                                <li><a href="editProfile.jsp">Edit Profile</a></li>
                                <li><a href="ShowAddressServlet?id=${user.account_Id}">Address / Bank Account</a></li>
                                <li><a href="changePassword.jsp">Change Password</a></li>
                                <li style="color: red"><a href="${loginAndOut}" style="color: red">Logout</a></li>
                            </ul>
                        </li>
                        <li><a href="ShowPmServlet?id=${user.account_Id}"><span class="glyphicon glyphicon-envelope"></span> 
                                <%
                                    if (Message.findCount(user.getAccount_Id()) != 0) {
                                %>
                                <span class="badge btn-danger"><%=Message.findCount(user.getAccount_Id())%> </span>
                                <%}%>
                            </a>
                        </li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</nav>