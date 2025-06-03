package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MonthlyRevenueDAO {

    private Connection connection;

    public MonthlyRevenueDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<MonthlyRevenueBean> getMonthlyRevenueSummary() throws SQLException {
        List<MonthlyRevenueBean> revenueSummaryList = new ArrayList<>();
        String query = "SELECT YEAR(s.sale_date) AS year, MONTH(s.sale_date) AS month, SUM(s.total_price) AS total_revenue "
                     + "FROM sales s "
                     + "GROUP BY YEAR(s.sale_date), MONTH(s.sale_date)";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                MonthlyRevenueBean bean = new MonthlyRevenueBean();
                bean.setYear(rs.getInt("year"));
                bean.setMonth(rs.getInt("month"));
                bean.setTotalRevenue(rs.getDouble("total_revenue"));
                revenueSummaryList.add(bean);
            }
        }
        return revenueSummaryList;
    }
}
