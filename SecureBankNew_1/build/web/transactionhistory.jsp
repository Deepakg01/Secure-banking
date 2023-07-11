




<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>

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
	width: 200px;
	height: 200px;
	z-index: 1;
}
</style>
<!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript">
            function calculate()
            {
              var bal=document.getElementById("balance").value;
              var tho=document.getElementById("thousand").value;
              var fiv=document.getElementById("fivehundred").value;
              var hun=document.getElementById("hundred").value;
              var tho1=document.getElementById("thousand1").value;
              var fiv1=document.getElementById("fivehundred1").value;
              var hun1=document.getElementById("hundred1").value;
             // var bal1=document.getElementById("balance1").value;
              var t,f,h;
              if(parseInt(tho1)>=0 && parseInt(tho1)<=parseInt(tho))
                  {
                      t=tho1*1000;
                      
                  }
               else
                   {
                       alert("You have only"+" "+tho+" "+"Thousand");
                   }
                   
               if(parseInt(fiv1)>=0&&parseInt(fiv1)<=parseInt(fiv))
                  {
                     f=fiv1*500;
                  }
               else
                   {
                      
                       alert("You have only"+" "+fiv+" "+"FiveHundred");
                   }
                   
                   if(parseInt(hun1)>=0&&parseInt(hun1)<=parseInt(hun))
                  {
                     h=hun1*100;
                  }
               else
                   {
                      alert("You have only"+" "+hun+" "+"Hundred");
                   }
                   var result=parseInt(t)+parseInt(f)+parseInt(h);
               if(!isNaN(result)){
                document.getElementById("balance1").value=result;
               }
               
            }
             window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%Y-%m-%d"
			
		});
	};
          function myFunction()
            {
                 var currentdate = new Date();
                 var datetime =currentdate.getHours() + ":" 
                 + currentdate.getMinutes() + ":" + currentdate.getSeconds();
                 alert(datetime);
                 document.getElementById("t").value=datetime;
            }
            
            function validate()
            {
              var accno=document.getElementById("acno").value;
              var accname=document.getElementById("acname").value;
               var bal=document.getElementById("balance1").value;
              var dat=document.getElementById("inputField").value;
              var time=document.getElementById("t").value;
              var ano=accno.trim().length;
              var aname=accname.trim().length;
              if(ano=="")
                  {
                      alert("please enter the account number");
                      return false;
                  }
                  if(aname=="")
                      {
                          alert("please enter the account name");
                      return false;
                      }
                  
                  if(dat=="")
                      {
                          alert("please select the date");
                          return false;
                      }
                      if(time=="")
                      {
                          alert("please Add  the time");
                          return false;
                      }
                      if(bal=="")
                      {
                          alert("Total Amount is can not be Empty");
                          return false;
                      }
                  }
                  
            
        </script>
    
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
      <div class="menu_nav" style="background-color:#0064ab ;text-align:center">
          <ul>
            <li><a href="index.jsp" class="currentmenu"> Home </a></li>
                      <li><a href="viewbalance.jsp" class="currentmenu">View Balance</a></li>
                      <li><a href="transactionhistory.jsp" class="currentmenu">Transaction History</a></li>
                     <li ><a href="index.jsp" class="menu"> Logout </a></li>
                     
                    <li ><a href="#" class="menu"> Contacts </a></li>
          </ul>
        </div>
<!--        <img src="images/bitcoin1.jpg" width="345" height="193" alt="image" class="hbgimg" />-->
      </div>
      <div class="clr"></div>
    </div>
    

    
    
  </div>

  <div class="content">
    <div class="content_resize">
    
      <table width="905" height="105" border="2" align="center">
            <tr>
                <th>From Account Number</th>
                <th>From Account Name</th>
                 <th>To Account Number</th>
                 <th>To Account Name</th>
                   <th>Thousand</th>
                    <th>Five Hundred</th>
                     <th>Hundred</th>
                     <th>Transfer Amount</th>
                     <th>Transaction Date</th>
                       <th>Transaction Time</th>
            </tr>
          <%
              try{
            String username=(String)session.getAttribute("acno");
            System.out.println(username);
            Statement st=DbConnection.getConnection();
            //ResultSet rs=st.executeQuery("select * from transactionhistory where fromaccount='"+username+"'");
            ResultSet rs=st.executeQuery("select * from transactionhistory where sendername='"+username+"'");
            while(rs.next())
                {
                      String sname=rs.getString("fromaccount");
//                String sname=rs.getString("sendername");
                String rname=rs.getString("receivername");
                long facc=rs.getLong("sendername");
                String tacc=rs.getString("toaccount");
                int thou=rs.getInt("thousand");
                int fhun=rs.getInt("fivehundred");
                int hun=rs.getInt("hundred");
                int amt=rs.getInt("amount");    
                String date=rs.getString("selectdate");
                String time=rs.getString("selecttime");
                  
                  %>
                  <tr>
                      <td><%=facc%></td>
                      <td><%=sname%></td>
                      <td><%=tacc%></td>
                      <td><%=rname%></td>
                      <td><%=thou%></td>
                      <td><%=fhun%></td>
                      <td><%=hun%></td>
                      <td><%=amt%></td>
                      <td><%=date%></td>
                      <td><%=time%></td>
                      
                  </tr>
                  
                  <%
                
                }
              }catch(Exception e){
                  out.println(e);
                  System.out.println(e);
              }
            
       %>
        </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
      
    </div>
    
  </div>

 <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color:white">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color:white"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>












