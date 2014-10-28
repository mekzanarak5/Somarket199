<%@page import="model.Accounts"%>
<%@page import="model.Message"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="usernae" value="" />
<c:set var="loginAndOut" value="" />
<footer style=" border: 3px solid #efefef;border-radius: 15px;background: #efefef;width: 1260px;margin-left: 10px;margin-top: 20px;font-size: 10px">
    <ul style="margin-top: 20px">
        <li>
            <p class="clients" style="font-size: 12px">Home</p>
            <a  href="#">Company Name <i>&copy; 2013</i></a>
        </li>
        <li>
            <p class="clients" style="font-size: 12px">Category</p>

            <ul>
                <li><a href="#">Computer</a></li>
                <li><a href="#">Mobile & Tablet</a></li>
                <li><a href="#">Camera</a></li>
            </ul>
        </li>
        <li>
            <p class="clients" style="font-size: 12px">Reach us</p>

            <ul>
                <li><a href="https://mail.google.com/">Gmail</a></li>
                <li><a href="https://twitter.com/?lang=th">Twitter</a></li>
                <li><a href="https://th-th.facebook.com/">Facebook</a></li>
            </ul>
        </li>
        <li>
            <p class="clients" style="font-size: 12px">Contact</p>

            <ul>
                <li><a href="adminLogin.jsp">Admin</a></li>
                <li><a href="#">Support Center</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </li>
    </ul>

</footer>
