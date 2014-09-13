<%-- 
    Document   : Login
    Created on : Aug 7, 2014, 2:11:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Social Market | Edit Bank Account</title>
        <meta name="description" content="Flat UI Kit Free is a Twitter Bootstrap Framework design and Theme, this responsive framework includes a PSD and HTML version."/>

        <meta name="viewport" content="width=1000, initial-scale=1.0, maximum-scale=1.0">

        <jsp:include page="cssup.jsp"/>
    </head>
    <body style="background-color: gainsboro;max-width: 1024px;margin: auto">
        <jsp:include page="header1.jsp"/>
        <div class="col-md-3">
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-md-9">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Profile</li>
                    <li class="active">My Bank Account</li>
                    <li class="active">Edit Bank Account</li>
                </ol>
            </div>
            <div class="col-xs-12" style="margin:auto;">
                <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: 450px;background: #FFFFFF">
                    <div class="row">
                        <h3 class="col-md-12">Edit Bank Account</h3>
                        <form action="EditBankServlet" method="get">
                            <div class="form-horizontal" style="text-align: center">                               
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Name</label>
                                    <div class="col-sm-4">
                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                        <input type="hidden" name="bankid" value="${find.bank_Id}">
                                        <input type="text" class="form-control" value="${find.bankName}" name="bankname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Account No.</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" value="${find.bankAccNo}" name="no" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-3 control-label">Bank Account Name</label>
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" value="${find.bankAccName}" name="name" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-8">

                                        <button type="submit" class="btn btn-primary">Edit</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-1.8.3.min.js"></script>
        <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/jquery.ui.touch-punch.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap-switch.js"></script>
        <script src="js/flatui-checkbox.js"></script>
        <script src="js/flatui-radio.js"></script>
        <script src="js/jquery.tagsinput.js"></script>
        <script src="js/jquery.placeholder.js"></script>
        <script src="js/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
    </body>
</html>
