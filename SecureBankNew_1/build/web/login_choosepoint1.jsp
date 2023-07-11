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
      background: rgb(238,174,202);
background: radial-gradient(circle, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);  
       
        background-size:cover;
    color: #212121;
}
h1 {
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
      <div class="menu_nav" style="background-color:#0064ab ;text-align:center" >
        <ul>
           <li class="active"><a href="home.jsp"><span>Home</span></a></li>
          <li><a href="#"><span>Fixed Deposit</span></a></li>
           <li><a href="#"><span>Beneficiary</span></a></li>
          <li><a href="#"><span>Transaction</span></a></li>
          <!--<li><a href="loan.jsp"><span>Loan</span></a></li>-->
          <li style="padding-left: 400px;;" ><a href="login.jsp"><span>Logout</span></a></li>
          <!--<li><a href="contact.html"><span>Contact Us</span></a></li>-->
        </ul>
      </div>
      <div class="clr"></div>
<!--      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>-->
 <center>
     <form name="myform" action="pixelcomparison1" method="post" autocomplete="off">
                        <h1>Choose your image point</h1>
                        <br></br>
                        <center>  <table width="700px">
                                <tr align="center"> 
                                    <td> <input type="image" name="imag" src="login_choosepoint1" width="167" height="117" border="3"></td>
                                    
         
                            </table> </form>
                          
                        </center>
        <div class="clr"></div>
      <div class="clr"></div>
    </div>
  </div>
    
  <div class="content">
    <div class="content_resize"> 
      
    </div>
    
    

  <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color:white">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color:white">A Trust Sector</p>
      <div style="clear:both;"></div>
   
  </div>
</div>
</body>
</html>
