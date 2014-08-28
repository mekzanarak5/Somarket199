<%-- 
    Document   : confirmOrder
    Created on : Nov 22, 2013, 2:14:50 AM
    Author     : takelet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="WEB-INF/headerLogout2.jsp"/>
    </head>
    <body>
        <div class="container" style=" width: 55%; margin-top: 150px;" >
            <div class="panel panel-default">
                <div class="panel-heading"><h4 class="panel-title">Your Basic Information</h4></div>
                <table align="center" style="width: 550px">
                    <tr><td><br></td></tr>
                    <tr>
                        <td>Your Username : </td>
                        <td><input class="form-control" type="text" name="user" value="${user.username}" disabled=""</td>
                    </tr>
                    <tr>
                        <td>Your Name : </td>
                        <td><input class="form-control" type="text" name="firstname" value="${user.firstname}" disabled=""></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Your Surname : </td>
                        <td><input class="form-control" type="text" name="surname" value="${user.lastname}" disabled=""></td>
                    </tr>
                    <tr>
                        <td>Your Email :</td>
                        <td><input class="form-control" type="text" name="email" value="${user.email}" disabled=""></td>
                    </tr>
                  <!--  <tr>                    
                        <td></td>
                    <form action="choasenAdd" method="get">
                        <td><select name="showaddress" class="form form-control">
                                <option value="1">Address 1</option>
                                <option value="2">Address 2</option>
                                <option value="3">Address 3</option>
                            </select>
                            <button type="submit" class="btn btn-default">Check Address</button>
                    </form>
                    </td>       
                    </tr>-->
                    <tr>
                    <form action="ToOrder" method="get">
                        <td>Your Address :</td>
                        <td><textarea class="form-control" rows="2" name="address">${user.address}</textarea></td>       
                    </tr>
                    
                    <tr>
                        <td>Your Telephone :</td>
                        <td><input class="form-control" type="telephone" value="${user.phone}" disabled=""></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td></td>                       
                        <td><a href="ViewCart.jsp"><div class="btn btn-default">Back</div></a>
                            <button type="submit" class="btn btn-success">Confirm Information</button ></a>
                        </form>
                        </td>

                    </tr>
                    <tr><td><br></td></tr>
                </table>
            </div>
        </div>
    </body>
</html>
