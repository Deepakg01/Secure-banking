
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function cal()
            {
              var th=document.getElementById("th").value;
                alert(th);
            }
        </script>
    </head>
    <body>
                 
        <%
            try{
         String sname=request.getParameter("uname");
         String rname=request.getParameter("accname");            
         String sacc=request.getParameter("saccname");  
         String racc=request.getParameter("raccno");
         String thousand=request.getParameter("thousand");
         String fivehundred=request.getParameter("fivehun");
         String hundred=request.getParameter("hundred");
         String amt=request.getParameter("amt");
         String date=request.getParameter("date");
         String time=request.getParameter("time");
//         long receiveraccount=Integer.parseInt(racc);
         Statement statement=DbConnection.getConnection();   
         String mainquery="select * from registration where accountno='"+racc+"'"; 
         ResultSet res=statement.executeQuery(mainquery);  
         int accnum=0;          
        if(res.next())
        {
            String acnum=res.getString("accountno");
//           accnum=Integer.parseInt(acnum);
           if(acnum.equals(racc))
                             {
                 int amount=Integer.parseInt(amt);
         int t1=Integer.parseInt(thousand);
         int f1=Integer.parseInt(fivehundred);
         int h1=Integer.parseInt(hundred);
         
         String rtablename=racc+rname;
        //insert transaction history table
          String quer10="select * from registration where accountno='"+sname+"'";
         Statement stst10=DbConnection.getConnection();
           ResultSet rss10=stst10.executeQuery(quer10);
           int creditamount10=0;
           int trans=Integer.parseInt(amt);
           while(rss10.next()){
               creditamount10=rss10.getInt("creditamount");
               
               
           }
           if(creditamount10<trans || creditamount10<0){
               response.sendRedirect("low.jsp");
           }else{
         Statement st12=DbConnection.getConnection();
         String historyinsert="insert into transactionhistory(fromaccount,toaccount,thousand,fivehundred,hundred,sendername,receivername,amount,selectdate,selecttime) values('"+sacc+"','"+racc+"','"+t1+"','"+f1+"','"+h1+"','"+sname+"','"+rname+"','"+amount+"','"+date+"','"+time+"')";
         st12.executeUpdate(historyinsert);
         
     String query="show tables";
     Statement stmt=DbConnection.getConnection();
     Statement stmt1=DbConnection.getConnection();
     ResultSet rs= stmt.executeQuery(query);
     String tablename=null;
     int flag=0;
     while(rs.next())
                 {
         tablename=rs.getString(1);
         if(tablename.contains(sname+sacc))
                         {
             flag=1;
             break;
         }
     }
     System.out.println(tablename);
     
         int creditamount=0;
         int finalamount=0;
         String quer1="select * from registration where accountno='"+sname+"'";
         Statement stst=DbConnection.getConnection();
           ResultSet rss6=stst.executeQuery(quer1);
           if(rss6.next())
             {
            creditamount=rss6.getInt("creditamount");
            finalamount=creditamount-amount;
           }
           
          String que="update registration set creditamount="+finalamount+" where accountno="+sname+"";
           Statement st4=DbConnection.getConnection();
           
          if(creditamount>0)
                           {
               st4.executeUpdate(que);
          
                     }
           int creditamount1=0;
            int finalamount1=0;
           String quer12="select * from registration where accountno='"+racc+"'";   
             Statement stst1=DbConnection.getConnection();
            ResultSet rss7=stst1.executeQuery(quer12);
           if(rss7.next())
             {
            creditamount1=rss7.getInt("creditamount");
            finalamount1=creditamount1+amount;
           }
             String que1="update registration set creditamount="+finalamount1+" where accountno="+racc+"";
            Statement st5=DbConnection.getConnection();
             if(creditamount>0)
                           {
              
          st5.executeUpdate(que1);
                     }
            
     Statement stmt2=DbConnection.getConnection();
     Statement stmt3=DbConnection.getConnection();  
     String query1="select Thousand from "+tablename+" where Thousand is not null limit "+t1+"";
     String query2="select FiveHundred from "+tablename+" where FiveHundred is not null limit "+f1+"";
     String query3="select Hundred from "+tablename+" where Hundred is not null limit "+h1+"";
    
     String hun=null,thou=null,fivehun=null;
     int count=0;
     //Delete and insert Thousand column after transaction completed
      ResultSet rs1=stmt1.executeQuery(query1);  
                             
      while(rs1.next())
                 {
          Statement stmt11=DbConnection.getConnection();
          Statement stmt12=DbConnection.getConnection();
           Statement stmt13=DbConnection.getConnection();
              thou=rs1.getString("Thousand");
              String delquery="delete from "+tablename+" where Thousand='"+thou+"'";
              String insquery="insert into "+rtablename+"(Thousand)values('"+thou+"')";
              String history="insert into history(saccno,Thousand) values('"+racc+"','"+thou+"')";
                            stmt11.execute(delquery);  
                            stmt12.execute(insquery);
                            stmt13.execute(history);
                  }
       //Delete and insert FiveHundred column after transaction completed
       ResultSet rs2=stmt2.executeQuery(query2);     
       while(rs2.next())
                 {
          Statement stmt21=DbConnection.getConnection();
          Statement stmt22=DbConnection.getConnection();
           Statement stmt23=DbConnection.getConnection();
              fivehun=rs2.getString("FiveHundred");
              String delquery="delete from "+tablename+" where FiveHundred='"+fivehun+"'";
              String insquery="insert into "+rtablename+"(FiveHundred)values('"+fivehun+"')";
               String history1="insert into history(saccno,fivehundred) values('"+racc+"','"+fivehun+"')";
                            stmt21.execute(delquery);  
                            stmt22.execute(insquery);
                            stmt23.execute(history1);
                  }
        //Delete and insert Hundred column after transaction completed
       ResultSet rs3=stmt3.executeQuery(query3);     
       while(rs3.next())
                 {
          Statement stmt31=DbConnection.getConnection();
           Statement stmt32=DbConnection.getConnection();
            Statement stmt33=DbConnection.getConnection();
              hun=rs3.getString("Hundred");
              String delquery="delete from "+tablename+" where Hundred='"+hun+"'";
              String insquery="insert into "+rtablename+"(Hundred)values('"+hun+"')";
              String history2="insert into history(saccno,Hundred) values('"+racc+"','"+hun+"')";
                            stmt31.execute(delquery);  
                            stmt32.execute(insquery);
                            stmt33.execute(history2);
                  }
       response.sendRedirect("welcome.jsp");

           }
                             }
        }    
else
{
             
             response.sendRedirect("alter.jsp");
}                                           
         
         
         
      
            }catch(Exception e){
                out.println(e);
                System.out.println(e);
            }
       %>
        
         
    </body>
   
</html>
