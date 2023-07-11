
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Digital_coin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script>
        function myFunction()
        {
          var username=document.getElementById("uname").value;
          var password=document.getElementById("pwd").value;
          var user=username.trim().length;
          var pass=password.trim().length;
          if(user=="")
              {
                  alert("please enter The Username!!!Username field cannot be empty")
                  return false;
              }
             if(pass=="")
              {
                  alert("please enter The Password!!!password field cannot be empty");
                  return false;
              }
        }
    </script>
    <style>
        body{
            
             background: rgb(238,174,202);
      background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%); 
      background-position:top;
      background-repeat:no-repeat; 
        background-size:cover;
    color:white;
        }
	.blink {
      animation: blink 1s steps(5, start) infinite;
      -webkit-animation: blink 1s steps(5, start) infinite;
    }
    @keyframes blink {
      to {
        visibility: hidden;
      }
    }
    @-webkit-keyframes blink {
      to {
        visibility: hidden;
      }
    }
	</style>
<!-- CuFon ends -->
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
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="registration.jsp">Registration</a></li>
            <li><a href="login.jsp">Login</a></li>        
            <li><a href="index.jsp">Logout</a></li>
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
        <div class="article">
            <%
            String usern=(String)session.getAttribute("username");
            String mob=(String)session.getAttribute("mobilenum");
            String mail=(String)session.getAttribute("umail");
            String accountno=(String)session.getAttribute("accountno");
            session.setAttribute("acno", accountno);
            Statement st21=DbConnection.getConnection();
            Statement st22=DbConnection.getConnection();
            ResultSet rs21=st21.executeQuery("select * from registration where accountno='"+accountno+"'");
            String photoname="";
            String firstname="";
            String lastname="";
            String acctype="";
            String branch="";
            String accountnum="";
            String creditamount="";
            while(rs21.next())
            {
                photoname=rs21.getString("photo");
                firstname=rs21.getString("name");
                lastname=rs21.getString("lastname");
                acctype=rs21.getString("acctype");
                branch=rs21.getString("branchname");
                accountnum=rs21.getString("accountno");
                creditamount=rs21.getString("creditamount");
            }
            ServletContext context = getServletContext();
            String dirName =context.getRealPath("/userphotos/");
            String photopath="userphotos"+"/"+photoname; 
     
  
            %>
            <h3 style="color: black;"align="">Hello! <%=firstname+" "+lastname %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Account Created. Your Account Number&nbsp;: &nbsp;<b class="blink"> <%=accountnum %> </b></h3>
            <center>
               
              <h1>Upload Your Photo Here. . .              </h1>
              
              <p>&nbsp;</p>
              <form ENCTYPE="multipart/form-data" name="form3" action="uploadpho.jsp" method="post">
                <table width="864" height="203" align="left">
                    <tr>
                    <td width="204" ><img src="<%=photopath %>" width="187" height="203" bgcolor="#CCCCCC"/></td>
                    <td width="226" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upload Your Photo</td>
                    <td width="261"><input type="file" name="filename" /></td>
                    <td width="153"><input type="submit" value="Upload"/></td>
                    <td width="153"><input type="button" value="Login Here!" onclick="window.location='login.jsp'"/></td>
                    </tr>
                </table>
              </form>
            </center>
        </div>
        <div class="article">
          <h2>&nbsp;</h2>
        </div>
        <div class="clr"></div>
      </div>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
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

