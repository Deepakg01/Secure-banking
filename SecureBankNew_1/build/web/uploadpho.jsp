
<%@page import="DbConnection.DbConnection"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<html>
<head>
</head>
<body>
<%
String white=null;
String servname=null;
String spname=null;
Calendar currentDate = Calendar.getInstance();
  SimpleDateFormat formatter= 
  new SimpleDateFormat("yyyy/m/dd");
  SimpleDateFormat formatter1= 
  new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
  String dateNow = formatter.format(currentDate.getTime());
  System.out.println("Now the date is :=>  " + dateNow);
  String time=formatter1.format(currentDate.getTime());
  
   String s =request.getParameter("tye");
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
                     String stdate=dateFormat.format(date);
//1024 Kb = 1 Mb
//1024 Mb = 1 Gb
//1GB =  1048576 Kb 
String fPath="";
int fl=0;
long fln=0;
 long flnn=0;
 double us=0,avs=0;  
 String unmaes=null;
Thread.sleep(100);
ArrayList list = new ArrayList();
		//ServletContext context = getServletContext();
//     String aa=(String)session.getAttribute("accno");
//     String bb=(String)session.getAttribute("mobilenum");
   double kb=0; 
    String fname=null;
     String paramname=null;
	String types="";	
     String name=null,des=null,resumename=null,ausr=null,uname="";                                             
                 //uname=session.getAttribute("user").toString();
                  ServletContext context = getServletContext();
		String dirName =context.getRealPath("/userphotos/");
          
                session.setAttribute("paathh", dirName);
      
		  File file1 = null,file11 = null;
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	40 * 1024 * 1024); // 10MB
                          
                            
                            Enumeration files = multi.getFileNames();
	//out.println("cp12");
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
               
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			resumename = multi.getFilesystemName(paramname);
                        System.out.println(resumename);
                            out.println(resumename);
                }
        }            
 String aa=(String)session.getAttribute("acno");
 Statement st23=DbConnection.getConnection();
 Statement st24=DbConnection.getConnection();                                                           
// int gv=st23.executeUpdate("update registration set photo='"+resumename+"' where accountno='"+aa+"' and mobile='"+bb+"'");
 int gv=st23.executeUpdate("update registration set photo='"+resumename+"' where accountno='"+aa+"'");
 if(gv==1)
 {
     response.sendRedirect("Loginphoto.jsp");
 }
                        %>  