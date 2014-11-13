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
        <script>

            function function3() {
                type = $("#type").val();

                if (type === "default") {
                    alert("Please Select Type");
                    $("#type").focus().freeze();
                }

                $("#form").submit();
            }


            $(document).ready(function() {

                $("#form").validate({
                    rules: {
                        post: {
                            required: true,
                            minlength: 5,
                            maxlength: 5   
                        }
                    }
                });
            });
            jQuery(function($) {
                $("#no").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#no').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });
            jQuery(function($) {
                $("#name").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[A-Za-zก-ฮ ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#name').on("paste", function(e)
                {
                    e.preventDefault();
                });
            });

        </script>
    </head>
    <jsp:include page="header1.jsp"/>
    <body style="background-color: gainsboro;max-width: 1280px;margin: auto;padding-bottom: 70px;">
        <div style="margin-bottom: 70px">
        </div>
        <div class="row">
            <div class="col-md-2">
                <jsp:include page="logo_1.jsp"/>
            </div>
            <div class="col-md-10">
                <jsp:include page="header.jsp"/>
                <div class="col-md-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="ShowBankServlet?id=${user.account_Id}">My Bank Account</a></li>
                        <li class="active">Edit Bank Account</li>
                    </ol>
                    </font>
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
                                            <input type="hidden" name="acctid" value="${user.account_Id}">
                                            <select value="${find.bankName}" class="form-control" name="bankname" required>
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
                                            <input type="text" id="no" class="form-control" value="${find.bankAccNo}" name="no" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">Bank Account Name</label>
                                        <div class="col-sm-5">
                                            <input type="text" id="name" class="form-control" value="${find.bankAccName}" name="name" required>
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
        <script src="http://vjs.zencdn.net/4.3/video.js"></script>
        <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
