/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import DbConnection.DbConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class registration extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3308/bank";
    private String dbUser = "root";
    private String dbPass = "root";

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields


        String Name = request.getParameter("name");
        String last = request.getParameter("last");
        String age = request.getParameter("age");
        String sex = request.getParameter("sex");
        String password = request.getParameter("password");
        String cpass = request.getParameter("cpass");
        String dob = request.getParameter("dob");
        String addr = request.getParameter("addr");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String acc = request.getParameter("acc");
        String bankname = request.getParameter("bankname");
        String branchname = request.getParameter("branchname");
        String aadhar = request.getParameter("ano");
        String actype = request.getParameter("ac");
        String company = request.getParameter("com");
        String secondhold = request.getParameter("sec");
        // String bal=request.getParameter("bal");
        System.out.println(Name + " " + last);

        InputStream photo = null;
        InputStream photo1 = null;
   
        Part profile = request.getPart("photo");
        Part profile1 = request.getPart("photo1");
      

        if (profile != null) {
            // prints out some information for debugging
            System.out.println(profile.getName());
            System.out.println(profile.getSize());
            System.out.println(profile.getContentType());

            // obtains input stream of the upload file
            photo = profile.getInputStream();
        
        }
        if (profile1 != null) {
            System.out.println(profile1.getName());
            System.out.println(profile1.getSize());
            System.out.println(profile1.getContentType());

            // obtains input stream of the upload file
            photo1 = profile1.getInputStream();

        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from user where accountno='" + acc + "'");
            if (rs.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("loginexist.jsp");
                rd.forward(request, response);

            } else {   // constructs SQL statement
                String sql = "INSERT INTO registration (name,lastname,password,confirmpass,dob,age,sex,email,address,accountno,phone,balance,bankname,branchname,statuss,image1,image2,aadhaarno,acctype,company,secacc,creditamount) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, Name);


                if (photo != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setString(2, last);
                    statement.setString(3, password);
                    statement.setString(4, cpass);
                    statement.setString(5, dob);
                    statement.setString(6, age);
                    statement.setString(7, sex);
                    statement.setString(8, email);
                    statement.setString(9, addr);
                    statement.setString(10, acc);
                    statement.setString(11, phone);
                    statement.setString(12, "0");
                    statement.setString(13, bankname);
                    statement.setString(14, branchname);
                    statement.setString(15, "null");
                    statement.setBlob(16, photo);
                    statement.setBlob(17, photo1);
                    statement.setString(18, aadhar);
                    statement.setString(19, actype);
                    statement.setString(20, company);
                    statement.setString(21, secondhold);
                    statement.setString(22, "0");


                }
                HttpSession hs = request.getSession();
                hs.setAttribute("accountno", acc);
                // sends the statement to the database server
                int row = statement.executeUpdate();
                int initail = 0;
                if (row > 0) {
                    Statement smt = DbConnection.getConnection();
                    smt.executeUpdate("insert into credit(accountnumber,creditamount,username) values('" + acc + "','" + initail + "','" + Name + "')");
                    String query1 = "CREATE TABLE  IF NOT EXISTS " + acc + Name + " " + "(Thousand varchar(100),FiveHundred varchar(100),Hundred varchar(100))";
                    // String query2="CREATE TABLE  IF NOT EXISTS "+s+uname+" " + "(Thousand varchar(100),FiveHundred varchar(100),Hundred varchar(100))"; 
                    smt.executeUpdate(query1);
                    System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + query1);
                }
                if (row > 0) {
//                hs.setAttribute("cnt", "1");


                    message = "File uploaded uploadedand saved into database";
                    RequestDispatcher rd = request.getRequestDispatcher("choosepoint.jsp");
                    rd.forward(request, response);
                }
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
            out.print(ex);
        } finally {



            if (conn != null) {

                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

        }
    }
}
