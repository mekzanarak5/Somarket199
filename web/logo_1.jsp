<a href="home.jsp"><img src="pic/logooo.png" class="img-responsive"/></a>
<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">My Account</h3>
  </div>
  <div class="panel-body">
    <ul class="nav nav-sidebar">
        <li><a href="editProfile.jsp">Edit <span class="fui-gear"></span></a></li>
        <li><a href="changePassword.jsp">Change Password <span class="fui-lock"></span></a></li>
        <li><a href="#fakelink">Buy List <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
        <li><a href="ShowSellServlet?id=${user.account_Id}">Sell List <span class="glyphicon glyphicon-home"></span></a></li>
        <li><a href="ShowAddressServlet?id=${user.account_Id}">Profile <span class="glyphicon glyphicon-folder-open"></a></li>
        <li><a href="ShowWishlistServlet?id=${user.account_Id}">Wish List <span class="glyphicon glyphicon-heart-empty"></a></li>
        <li><a href="ShowWishlistServlet?id=${user.account_Id}">FeedBack <span class="glyphicon glyphicon-refresh"></a></li>
    </ul>
  </div>
</div>
    


