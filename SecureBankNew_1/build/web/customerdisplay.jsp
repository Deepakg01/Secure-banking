

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
<script type="text/javascript">
         function valid()
         {
             document.getElementById("thou").value;
             document.getElementById("five").value;
             document.getElementById("hun").value;
             document.getElementById("").value;
             document.getElementById("").value;
             document.getElementById("").value;
         }
            function calculate()
            {
            var thousand=document.getElementById("thou").value;
            document.getElementById("ans").value=parseInt(thousand)*1000;
           }
             function calculate1()
            {
               var five=document.getElementById("five").value;
               document.getElementById("ans1").value=parseInt(five)*500;
            }
             function calculate2()
            {
               var hun=document.getElementById("hun").value;
            document.getElementById("ans2").value=parseInt(hun)*100;
            
               var a=document.getElementById("ans").value;
                var b=document.getElementById("ans1").value;
                var c=document.getElementById("ans2").value;
                var result=parseInt(a)+parseInt(b)+parseInt(c);
               if(!isNaN(result)){
                document.getElementById("ans3").value=result;
               }
              
            }
        </script>
<style>
  body{
            
             background-color: #3EECAC;
background-image: linear-gradient(19deg, #3EECAC 0%, #EE74E1 100%);  
      background-position:top;
      background-repeat:no-repeat; 
        background-size:cover;
    color:black;
    
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
            <li class="active"><a href="index.jsp">Home</a></li>
            <li><a href="viewdetails.jsp">View User Details</a></li>
            <li><a href="pendingtransaction.jsp">Transactions Details</a></li>
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
            <table border="2">
                <%
             String username=request.getParameter("uname");
             String account=request.getParameter("actno");
             Statement st=DbConnection.getConnection();
             String query="select * from registration where accountno="+account+"";
             ResultSet rs=st.executeQuery(query);
             while(rs.next())
              {
               String fname=rs.getString(1);
               String lname=rs.getString(2); 
               String accno=rs.getString(10);
               String dob=rs.getString(5);
               String gender=rs.getString(7);
               String age=rs.getString(6);
               String mobile=rs.getString(11);
               String city=rs.getString(14);
               String branch=rs.getString(14);
               String address=rs.getString(9);
               String mail=rs.getString(8);
               String amount=rs.getString(22);
               String adharno=rs.getString(18);
               %>
               <tr>
                   <td>First Name</td>
                   <td><%=fname%></td>
               </tr>
               <tr>
                   <td>Last Name</td>
                   <td><%=lname%></td>
               </tr>
               <tr>
                   <td>Account Number</td>
                   <td><%=accno%></td>
               </tr>
               <tr>
                   <td>Age</td>
                   <td><%=age%></td>
               </tr>
               <tr>
                   <td>DOB</td>
                   <td><%=dob%></td>
               </tr>
               <tr>
                   <td>Gender</td>
                   <td><%=gender%></td>
               </tr>
               <tr>
                   <td>Mobile</td>
                   <td><%=mobile%></td>
               </tr>
               <tr>
                   <td>City</td>
                   <td><%=city%></td>
               </tr>
               <tr>
                   <td>Branch</td>
                   <td><%=branch%></td>
               </tr>
               <tr>
                   <td>Address</td>
                   <td><%=address%></td>
               </tr>
               <tr>
                   <td>Mail</td>
                   <td><%=mail%></td>
               </tr>
              
               <tr>
                   <td>Amount</td>
                   <td><%=amount%></td>
               </tr>
               <tr>
                   <td>Aadhaar Number</td>
                   <td><%=adharno%></td>
               </tr>
               
               
               <%
               }
                
                %>
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
</body>
</html>



