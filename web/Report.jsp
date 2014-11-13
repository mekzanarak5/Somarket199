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
        <title>Social Market | Send Message to</title>
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
            <jsp:include page="logo.jsp"/>
        </div>
        <div class="col-md-10">
            <jsp:include page="header.jsp"/>
            <div class="col-md-12">
                <font size="2">
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Report</li>
                </ol>
                </font>
            </div>
            <form action="SendReport" method="get">
                <div class="col-xs-12" style="margin:auto;">
                    <div class="col-md-12" style=" border: 1px solid #ffffff ;border-radius: 15px;height: auto;background: #FFFFFF">
                        <div class="row">
                            <h3 class="col-md-12"  >Send Report to Admin</h3>
                            <div class="col-xs-12">
                                <h3 class="demo-panel-title">Receiver : Admin</h3>
                                <input type="hidden" name="receiver" value="0" />
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="subject"  placeholder="subject" value="Report Lawless Product" class="form-control" disabled=""/>
                                    <input type="hidden" name="subject"  placeholder="subject" value="Report Product ${pro.name}" class="form-control" />
                                </div>          
                            </div>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <input type="hidden" name="proid"  value="${pro.productNO}" />
                                    <input type="hidden" name="accid"  value="${pro.acctID}" />
                                    <input type="hidden" name="sender"  value="${user.account_Id}" />
                                    <input type="hidden" name="senderName"  value="${user.username}" />
                                    <input type="hidden" name="receiverName"  value="admin" />
                                    <select name="herolist" class="select-block">
                                        <option value="" selected>Choose Reason</option>
                                        <option value="Defalcation">Defalcation</option>
                                        <option value="Duplicate">Duplicate</option>
                                        <option value="Wrong Category">Wrong Category</option>
                                        <option value="Offensive">Offensive</option>
                                    </select>
                                </div>          
                            </div>
                            <div class="col-xs-5" style="margin: auto;float: none;margin-bottom: 25px" >
                                <input type="submit" class="btn btn-block btn-lg btn-info" value="Send !">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
        <!--<script src="http://vjs.zencdn.net/4.3/video.js"></script>-->
        <script src="js/application.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
