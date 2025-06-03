/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    private Connection connection;

    public ProductDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", ""); 
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public List<ProductBean> getAllProducts() throws SQLException {
        List<ProductBean> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setStockQuantity(rs.getInt("stock_quantity"));
                products.add(product);
            }
        }
        return products;
    }

    public void addProduct(ProductBean product) throws SQLException {
        String query = "INSERT INTO products (product_name, category, price, stock_quantity) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getCategory());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getStockQuantity());
            ps.executeUpdate();
        }
    }

    public void updateProduct(ProductBean product) throws SQLException {
        String query = "UPDATE products SET product_name = ?, category = ?, price = ?, stock_quantity = ? WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getCategory());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getStockQuantity());
            ps.setInt(5, product.getProductId());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int productId) throws SQLException {
        String query = "DELETE FROM products WHERE product_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        }
    }
    public ProductBean getProductById(int productId) {
    ProductBean product = null;
    String query = "SELECT * FROM products WHERE product_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, productId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                product = new ProductBean();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setCategory(rs.getString("category"));
                product.setPrice(rs.getDouble("price"));
                product.setStockQuantity(rs.getInt("stock_quantity"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return product;
}

public int totalProduct() {
    int totalProducts = 0;
    String query = "SELECT COUNT(*) FROM products";  // Assuming the table name is 'products'
    
    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        
        if (rs.next()) {
            totalProducts = rs.getInt(1);  // Retrieve the count
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return totalProducts;
}

    void updateProductStock(int productId, int newStock) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}




