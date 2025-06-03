package models;

public class SalesTrend {
    
    private int year;
    private int month;
    private double totalSales;
    
    // Constructor with parameters (int year, int month, double totalSales)
    public SalesTrend(int year, int month, double totalSales) {
        this.year = year;
        this.month = month;
        this.totalSales = totalSales;
    }
    
    // Getters
    public int getYear() {
        return year;
    }
    
    public int getMonth() {
        return month;
    }
    
    public double getTotalSales() {
        return totalSales;
    }
}
