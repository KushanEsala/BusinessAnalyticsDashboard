package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesReportDAO {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USERNAME = "your_username";
    private static final String DB_PASSWORD = "your_password";
    
    public List<SalesTrend> getMonthlySalesTrend() {
        List<SalesTrend> trends = new ArrayList<>();
        String query = "SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, SUM(total_amount) AS total_sales " +
                       "FROM sales " +
                       "GROUP BY YEAR(sale_date), MONTH(sale_date) " +
                       "ORDER BY year DESC, month DESC";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                int year = rs.getInt("year");
                int month = rs.getInt("month");
                double totalSales = rs.getDouble("total_sales");
                
                // Use the constructor with parameters
                SalesTrend trend = new SalesTrend(year, month, totalSales);
                trends.add(trend);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return trends;
    }
}
