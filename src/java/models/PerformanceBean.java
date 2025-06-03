package models;

import java.sql.Date;

public class PerformanceBean {
    private int performanceId;         // INT(11) - Primary Key, AUTO_INCREMENT
    private int employeeId;            // INT(11) - Indexed
    private Date performanceDate;      // DATE
    private int rating;                // INT(11) - Nullable
    private String remarks;            // TEXT - Nullable

    // Getters and Setters
    public int getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(int performanceId) {
        this.performanceId = performanceId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Date getPerformanceDate() {
        return performanceDate;
    }

    public void setPerformanceDate(Date performanceDate) {
        this.performanceDate = performanceDate;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
}
