
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class pixelcomparison1 extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet pixelcomparison</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet pixelcomparison at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException 
//    {
//     
//               
//    }
//    
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();

        try {
            String x = request.getParameter("imag.x");
            System.out.println(x);
            int xpoint = Integer.parseInt(x);
            System.out.println(xpoint);
            String y = request.getParameter("imag.y");
            int ypoint = Integer.parseInt(y);
            System.out.println(ypoint);
            HttpSession hs = request.getSession();
            String accountno = (String) hs.getAttribute("accountno");
            hs.setAttribute("accno", accountno);
            System.out.println("user accountno" + accountno);
            String taccountno = (String) hs.getAttribute("viewaccount");
            String amountt = (String) hs.getAttribute("amount");
            System.out.println("amount" + amountt);
            System.out.println("transaction accountno" + taccountno);
//     String balanceoftoaccoun=(String)hs.getAttribute("balanceoftoaccoun");
            System.out.println(accountno);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bank", "root", "root");
            Statement st = con.createStatement();
//            ResultSet rs = st.executeQuery("select * from imagepoint1 where accountno='" + accountno + "'");
            String key="secure";
            ResultSet rs = st.executeQuery("select AES_DECRYPT(x,'"+key+"'),AES_DECRYPT(y,'"+key+"') from imagepoint1 where accountno='" + accountno + "'");
            if (rs.next()) {
                String orgx = rs.getString(1);
                int x1 = Integer.parseInt(orgx);
                System.out.println(orgx);
                String orgy = rs.getString(2);
                int y1 = Integer.parseInt(orgy);
                int xpoint1=xpoint+2;
                int xpoint2=xpoint-2;
                int ypoint1=ypoint+2;
                int ypoint2=ypoint-2;
                
                
                if ((x1<=xpoint1 && x1>=xpoint2) && (y1<=ypoint1 && y1>=ypoint2)) {
                    hs.setAttribute("acno", accountno);
                    RequestDispatcher rd = request.getRequestDispatcher("Homepage.jsp");
                    rd.forward(request, response);
                    out.println("Success");
                } else {
                    Alert.cnt++;
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
            out.println(e);
        }
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
