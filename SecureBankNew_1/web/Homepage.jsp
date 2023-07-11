
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Digital_coin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<link href="styl.css" rel="stylesheet" type="text/css" />-->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<style type="text/css">

      body {
background-color: #ddcaca;
background-image: linear-gradient(0deg, #ddcaca 0%, #9aede8 50%, #FFDEE9 100%);
        background-size:cover;
    color:black;
}  
#apDiv1 {
	position: absolute;
	width: 543px;
	height: 143px;
	z-index: 1;
	left: 576px;
	top: 536px;
}
</style>
<!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<!-- CuFon ends -->
</head>
<body>
<div class="main">
   <div class="header_resize">
      <div class="logo">
        <h1><a href="index.jsp">Secure<span>Banking</span> <small>Trust us</small></a></h1>
      </div>
    <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our site:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="clr"></div>
      <div class="menu_nav" style="background-color:#0064ab ;text-align:center"  >
          <ul>
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="viewbalance.jsp">View Balance</a></li>
            <li><a href="transactionhistory.jsp">Transaction History</a></li>
            <li><a href="index.jsp">Logout</a></li>
            <li><a href="#">Contacts</a></li>
          </ul>
        </div>
<!--        <img src="images/bitcoin1.jpg" width="345" height="193" alt="image" class="hbgimg" />-->
      </div>
        
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
<!--        <div class="article">-->
          
          <p>&nbsp;</p>
          <%
		  String usernamez=(String)session.getAttribute("accno");
           Statement st21=DbConnection.getConnection();
            Statement st22=DbConnection.getConnection();
            session.setAttribute("acno", usernamez);
            ResultSet rs21=st21.executeQuery("select * from registration where accountno='"+usernamez+"'");
            String photoname="";
            String firstname="";
            String lastname="";
            String acctype="";
            String branch="";
            String accountnum="";
            String creditamount="";
            String photopath="";
            
            while(rs21.next())
            {
                photoname=rs21.getString("photo");
                firstname=rs21.getString("name");
                lastname=rs21.getString("lastname");
                acctype=rs21.getString("acctype");
                branch=rs21.getString("branchname");
                accountnum=rs21.getString("accountno");
                creditamount=rs21.getString("creditamount");
                photopath="userphotos"+"/"+photoname; 
            }
			%>
          <table width="889" height="278">
            <tr>
              <td height="63" colspan="2"><h2>Hello.. <b>Mr/Mrs <%=firstname+" "+lastname %></b></h2></td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td width="212" rowspan="3"><img src="<%=photopath %>" width="187" height="203" bgcolor="#CCCCCC"/></td>
              <td width="158" height="64">Your Account Number</td><td width="284"><b><%=accountnum %></b></td>
              <td width="215" rowspan="3">&nbsp;</td>
            </tr>
            <tr>
              <td height="48">Account Type</td>
              <td width="284"><b><%=acctype %></b></td>
            </tr>
            <tr>
              <td height="91">Current Balance</td>
              <td width="284"><b><%=creditamount %>&nbsp;&nbsp;</b></td>
            </tr>
          </table>
<!--          <p>&nbsp;</p>
          <p><img src="images/bitcoin1.jpg" width="900" height="300" />-->
        </div>
<!--        <div class="article">-->
           <p>
             <%
            String username=(String)session.getAttribute("username");
            %>
           </p>
         
        </div>
     <div class="clr"></div>
      </div>
      <div class="clr"></div>
      
    </div>
    

   <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: black">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: black"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>


