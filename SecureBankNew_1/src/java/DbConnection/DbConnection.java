
package DbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Uniq-F3
 */
public class DbConnection {
    static Statement st;
    public  static Statement getConnection()
    {   
        try {
            Class.forName("com.mysql.jdbc.Driver");
           // Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedatabase","root","admin");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/bank","root","root");
            st=con.createStatement(); 
            
        } catch (SQLException ex) {
            Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return st;
    }
     public static  void main(String args[])
 {
       DbConnection.getConnection();
    
}
}
