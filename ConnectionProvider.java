package project;
import java.sql.*;

public class ConnectionProvider {
    public static Connection getCon() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL JDBC Driver
            
            // ✅ Corrected JDBC URL
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ospjsp", "root", "WJ28@krhps");
            return con;
        } catch (Exception e) {
            System.out.println("Database connection failed: " + e);
            return null;
        }
    }
}
