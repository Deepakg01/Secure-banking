package newpackage;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author system4
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             String accountno=request.getParameter("Customer Id");
        String pass=request.getParameter("pass");
        String user=request.getParameter("user");
        String pass1=request.getParameter("pass");
        PrintWriter out = response.getWriter();
       boolean f = false;
        //String get=request.getParameter("commit");
        
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/bank","root","root");
                Statement st=con.createStatement();
                ResultSet rs1=st.executeQuery("select * from registration where accountno='"+accountno+"' and password='"+pass+"'");
                
                    if(rs1.next())
                    {       
                        HttpSession hs=request.getSession(true);
                        hs.setAttribute("accountno", accountno);
//                        RequestDispatcher rd=request.getRequestDispatcher("loginwait.jsp");
                        RequestDispatcher rd=request.getRequestDispatcher("login_choosepoint.jsp");
                        rd.forward(request, response);
                                             
                    }else{
   
                
                String aname=request.getParameter("Customer Id");
                String apass=request.getParameter("pass");
                if(aname.equals("admin") && apass.equals("admin")){
                    RequestDispatcher rd=request.getRequestDispatcher("managerhome.jsp");
                    rd.forward(request, response);
                }else{
                    f = true;
                }
                   
    
}
                    if(f){
                         RequestDispatcher rd=request.getRequestDispatcher("/login.jsp?err=fail");
                         rd.forward(request, response);
                                 
                    }
                
        }
            
        catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession hs=request.getSession();
//        hs.setAttribute(user, "user");
        hs.setAttribute(pass, "pass");
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
