package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesSummaryDAO {

    private Connection connection;

    public SalesSummaryDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<SalesSummaryBean> getSalesSummary() throws SQLException {
        List<SalesSummaryBean> salesSummaryList = new ArrayList<>();
        String query = "SELECT s.product_id, p.product_name, p.category, SUM(s.quantity) AS total_quantity_sold, SUM(s.total_price) AS total_sales "
                     + "FROM sales s "
                     + "JOIN products p ON s.product_id = p.product_id "
                     + "GROUP BY s.product_id";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SalesSummaryBean bean = new SalesSummaryBean();
                bean.setProductId(rs.getInt("product_id"));
                bean.setProductName(rs.getString("product_name"));
                bean.setCategory(rs.getString("category"));
                bean.setTotalQuantitySold(rs.getInt("total_quantity_sold"));
                bean.setTotalSales(rs.getDouble("total_sales"));
                salesSummaryList.add(bean);
            }
        }
        return salesSummaryList;
    }
}
