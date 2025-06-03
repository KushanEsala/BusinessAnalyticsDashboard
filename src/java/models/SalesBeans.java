package models;

import java.math.BigDecimal;
import java.sql.Date;

public class SalesBeans {
    private int saleId;               // INT(11) - Primary Key, AUTO_INCREMENT
    private int productId;            // INT(11) - Indexed
    private Date saleDate;            // DATE
    private int quantity;             // INT(11)
    private BigDecimal totalPrice;   // DECIMAL(10,2)
    private BigDecimal productPrice;

    // Getters and Setters
    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }


}
