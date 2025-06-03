/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalesDAO {

    private Connection connection;

    public SalesDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public List<SalesBeans> getAllSales() throws SQLException {
        List<SalesBeans> sales = new ArrayList<>();
        String query = "SELECT * FROM sales";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                SalesBeans sale = new SalesBeans();
                sale.setSaleId(rs.getInt("sale_id"));
                sale.setProductId(rs.getInt("product_id"));
                sale.setSaleDate(rs.getDate("sale_date"));
                sale.setQuantity(rs.getInt("quantity"));
                sale.setTotalPrice(rs.getBigDecimal("total_price"));
                sales.add(sale);
            }
        }
        return sales;
    }

    public void addSale(SalesBeans sale) throws SQLException {
        String query = "INSERT INTO sales (product_id, sale_date, quantity, total_price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, sale.getProductId());
            ps.setDate(2, sale.getSaleDate());
            ps.setInt(3, sale.getQuantity());
            ps.setBigDecimal(4, sale.getTotalPrice());
            ps.executeUpdate();
        }
    }

    public void updateSale(SalesBeans sale) throws SQLException {
        String query = "UPDATE sales SET product_id = ?, sale_date = ?, quantity = ?, total_price = ? WHERE sale_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, sale.getProductId());
            ps.setDate(2, sale.getSaleDate());
            ps.setInt(3, sale.getQuantity());
            ps.setBigDecimal(4, sale.getTotalPrice());
            ps.setInt(5, sale.getSaleId());
            ps.executeUpdate();
        }
    }

    public void deleteSale(int saleId) throws SQLException {
        String query = "DELETE FROM sales WHERE sale_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, saleId);
            ps.executeUpdate();
        }
    }
    
    public List<SalesBeans> getSalesByMonth(int year, int month) throws SQLException {
    List<SalesBeans> salesRecords = new ArrayList<>();
    String query = "SELECT * FROM sales WHERE YEAR(sale_date) = ? AND MONTH(sale_date) = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, year);
        ps.setInt(2, month);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                SalesBeans sale = new SalesBeans();
                sale.setSaleId(rs.getInt("sale_id"));
                sale.setProductId(rs.getInt("product_id"));
                sale.setQuantity(rs.getInt("quantity"));
                sale.setTotalPrice(rs.getBigDecimal("total_price"));
                sale.setSaleDate(rs.getDate("sale_date"));
                salesRecords.add(sale);
            }
        }
    }
    return salesRecords;
}
    
    public double totalSalesIncome() {
    double totalIncome = 0.0;
    String query = "SELECT SUM(price) FROM sales";  // Assuming the table name is 'sales' and it has a 'price' column
    
    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        
        if (rs.next()) {
            totalIncome = rs.getDouble(1);  // Retrieve the sum of all prices
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return totalIncome;
}

public int getRecentSalesQuantity() {
    int totalQuantity = 0;
    String query = "SELECT SUM(quantity) FROM sales ORDER BY sale_date DESC LIMIT 4";  // Sum of quantities for the last 4 sales

    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            totalQuantity = rs.getInt(1);  // Retrieve the sum of quantities
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return totalQuantity;
}
public SalesBeans getSaleById(int saleId) throws SQLException {
    SalesBeans sale = null;
    String query = "SELECT * FROM sales WHERE sale_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, saleId);  // Set the saleId parameter
        
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                sale = new SalesBeans();
                sale.setSaleId(rs.getInt("sale_id"));
                sale.setProductId(rs.getInt("product_id"));
                sale.setQuantity(rs.getInt("quantity"));
                sale.setTotalPrice(rs.getBigDecimal("total_price"));
                sale.setSaleDate(rs.getDate("sale_date"));
            }
        }
    }
    return sale;
}

private void handleProductSale(int productId, int quantitySold, java.math.BigDecimal totalAmount) throws SQLException {
    SalesDAO salesDAO = new SalesDAO();

    // Update product stock after sale
    ProductDAO productDAO = new ProductDAO();
    ProductBean product = productDAO.getProductById(productId);  // Fetch the product by its ID

    if (product != null) {
        int newStock = product.getStock() - quantitySold;
        if (newStock >= 0) {
            // Update the product stock in the database
            productDAO.updateProductStock(productId, newStock);
        } else {
            throw new SQLException("Insufficient stock for the product.");
        }
    } else {
        throw new SQLException("Product not found.");
    }
}


}
