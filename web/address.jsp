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
        <title>Social Market | Address</title>
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
                $("#post").mask("99999");
            });
            jQuery(function($) {
                $("#post").on("keypress", function(event) {


                    var englishAlphabetAndWhiteSpace = /[0-9 ]/g;
                    var key = String.fromCharCode(event.which);
                    if (event.keyCode == 8 || event.keyCode == 37 || event.keyCode == 39 || englishAlphabetAndWhiteSpace.test(key)) {
                        return true;
                    }
                    return false;
                });

                $('#post').on("paste", function(e)
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
            <div class="col-xs-10">
                <jsp:include page="header.jsp"/>
                <div class="col-xs-12">
                    <font size="2">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li class="active">My Address</li>
                    </ol>
                    </font>
                </div>      
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <a href="ShowAddressServlet?id=${user.account_Id}"><button type="button" class="btn btn-primary">Address</button></a>
                            <a href="ShowBankServlet?id=${user.account_Id}"><button type="button" class="btn btn-default">Bank Account</button></a>
                        </div>
                        <div class="form-horizontal">
                            <div class="row">
                                <div id="cbp-vm" class="cbp-vm-switcher">
                                    <div class="col-md-12">
                                        <div class="col-md-3">
                                            <h5>My Address</h5>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="btn btn-xs btn-primary" style="margin-left: -80px;margin-top: 20px" data-toggle="modal" data-target=".bs-example-modal-lg">+</button>
                                            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <form id="form" action="AddAddress" method="get">
                                                            <div class="form-horizontal" style="text-align: center">                               
                                                                <h4 class="col-md-12">Add New Address</h4>
                                                                <div class="form-group">
                                                                    <label for="inputEmail3" class="col-sm-2 control-label">Address</label>
                                                                    <div class="col-sm-6">
                                                                        <input type="hidden" name="acctid" value="${user.account_Id}">
                                                                        <textarea class="form-control" name="address" rows="3" required></textarea> 
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-2 control-label">District</label>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" class="form-control" placeholder="District" name="canton" required>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-2 control-label">Province</label>
                                                                    <div class="col-sm-4">
                                                                        <select class="form-control" name="provice" required>
                                                                            <option value="" selected>--------- เลือกจังหวัด ---------</option>
                                                                            <option value="กรุงเทพมหานคร">กรุงเทพมหานคร</option>
                                                                            <option value="กระบี่">กระบี่ </option>
                                                                            <option value="กาญจนบุรี">กาญจนบุรี </option>
                                                                            <option value="กาฬสินธุ์">กาฬสินธุ์ </option>
                                                                            <option value="กำแพงเพชร">กำแพงเพชร </option>
                                                                            <option value="ขอนแก่น">ขอนแก่น</option>
                                                                            <option value="จันทบุรี">จันทบุรี</option>
                                                                            <option value="ฉะเชิงเทรา">ฉะเชิงเทรา </option>
                                                                            <option value="ชัยนาท">ชัยนาท </option>
                                                                            <option value="ชัยภูมิ">ชัยภูมิ </option>
                                                                            <option value="ชุมพร">ชุมพร </option>
                                                                            <option value="ชลบุรี">ชลบุรี </option>
                                                                            <option value="เชียงใหม่">เชียงใหม่ </option>
                                                                            <option value="เชียงราย">เชียงราย </option>
                                                                            <option value="ตรัง">ตรัง </option>
                                                                            <option value="ตราด">ตราด </option>
                                                                            <option value="ตาก">ตาก </option>
                                                                            <option value="นครนายก">นครนายก </option>
                                                                            <option value="นครปฐม">นครปฐม </option>
                                                                            <option value="นครพนม">นครพนม </option>
                                                                            <option value="นครราชสีมา">นครราชสีมา </option>
                                                                            <option value="นครศรีธรรมราช">นครศรีธรรมราช </option>
                                                                            <option value="นครสวรรค์">นครสวรรค์ </option>
                                                                            <option value="นราธิวาส">นราธิวาส </option>
                                                                            <option value="น่าน">น่าน </option>
                                                                            <option value="นนทบุรี">นนทบุรี </option>
                                                                            <option value="บึงกาฬ">บึงกาฬ</option>
                                                                            <option value="บุรีรัมย์">บุรีรัมย์</option>
                                                                            <option value="ประจวบคีรีขันธ์">ประจวบคีรีขันธ์ </option>
                                                                            <option value="ปทุมธานี">ปทุมธานี </option>
                                                                            <option value="ปราจีนบุรี">ปราจีนบุรี </option>
                                                                            <option value="ปัตตานี">ปัตตานี </option>
                                                                            <option value="พะเยา">พะเยา </option>
                                                                            <option value="พระนครศรีอยุธยา">พระนครศรีอยุธยา </option>
                                                                            <option value="พังงา">พังงา </option>
                                                                            <option value="พิจิตร">พิจิตร </option>
                                                                            <option value="พิษณุโลก">พิษณุโลก </option>
                                                                            <option value="เพชรบุรี">เพชรบุรี </option>
                                                                            <option value="เพชรบูรณ์">เพชรบูรณ์ </option>
                                                                            <option value="แพร่">แพร่ </option>
                                                                            <option value="พัทลุง">พัทลุง </option>
                                                                            <option value="ภูเก็ต">ภูเก็ต </option>
                                                                            <option value="มหาสารคาม">มหาสารคาม </option>
                                                                            <option value="มุกดาหาร">มุกดาหาร </option>
                                                                            <option value="แม่ฮ่องสอน">แม่ฮ่องสอน </option>
                                                                            <option value="ยโสธร">ยโสธร </option>
                                                                            <option value="ยะลา">ยะลา </option>
                                                                            <option value="ร้อยเอ็ด">ร้อยเอ็ด </option>
                                                                            <option value="ระนอง">ระนอง </option>
                                                                            <option value="ระยอง">ระยอง </option>
                                                                            <option value="ราชบุรี">ราชบุรี</option>
                                                                            <option value="ลพบุรี">ลพบุรี </option>
                                                                            <option value="ลำปาง">ลำปาง </option>
                                                                            <option value="ลำพูน">ลำพูน </option>
                                                                            <option value="เลย">เลย </option>
                                                                            <option value="ศรีสะเกษ">ศรีสะเกษ</option>
                                                                            <option value="สกลนคร">สกลนคร</option>
                                                                            <option value="สงขลา">สงขลา </option>
                                                                            <option value="สมุทรสาคร">สมุทรสาคร </option>
                                                                            <option value="สมุทรปราการ">สมุทรปราการ </option>
                                                                            <option value="สมุทรสงคราม">สมุทรสงคราม </option>
                                                                            <option value="สระแก้ว">สระแก้ว </option>
                                                                            <option value="สระบุรี">สระบุรี </option>
                                                                            <option value="สิงห์บุรี">สิงห์บุรี </option>
                                                                            <option value="สุโขทัย">สุโขทัย </option>
                                                                            <option value="สุพรรณบุรี">สุพรรณบุรี </option>
                                                                            <option value="สุราษฎร์ธานี">สุราษฎร์ธานี </option>
                                                                            <option value="สุรินทร์">สุรินทร์ </option>
                                                                            <option value="สตูล">สตูล </option>
                                                                            <option value="หนองคาย">หนองคาย </option>
                                                                            <option value="หนองบัวลำภู">หนองบัวลำภู </option>
                                                                            <option value="อำนาจเจริญ">อำนาจเจริญ </option>
                                                                            <option value="อุดรธานี">อุดรธานี </option>
                                                                            <option value="อุตรดิตถ์">อุตรดิตถ์ </option>
                                                                            <option value="อุทัยธานี">อุทัยธานี </option>
                                                                            <option value="อุบลราชธานี">อุบลราชธานี</option>
                                                                            <option value="อ่างทอง">อ่างทอง </option>
                                                                            <option value="อื่นๆ">อื่นๆ</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="inputPassword3" class="col-sm-2 control-label">Post</label>
                                                                    <div class="col-sm-3">
                                                                        <input type="text" id="post" class="form-control" placeholder="Post" name="post" required>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <div class="col-sm-offset-2 col-sm-10">

                                                                        <button type="submit"  class="btn btn-primary">Add</button>&nbsp;&nbsp;<button type="reset" class="btn btn-primary">Reset</button>
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
                                    <table class="table table-striped" style="text-align: center">
                                        <tr bgColor="#ffffff">
                                            <td>Address</td>
                                            <td>District</td>
                                            <td>Province</td>
                                            <td>Zip Code</td>
                                            <td>Manage</td>
                                        </tr>
                                        <c:forEach items="${add}" var="a">
                                            <tr>
                                                <td>${a.address}</td>
                                                <td>${a.canton}</td>
                                                <td>${a.provice}</td>
                                                <td>${a.post}</td>
                                                <td>
                                                    <div class="btn-group">
                                                        <button class="btn btn-xs btn-info" onclick="window.location.href = 'EditShowAddress?addid=${a.address_Id}'">Edit</button>
                                                        <a href="DeleteAddressServlet?id=${a.address_Id}&acctid=${user.account_Id}" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure ?');">Delete</a>
                                                    </div>
                                                </td>
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
