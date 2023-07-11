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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

//--></script>
<script type="text/javascript">

//    $(document).ready(function() {
//        function disableBack() { window.history.forward() }
//
//        window.onload = disableBack();
//        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
//    });
//        document.onkeydown = function() {
//        if(event.keyCode == 116) {
//                event.returnValue = false;
//                event.keyCode = 0;
//                return false;
//               }
//               
//    }
    server.transfer("registration.jsp");
//    subwin = window.open(url,"dummyname",'width=635px,resizable=no, height=535px, menubar=no, toolbar=no, location=no, scrollbars=no'); 

            function Validate() {
        var password = document.getElementById("txtNewPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
    function ValidateEmail(inputText)  
                {  
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
                if(inputText.value.match(mailformat))  
                {  
                document.form1.email.focus();  
                return true;  
                }  
                else  
                {  
                alert("You have entered an invalid email address!");  
                document.form1.email.focus();  
                return false;  
                }  
                }  

function checkemail(email)
{
   var regex=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
   if(!regex.test(email))
   {
       alert('Please enter valid email id');
    }
 }
 function validate() {
    if (document.myForm.name.value == "") {
        alert("Enter a name");
        document.myForm.name.focus();
        return false;
    }
    if (!/^[a-zA-Z]*$/g.test(document.myForm.name.value)) {
        alert("Invalid characters");
        document.myForm.name.focus();
        return false;
    }
    function onkeydown(){
     var ch = String.fromCharCode(event.keyCode);
     var filter = /[a-zA-Z]/   ;
     if(!filter.test(ch)){
          event.returnValue = false;
     }
}
}
function checkNum()
{

if ((event.keyCode > 64 && event.keyCode < 91) || (event.keyCode > 96 && event.keyCode < 123) || event.keyCode == 8)
   return true;
else
   {
       alert("Please enter only char");
       return false;
   }

}
function checkInp()
{
  var x=document.forms["form1"]["age"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkInp3()
{
  var x=document.forms["form1"]["acc"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkInp1()
{
  var x=document.forms["form1"]["phone"].value;
  if (isNaN(x)) 
  {
    alert("Must input numbers");
    return false;
  }
}
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword){
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    
    }
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}

$(document).ready(function () {
   $("#txtConfirmPassword").keyup(checkPasswordMatch);
});
$('#txtConfirmPassword').keyup(function(){


if($(this).val() != $('#txtNewPassword').val().substr(0,$(this).val().length))
{
 alert('confirm password not match');
}



});
function check() {
    if(document.getElementById('password').value === document.getElementById('confirm_password').value) {
        document.getElementById('message').innerHTML = "match";
    } else {
        document.getElementById('message').innerHTML = "no match";
    }
}

function IsAccountNumber(txtMobId) {
    var mob = /^[1-9]{1}[0-9]{9}$/;
    var txtMobile = document.getElementById(txtMobId);
    if (mob.test(txtMobile.value) == false) {
        alert("Please enter valid Account number.Account no should have 10 digit");
        txtMobile.focus();
        return false;
    }
    return true;
}
function IsMobileNumber(txtMobId) {
    var mob = /^[1-9]{1}[0-9]{9}$/;
    var txtMobile = document.getElementById(txtMobId);
    if (mob.test(txtMobile.value) == false) {
        alert("Please enter valid Mobile number.");
        txtMobile.focus();
        return false;
    }
    return true;
}

function passwordcheck(){
    
  var pass=document.getElementById('txtNewPassword').value;
  if(pass.length<6){
      alert("password must be 6 characters.");
      
  }
    
}
function pass(id){
    var v = document.getElementById(id).value;
    if(v.length<6){
        alert("Must be enter more than 6 char!!!");
        document.getElementById(id).value = "";
    }
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
    color:steelblue
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
td{
    color:black;
    font-size: 15px;
   
}
#divCheckPasswordMatch{
    
   color:white;  
}
</style>

</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">Secure<span>Banking</span> <small>Trust us</small></a></h1>
      </div>
<!--      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our site:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>-->
      <div class="clr"></div>
      <div class="menu_nav" style="background-color:#0064ab ">
        <ul>
          <li ><a href="index.jsp"><span>Home</span></a></li>
          <li><a href="login.jsp"><span>Login</span></a></li>
          <li class="active"><a href="registration.jsp"><span>Registration</span></a></li>
        
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <!--<div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="335" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="335" alt="" /> </a> </div>-->

        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
      <div>
          <div class="box">
        <section class="container">
            <div class="login">
                <form name="form1" action="registration" method="post" enctype="multipart/form-data"  width="600px" autocomplete="off" onsubmit="return Validate()">
            
                <center>               
                    <h1>Registration Form</h1><br><br>
                    </center>
                    <center>     <table width='800' align="center">
                            <tr align="center">
                                <td><b>First Name:</b></td>
                                <td><input type='text' placeholder="First Name" name='name'  required pattern='[A-Za-z\\s]*'
                                           onkeypress="return checkNum()"  autocomplete="false" ></td>
                                           <td><b>Last Name:</b></td>
                                <td><input type='text' name='last'  placeholder="Last Name" pattern="[a-zA-Z]+"required onkeydown="return checkNum()"></td>
                            </tr>
                            <tr ><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td><b>Age:</b></td>
                                <td><input type='text' name='age'  placeholder="Age" required="" onkeyup="return checkInp()" maxlength="2"></td>
                                <td><b>Date Of Birth:</b></td>
                                <td><input type="date" name='dob' required style="width: 155px"></td>
                            </tr>
                            <tr ><td>&nbsp;</td></tr>
                            <tr align="center">
                                
                                <td><b>Phone:</b></td>
                                <td><input type='text' name='phone'  placeholder="Phone" required="" id="txtMB" onkeyup="return checkInp1()"  pattern="[0-9]{10}" maxlength="10"/></td>
                                <!--<td><input type='text' name='phone' required="" onkeydown="return checkInp1()" maxlength="10"  pattern="[0-9]{10}" /></td>-->
                                <td><b>Branch Name:</b></td>
                                <td><input type='text' name='branchname'  placeholder="Branch Name" required onkeyup="return checkNum()" pattern="[a-zA-Z]+"></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td><b>Account number:</b> </td>
                                <td><input  type="text" name="acc"  placeholder="Account Number" onkeyup="return checkInp3()" onclick="return IsMobileNumber('txtMB')"   id="txtMB1" maxlength="10" pattern="[0-9]{10}"/></td>
                                <td><b>Email-id:</b></td>
                                <td><input type='text'  placeholder="Email-id" name='email' id="email"  required onkeyup="if(this.length>255) this.value=this.value.substr(0, 255)" onblur="checkemail(this.value)" /></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td><b>Password:</b></td>                           
                                <td> <div class="td"> <input type="password" onchange="pass('txtNewPassword')" placeholder="Password"  name="password" id="txtNewPassword"  required/></div></td>
                                <td><b>Confirm Password:</b></td>
                                <td><div class="td"><input type="password"  placeholder="Confirm password" name="cpass" id="txtConfirmPassword" onkeyup="checkPasswordMatch();"  required/>
                             </div>
    <div class="registrationFormAlert" id="divCheckPasswordMatch">
</div></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td><b>Gender:</b></td>
                                <td><input type='radio' name='sex' value="male"checked>Male
                                        <input type="radio" name="sex" value="female">Female</td>
                                <td><b>Address:</b></td>
                                <td><input type='text'  placeholder="Address" name='addr' required></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                <td><b>Bank Name:</b></td>
                                <td>
                         <select name="bankname" style="width:61%; padding-left:  39px;">
                                             <option value="" ><--Select--></option>
                                             <option value="sbi">SBI</option>
                                             <option value="hdfc">HDFC</option>
                                             <option value="kotak">KOTAK</option>
                                             <option value="icici">ICICI</option>
                                             <option value="indian">INDIAN</option>
                         </select>
                    </td>
                                
                                <td ><b>Image Password:</b> </td>
                                <td><input type="file"  name="photo"  size="50" accept="image/*" required style="width: 155px" />&nbsp;
                                <input type="file"  name="photo1"  size="50" accept="image/*" required style="width: 155px" /></td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr align="center">
                                
                                <td><b>Aadhaar Number</b></td>
                                <td><input type="text"  placeholder="Aadhar Number" name="ano" id="ano" required="required" style="width: 155px" /></td>
                                
                                <td><b>Account Type</b></td><td><input type="radio" name="ac" id="ac" value="savings" onclick="val58()"/>Savings
                                                                        <input type="radio" name="ac"  id="ac1" value="current" onclick="val59()" />Current
                                                                        <input type="radio" name="ac"   id="ac2" value="joint" onclick="val60()" />joint
                                                                </td>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <!--tr align="center">
                               <td><b>Company Name</b></td><td><input type="text"  placeholder="Company Name" name="com" id="com" required="required"/></td>
                                <td><b>Second ACC Holder</b></td><td><input type="text"  placeholder="Second ACC Holder" name="sec" id="sec" required="required"></input></td>
                            </tr-->
                            
                            
                        </table></center><br><br>
                                <center> <input type="submit" value="Register" name="register" style="background-color: #008dde;height:40px; width:120px;color: white" /></center>
                            </form>
         
            </div>
      </div>
    <div class="content_resize">
      <div class="mainbar">
        </div>
        <!--<p class="pages"><small>Page 1 of 2</small> <span>1</span> <a href="#">2</a> <a href="#">&raquo;</a></p>-->
    </div>
      </div>
  </div>

  <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue">A Trust Sector</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
