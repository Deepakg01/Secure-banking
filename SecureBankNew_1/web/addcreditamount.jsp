
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DbConnection.DbConnection"%>
<%@page import="source.HMAC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String tablename = (String) session.getAttribute("tablename");
                String uname = request.getParameter("uname");
                String accno = request.getParameter("accno");
                String thou = request.getParameter("thou");
                String five = request.getParameter("five");
                String hund = request.getParameter("hun");
                String thouamt = request.getParameter("amt");
                String fiveamt = request.getParameter("amt1");
                String hunamt = request.getParameter("amt2");
                String totalamt = request.getParameter("amt3");
                System.out.println("Tablename" + tablename);
                System.out.println("Username" + uname);
                System.out.println("AccountNo" + accno);
                System.out.println("Thousand" + thou);
                System.out.println("Five" + five);
                System.out.println("Hundred" + hund);
                System.out.println("Thousand_Amount" + thouamt);
                System.out.println("Five_Amount" + fiveamt);
                System.out.println("Hundred_Amount" + hunamt);
                System.out.println("Total_Amount" + totalamt);
                int tamt = Integer.parseInt(totalamt);
                int camount = 0;
                int totalamt1 = 0;
                int thousand = Integer.parseInt(thou);
                int fivehundred = Integer.parseInt(five);
                int hundred = Integer.parseInt(hund);
                HMAC h = new HMAC();
                Statement sts1 = DbConnection.getConnection();
                ResultSet rss = sts1.executeQuery("select * from registration where accountno='" + accno + "'");
                if (rss.next()) {
                    camount = rss.getInt("creditamount");
                    totalamt1 = tamt + camount;
                }
                String updquery = "UPDATE registration SET creditamount='" + totalamt1 + "' where accountno='" + accno + "'";
                String updquery1 = "UPDATE credit SET creditamount='" + totalamt1 + "' where accountnumber='" + accno + "'";
                Statement sts = DbConnection.getConnection();
                Statement stst = DbConnection.getConnection();
                sts.executeUpdate(updquery);
                stst.executeUpdate(updquery1);

                if (thousand > 0) {
                    out.println("Thousand...");
                    for (int i = 1; i <= thousand; i++) {
                        String tho = h.Thousand();
                        //    out.println(tho );
                        Statement st = DbConnection.getConnection();
                        String query = "insert into " + tablename + "(Thousand,FiveHundred,Hundred) values('" + tho + "',NULL,NULL)";
                        st.execute(query);
                        out.println("sucess");
                    }
                }
                if (fivehundred > 0) {
                    out.println("Five Hundred...");
                    for (int i = 1; i <= fivehundred; i++) {
                        String fiv = h.FiveHundred();
                        //  out.println(fiv);
                        Statement st1 = DbConnection.getConnection();
                        String query1 = "insert into " + tablename + "(Thousand,FiveHundred,Hundred) values(NULL,'" + fiv + "',NULL)";
                        st1.execute(query1);
                        out.println("sucess");
                    }
                }
                if (hundred > 0) {
                    out.println("Hundred...");
                    for (int i = 1; i <= hundred; i++) {
                        String hund1 = h.Hundred();

                        Statement st2 = DbConnection.getConnection();
                        String query2 = "insert into " + tablename + "(Thousand,FiveHundred,Hundred) values(NULL,NULL,'" + hund1 + "')";
                        st2.execute(query2);
                        out.println("sucess");
                    }
                }
                response.sendRedirect("amountadd.jsp");
            } catch (Exception e) {
                out.println(e);
                System.out.println(e);

            }
        %>
    </body>
</html>
