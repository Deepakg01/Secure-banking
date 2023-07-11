<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Digital_coin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!--<link href="styl.css" rel="stylesheet" type="text/css"/> -->
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<style type="text/css">
     
#apDiv1 {
	position: absolute;
	width: 200px;
	height: 115px;
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
              var bal;
              try {
    bal = document.getElementById("balance").value;
} catch (e) {
//    alert(e);
}

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
                      t=tho1*2000;
                      
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
                  
            function isNumber(evt){
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                var accno=document.getElementById("accno").value;
                
                if ((charCode > 31 && (charCode < 48 || charCode > 57)) ) {
        return false;
    }
    return  true;
            }
        </script>
    <style>
     
      body {
background-color: #ddcaca;
background-image: linear-gradient(0deg, #ddcaca 0%, #9aede8 50%, #FFDEE9 100%);
        background-size:cover;
    color:black;
}  
   
        </style>
<!-- CuFon ends -->
</head>
<body>
<div class="main">

<!--  <div class="header">
    <div class="header_resize">
      <div class="hleft">
        <div class="logo"><h1><a href="index.html"><span>E</span>COIN<br /><small>put your login here</small></a></h1></div>
        <div class="clr"></div>
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="">
            <span><input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" /></span>
            <input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
          </form>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
        
      </div>-->

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
            <li><a href="Homepage.jsp" class="currentmenu"> Home </a></li>
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
      <div class="mainbar">
<!--        <div class="article">-->
            
               <%
                 int credit=0;
                String username=(String)session.getAttribute("acno");
                Statement stst=DbConnection.getConnection();
                ResultSet rsst=stst.executeQuery("select * from credit where accountnumber='"+username+"'");
                if(rsst.next())
                               {
                    credit=rsst.getInt("creditamount");
                  }
                
                %>
	 <%
        String accno=null;
        String balance=null;
        String accountno=null;
        String tablename=null;
        String uname=null;
        Statement st=DbConnection.getConnection();
        ResultSet rs=st.executeQuery("select * from registration where accountno='"+username+"'");
        if(rs.next())
         {
             accno=rs.getString("accountno");
             balance=rs.getString("creditamount");
             uname=rs.getString("name");
             System.out.println("The Available Balance Is"+" "+balance);
             accountno=accno;
             tablename=accountno+uname;
             session.setAttribute("tablename", tablename);
        }
         String query="SELECT COUNT(Thousand),COUNT(FiveHundred),COUNT(Hundred) FROM "+tablename+"";
         String t1=null;
         String fh1=null;
         String h1=null;
         Statement st1=DbConnection.getConnection();
         ResultSet rs1=st1.executeQuery(query);
         if(rs1.next())
         {
           t1=rs1.getString(1);
           fh1=rs1.getString(2);
           h1=rs1.getString(3);
         }
        
        
        %>
        <center>
            
        <form action="newapprove.jsp" method="post" onsubmit="return validate()">
            <div style="width:50%;margin-right:38%  ">
            <table>
                <tr><td style="color:black;font-size:medium  "><b>Account Number</b></td><td><input type="text" name="saccno" id="accno" value="<%=accno%>"/></td></tr>
                <tr><td style="color:black;font-size:medium "><b>Account Name</b></td><td><input type="text" name="saccname" id="accname" value="<%=uname%>"/></td></tr>
                <tr > <td style="color:black;font-size:medium "><b>Two Thousand</b></td><td><input type="text" name="t1" id="thousand" value="<%=t1%>"/></td></tr>
        <tr><td style="color:black;font-size:medium "><b>Five_Hundred</b></td><td><input type="text" name="t2" id="fivehundred" value="<%=fh1%>"/></td></tr>
        <tr><td style="color:black;font-size:medium "><b>Hundred</b></td><td><input type="text" name="t3" id="hundred" value="<%=h1%>"/></td></tr>
            </table></div>
            <h2 style="margin-right:38%  ">Third_Party_Transfer</h2>
            <div style="width:50%;margin-right:25%  ">
       
      
        <table>
         <tr><td></td><td><input type="hidden" value="<%=username%>" name="uname"/></td></tr>  
         <tr><td></td><td><input type="hidden" value="<%=accno%>" name="saccno"/></td></tr>  
        
         <tr><td style="color:black;font-size:medium "><b>Enter Account Number</b></td><td><input type="text" name="raccno" id="acno" onkeypress="return isNumber(event)"/></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Enter Account Name</td></b><td><input type="text" name="accname" id="acname"/></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Enter No of Two Thousand</b></td><td><input type="text" id="thousand1" name="thousand"  value="0" onChange="calculate()"/></td><td><i>Enter 0 If no Thousand's</i></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Enter No of Five Hundred</b></td><td><input type="text" id="fivehundred1" name="fivehun" value="0" onChange="calculate()"/></td><td><i>Enter 0 If no Five Hundred's</i></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Enter No of Hundred</b></td><td><input type="text" id="hundred1" name="hundred" value="0" onChange="calculate()"/></td><td><i>Enter 0 If no Hundred's</i></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Total Amount</b></td><td><input type="Text" id="balance1" name="amt" value="" readonly /></td></tr>
         <%
         DateFormat df=new SimpleDateFormat("YYYY-MM-dd");
         String cdate=df.format(new Date());
         
         %>
         <tr><td style="color:black;font-size:medium "><b>Select_date</b></td><td><input type="text"  id="inputField" name="date" value="<%=cdate%>" readonly=""/></td></tr>
         <tr><td style="color:black;font-size:medium "><b>Add Time</b></td><td> <input type="text" name="time" value="" id="t" /></td><td><input type="button" onclick="myFunction()" value="ADD"/></td></tr>
         <tr><td></td><td><input type="submit"  value="Transfer"/></td></tr>
        </table>
            </div>
        </form>
         
            </center>
       </div>
<!--        <img src="images/bitcoin1.jpg" width="345" height="193" alt="image" class="hbgimg" />-->
      </div>
      <div class="clr"></div>
    </div>
    

    
    
  </div>

  <div class="content">
    <div class="content_resize">
    

   <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color:black">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: black"></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>



