<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Banking</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
        document.onkeydown = function() {
        if(event.keyCode == 116) {
                event.returnValue = false;
                event.keyCode = 0;
                return false;
               }
               
    }
         function isNumberkey(evt)
        {
            var charcode=(evt.which)?evt.which:event.keycode
            if(charcode>31 && (charcode<48||charcode>57))
                return false;
            return true;
        }
</script>
<style>
body {
    color: #212121;
}

h1,h3 {
    color: #0064ab;
}
p.italic {
    font-style: italic;
}
p {
    font-size: 15px;
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>

</head>
<body>
<div class="main">
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
          <li class="active"><a href="index.jsp"><span>Home</span></a></li>
          <li><a href="fixeddeposit.jsp"><span>Fixed Deposit</span></a></li>
          <li><a href="beneficiary.jsp"><span>Beneficiary</span></a></li>
          <li><a href="transaction.jsp"><span>Transaction</span></a></li>
          <!--<li><a href="loan.jsp"><span>Loan</span></a></li>-->
           <li style="padding-left: 400px;;" ><a href="login.jsp"><span>Logout</span></a></li>
          <!--<li><a href="contact.html"><span>Contact Us</span></a></li>-->
        </ul>
      </div>
      <div class="clr"></div>
<!--      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>-->

        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize"> 
        <h1></h1>
        <% 
                                   try{
        
                HttpSession hs=request.getSession();
                String accountno=(String) hs.getAttribute("accountno");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/bank","root","root");
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery("select * from user where accountno='"+accountno+"'");
                while(rs.next()){%>
                 <center>
                     <h1>WELCOME TO SECURE BANKING</h1><br></br>
                     <table width="300">
                         <tr>
                             <td><h3>Name:</h3></td><td>        </td>
                             <td><h3><%=rs.getString(1)%></h3></td>
                         </tr>
                         <tr>
                             <td><h3>Account No:</h3></td><td>          </td>
                             <td><h3><%=rs.getString(10)%></h3></td>
                         </tr>
                         <tr>
                             <td><h3>Balance:</h3></td><td>         </td>
                             <td><h3><%=rs.getString(12)%></h3></td>
                         </tr>
                         <tr>
                             <td><h3>Branch Name:</h3></td><td>     </td>
                             <td><h3><%=rs.getString(14)%></h3></td>
                         </tr>
                         <tr>
                             <td><h3>Email-Id:</h3></td><td></td>
                             <td><h3><%=rs.getString(8)%></h3></td>
                         </tr>
                          <tr>
                             <td><h3>Phone No:</h3></td><td></td>
                             <td><h3><%=rs.getString(11)%></h3></td>
                         </tr>
                          <tr>
                             <td><h3>Age:</h3></td><td></td>
                             <td><h3><%=rs.getString(6)%></h3></td>
                         </tr>
                           </table></center>
    <%
                }
                    }
                               catch(Exception e)
                               {
                                  System.out.println(e);
                                }
    %>

        </div>
        <!--<p class="pages"><small>Page 1 of 2</small> <span>1</span> <a href="#">2</a> <a href="#">&raquo;</a></p>-->
      </div>
    </div>
 
  <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue">A Trust Sector</p>
      <div style="clear:both;"></div>
   
  </div>
</div>
</body>
</html>
