

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Digital_coin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<link href="styl.css" rel="stylesheet" type="text/css" />-->
<!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<!-- CuFon ends -->
<style>
   body{
            
 background: rgb(240,165,198);
background: radial-gradient(circle, rgba(240,165,198,0.9360994397759104) 0%, rgba(131,159,81,1) 0%, rgba(184,182,221,1) 0%, rgba(172,184,225,1) 73%, rgba(166,185,227,1) 80%, rgba(162,186,229,1) 85%, rgba(158,186,230,1) 89%, rgba(148,187,233,1) 100%);
      background-position:top;
      background-repeat:no-repeat; 
        background-size:cover;
    color:white;
        } 
    
</style>
</head>
<body>
<div class="main">

 <div class="header">
    <div class="header">
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
      <div class="menu_nav">
          <ul>
             <li  ><a href="index.jsp" class="currentmenu"> Home </a></li>
                    
                    
                    <li ><a href="viewdetails.jsp" class="menu">View User Details </a></li>
                    <li ><a href="pendingtransaction.jsp" class="menu">Transactions Details</a></li>		  
                    <li ><a href="#" class="menu"> Contacts </a></li>
                     <li ><a href="index.jsp" class="menu"> Logout </a></li>
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
          <center>
        <div class="article">
            <h2><img src="images/image8.jpg" width="900" height="300"  style="margin-left: -250px;border-radius:20px "/></h2>
        </div></center>
        <div class="article">
        <table align="center"  class="tab" align="center"  >
           <tr>
               <th>Username</th>
               <th>Account No</th>
           </tr>
        <%
        Statement st=DbConnection.getConnection();
        ResultSet rs=st.executeQuery("select name,accountno from registration");
        while(rs.next())
         {
         String username=rs.getString("name");
         String accountno=rs.getString("accountno"); 
 // out.print("<a href='servlet2?uname="+n+"'>visit</a>");            
       %>
      
       <tr>
           <td><input type="text" value="<%=username%>" readonly=""/></td>
           <td><input type="text" value="<%=accountno%>" readonly=""/></td>
          
     
      
      <%
       out.println("<td><b><a href='credit.jsp?uname="+username+"&actno="+accountno+"'>Credit</a></h6></b></td>");
       out.println("<td><b><a href='customerdisplay.jsp?uname="+username+"&actno="+accountno+"'>User Details</a></b></td>");
        }
      %>
      </tr>
       </table>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      
    </div>
    
  </div>

 <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>

