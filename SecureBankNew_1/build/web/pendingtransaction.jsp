
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
        <script>
            function myFunction()
            {
                var username = document.getElementById("uname").value;
                var password = document.getElementById("pwd").value;
                var user = username.trim().length;
                var pass = password.trim().length;
                if (user == "")
                {
                    alert("please enter The Username!!!Username field cannot be empty")
                    return false;
                }
                if (pass == "")
                {
                    alert("please enter The Password!!!password field cannot be empty");
                    return false;
                }
            }
        </script>
        <!-- CuFon ends -->
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
                            <li><a href="#">Contacts</a></li>
                            <li><a href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                    <!--        <img src="images/bitcoin1.jpg" width="345" height="193" alt="image" class="hbgimg" />-->
                </div>
                <div class="clr"></div>
            </div>


            <div class="content">
                <div class="content_resize">
                    <div class="mainbar"><div class="article">
                            <img src="images/bb.jpg" width="900" height="300"  style="margin-left: -250px"/>
                        </div>
                        
                        <div class="article">
                            <h2>&nbsp;</h2>
                        </div>
                        <div class="clr"></div>
                    </div>
                    <div class="clr"></div>

                </div>
<div style="width: 98%;">
                            <div>
                                <form action="txnstatus.jsp">
                                    <p style="color: white">Enter the Account number:<input type="text" name="accno" /><input type="submit" /></p>
                                </form>
                            </div>
    <div style="width: 100%;overflow-x: scroll;" >
                                
                                    <table border="2">
                                        <tr>
                                            <th>Sender Account Number</th> 
                                            <th>Receiver Account Number</th>
                                            <th>Sender Name</th>
                                            <th>Receiver Name</th>
                                            <th>Amount</th>
                                            <th>Thousand</th>
                                            <th>Five Hundred</th>
                                            <th>Hundred</th>
                                            <th>Transaction Date</th>
                                            <th>Transaction Time</th>
                                            <th>Check Id</th>

                                        </tr>

                                        <%
                                            String saccno = null;
                                            String raccno = null;
                                            int amount = 0, thousand = 0, fivehundred = 0, hundred = 0;
                                            String sendname = null;
                                            String recname = null;
                                            String date = null;
                                            String time = null;
                                            Statement st = DbConnection.getConnection();
                                            ResultSet rs = st.executeQuery("select * from transactionhistory");
                                            int uniqid = 0;
                                            while (rs.next()) {
                                                saccno = rs.getString("fromaccount");
                                                raccno = rs.getString("toaccount");
                                                amount = rs.getInt("amount");
                                                thousand = rs.getInt("thousand");
                                                fivehundred = rs.getInt("fivehundred");
                                                hundred = rs.getInt("hundred");
                                                sendname = rs.getString("sendername");
                                                recname = rs.getString("receivername");
                                                date = rs.getString("selectdate");
                                                time = rs.getString("selecttime");

                                        %>

                                        <tr style="text-align:center "><td><input type="text" name="saccno" value="<%=sendname%>"/></td>
                                            <td><input type="text" name="raccno" value="<%=raccno%>"/></td>
                                            <td><input type="text" name="sname" value="<%=saccno%>"/></td>
                                            <td><input type="text" name="sname" value="<%=recname%>"/></td>

                                            <td><input type="text" name="amount" value="<%=amount%>"/></td>
                                            <td><input type="text" name="thousand" value="<%=thousand%>"/></td>
                                            <td><input type="text" name="fivehundred" value="<%=fivehundred%>"/></td>
                                            <td><input type="text" name="hundred" value="<%=hundred%>"/></td>
                                            <td><input type="text" name="fivehundred" value="<%=date%>"/></td>
                                            <td><input type="text" name="hundred" value="<%=time%>"/></td>
                                            <td><a href='transactionhistory1.jsp?saccno=<%=raccno%>&thousand=<%=thousand%>&fivehundred=<%=fivehundred%>&hundred=<%=hundred%>'>check Id</a></td>
                                        </tr>

                                        <%
                                            }

                                        %>
                                    </table>

                                
                            </div>
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






