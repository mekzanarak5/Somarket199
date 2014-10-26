<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Bank Account</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo_1.jsp"/>
            </div>
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li class="active">My Bank Account</li>
                    </ol>
                    </font>
                </div>      
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <a href="ShowAddressServlet?id=${user.account_Id}"><button type="button" class="btn btn-default">Address</button></a>
                            <a href="ShowBankServlet?id=${user.account_Id}"><button type="button" class="btn btn-primary">Bank Account</button></a>
                        </div>
                        <div class="form-horizontal">
                            <div class="row">
                                <div id="cbp-vm" class="cbp-vm-switcher">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <h5>My Bank Account</h5>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-xs btn-primary" style="margin-left: -80px;margin-top: 20px" data-toggle="modal" data-target=".bs-example-modal-lg">+</button>
                                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <form action="AddBank" method="get">
                                                            <div class="form-horizontal" style="text-align: center">                               
                                                                <h4 class="col-md-12">Add New Bank Account</h4>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Name</label>
                                                                    <div class="col-sm-4">
                                                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                                                        <select class="form-control" name="bankname">
                                                                            <option value="" selected>--------- เลือกธนาคาร ---------</option>
                                                                            <option value="ธนาคารกรุงเทพ">ธนาคารกรุงเทพ</option>
                                                                            <option value="ธนาคารกรุงศรีอยุธยา">ธนาคารกรุงศรีอยุธยา</option>
                                                                            <option value="ธนาคารกสิกรไทย">ธนาคารกสิกรไทย</option>
                                                                            <option value="ธนาคารเกียรตินาคิน">ธนาคารเกียรตินาคิน</option>
                                                                            <option value="ธนาคารซีไอเอ็มบีไทย">ธนาคารซีไอเอ็มบีไทย</option>
                                                                            <option value="ธนาคารทหารไทย">ธนาคารทหารไทย</option>
                                                                            <option value="ธนาคารทิสโก้">ธนาคารทิสโก้</option>
                                                                            <option value="ธนาคารไทยพาณิชย์">ธนาคารไทยพาณิชย์</option>
                                                                            <option value="ธนาคารไทยเครดิตเพื่อรายย่อย">ธนาคารไทยเครดิตเพื่อรายย่อย</option>
                                                                            <option value="ธนาคารธนชาต">ธนาคารธนชาต</option>
                                                                            <option value="ธนาคารยูโอบี">ธนาคารยูโอบี</option>
                                                                            <option value="ธนาคารแลนด์ แอนด์ เฮาส์">ธนาคารแลนด์ แอนด์ เฮาส์</option>
                                                                            <option value="ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย)">ธนาคารสแตนดาร์ดชาร์เตอร์ด (ไทย)</option>
                                                                            <option value="ธนาคารกรุงไทย">ธนาคารกรุงไทย</option>
                                                                            <option value="ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย">ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย</option>
                                                                            <option value="ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร">ธนาคารเพื่อการเกษตรและสหกรณ์การเกษตร</option>
                                                                            <option value="ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย">ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย</option>
                                                                            <option value="ธนาคารออมสิน">ธนาคารออมสิน</option>
                                                                            <option value="ธนาคารอาคารสงเคราะห์">ธนาคารอาคารสงเคราะห์</option>
                                                                            <option value="ธนาคารอิสลามแห่งประเทศไทย">ธนาคารอิสลามแห่งประเทศไทย</option>
                                                                            <option value="ธนาคารไอซีบีซี (ไทย)">ธนาคารไอซีบีซี (ไทย)</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Account No.</label>
                                                                    <div class="col-sm-4">
                                                                        <input type="text" class="form-control" placeholder="Bank Account No." name="no" required>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Account Name</label>
                                                                    <div class="col-sm-4">
                                                                        <input type="text" class="form-control" placeholder="Bank Account Name" name="name" required>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-sm-offset-2 col-sm-10">

                                                                        <button type="submit" class="btn btn-primary">Add</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <table class="table table-striped" id="table6" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                            <td>Bank Name</td>
                                            <td>Bank Account No.</td>
                                            <td>Bank Account Name</td>
                                            <td>Manage Bank Account</td>
                                        </tr>
                                        <c:forEach items="${bank}" var="a">
                                            <tr>
                                                <td>${a.bankName}</td>
                                                <td>${a.bankAccNo}</td>
                                                <td>${a.bankAccName}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-info" onclick="window.location.href = 'EditShowBank?bankid=${a.bank_Id}'">Edit</button>
                                                        <!--<button class="btn btn-danger" onclick="window.location.href = 'DeleteBankServlet?id=${a.bank_Id}&acctid=${user.account_Id}'">Delete</button>-->
                                                        <a href="DeleteBankServlet?id=${a.bank_Id}&acctid=${user.account_Id}" class="btn btn-danger" onclick="return confirm('Are you sure ?');">Delete</a>
                                                    </div></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--<script src="js/jquery-1.8.3.min.js"></script>-->
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/flatui-checkbox.js"></script>
        <script src="js/flatui-radio.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <script language="javascript" type="text/javascript">
                                                            //<![CDATA[  
                                                            var table6_Props = {
                                                                paging: true,
                                                                paging_length: 10,
                                                                rows_counter: true,
                                                                rows_counter_text: "Rows:",
                                                            };
                                                            var tf6 = setFilterGrid("table6", table6_Props);
                                                            //]]>  
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
