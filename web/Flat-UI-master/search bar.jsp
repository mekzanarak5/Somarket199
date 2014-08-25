<%-- 
    Document   : search bar
    Created on : Aug 13, 2014, 1:56:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="row" style="position: fixed">
            <div class="col-xs-9" style="margin:auto;float: none;">
            <div class="col-xs-7">
                <div class="col-xs-12">
                    <div class="form-group">
                        <input type="text" value="" placeholder="Inactive" class="form-control" />
                    </div>          
                </div>
            </div>
            <div class="col-xs-2">
                <div class="col-xs-12">
                <select name="herolist" value="X-Men" class="select-block">
                            <option value="0">Choose hero</option>
                            <option value="1">Spider Man</option>
                            <option value="2">Wolverine</option>
                            <option value="3">Captain America</option>
                            <option value="X-Men" selected="selected">X-Men</option>
                            <option value="Crocodile">Crocodile</option>
                        </select>
                </div>
            </div>
            <div class="col-xs-2">
                <div class="col-xs-12">
                    <a href="#fakelink" class="btn btn-block btn-lg btn-info">Search</a>
                </div>
            </div>
            </div>
        </div>
    </body>
</html>
