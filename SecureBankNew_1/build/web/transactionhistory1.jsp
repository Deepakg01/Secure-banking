

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
        <title>JSP Page</title>
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
      <div class="menu_nav"></div>
        <h2><img src="images/bitcoin1.jpg" width="900" height="300" style="margin-left: 50px;" /></h2>
        
        <table align="center" border="1">
             <tr><th>Two Thousand Id</th></tr>
        <%
            try{
         String saccno=request.getParameter("saccno");
         int t1=Integer.parseInt(request.getParameter("thousand"));
         int f1=Integer.parseInt(request.getParameter("fivehundred"));
         int h1=Integer.parseInt(request.getParameter("hundred"));
         Statement st=DbConnection.getConnection();
         Statement st1=DbConnection.getConnection();
         Statement st2=DbConnection.getConnection();
         String query="select saccno,Thousand from history where saccno="+saccno+" AND Thousand is not null limit "+t1+"";
         String query1="select saccno,fivehundred from history where saccno="+saccno+" AND fivehundred is not null limit "+f1+"";
         String query2="select saccno,Hundred from history where saccno="+saccno+" AND Hundred is not null limit "+h1+"";
         String thousand=null;
          String fivehundred=null;
          String hundred=null;
          if(t1!=0)
                           {
               ResultSet rs=st.executeQuery(query);
           while(rs.next())
           {
            thousand=rs.getString("Thousand");
            %>
           
            <tr>
                <td>
                    <input type="text" value="<%=thousand%>"/>
                </td>
            </tr>
            <%
               
           }
               %>
                       </table>

               <%
          }
          if(f1!=0)
                    {
          
            ResultSet rs1=st1.executeQuery(query1);
            %>
                        <table align="center" border="1">
          <tr><th>Five Hundred Id</th></tr>
            <%
             while(rs1.next())
           {
            fivehundred=rs1.getString("fivehundred");
            %>
           <tr>
                <td><input type="text" value="<%=fivehundred%>"/></td>
           </tr>
       
            <%
               
           }
            %>
             </table>
            <%
                }
         if(h1!=0)
                           {
            ResultSet rs2=st2.executeQuery(query2);
            %>
            <table align="center" border="1">
          <tr><th>Hundred Id</th></tr>
            <%
             while(rs2.next())
           {
            hundred=rs2.getString("Hundred");
            %>
           
           <tr>
                <td><input type="text" value="<%=hundred%>"/></td>
           </tr>
       
            <%
               
           }
            %>
             </table>
            <%
                       }
            }catch(Exception e){
                out.println(e);
                System.out.println(e);
            }
           
           %>
        <div class="footer">
    <div class="footer_resize">
      <p class="lf" style="color: blue">Copyright &copy; Secure Banking. All Rights Reserved</p>
      <p class="rf" style="color: blue"></p>
      <div style="clear:both;"></div>
    </div>
  </div> 
        
    </body>
</html>
