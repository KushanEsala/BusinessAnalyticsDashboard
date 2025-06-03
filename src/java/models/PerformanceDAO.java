/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PerformanceDAO {

    private Connection connection;

    public PerformanceDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<PerformanceBean> getAllPerformances() throws SQLException {
        List<PerformanceBean> performances = new ArrayList<>();
        String query = "SELECT * FROM performance";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                PerformanceBean performance = new PerformanceBean();
                performance.setPerformanceId(rs.getInt("performance_id"));
                performance.setEmployeeId(rs.getInt("employee_id"));
                performance.setPerformanceDate(rs.getDate("performance_date"));
                performance.setRating(rs.getInt("rating"));
                performance.setRemarks(rs.getString("remarks"));
                performances.add(performance);
            }
        }
        return performances;
    }

    public void addPerformance(PerformanceBean performance) throws SQLException {
        String query = "INSERT INTO performance (employee_id, performance_date, rating, remarks) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, performance.getEmployeeId());
            ps.setDate(2, performance.getPerformanceDate());
            ps.setInt(3, performance.getRating());
            ps.setString(4, performance.getRemarks());
            ps.executeUpdate();
        }
    }

    public void updatePerformance(PerformanceBean performance) throws SQLException {
        String query = "UPDATE performance SET employee_id = ?, performance_date = ?, rating = ?, remarks = ? WHERE performance_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, performance.getEmployeeId());
            ps.setDate(2, performance.getPerformanceDate());
            ps.setInt(3, performance.getRating());
            ps.setString(4, performance.getRemarks());
            ps.setInt(5, performance.getPerformanceId());
            ps.executeUpdate();
        }
    }

    public void deletePerformance(int performanceId) throws SQLException {
        String query = "DELETE FROM performance WHERE performance_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, performanceId);
            ps.executeUpdate();
        }
    }
    
    public List<PerformanceBean> getPerformancesByMonth(int year, int month) throws SQLException {
    List<PerformanceBean> performances = new ArrayList<>();
    String query = "SELECT * FROM performance WHERE YEAR(performance_date) = ? AND MONTH(performance_date) = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, year);
        ps.setInt(2, month);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                PerformanceBean performance = new PerformanceBean();
                performance.setPerformanceId(rs.getInt("performance_id"));
                performance.setEmployeeId(rs.getInt("employee_id"));
                performance.setPerformanceDate(rs.getDate("performance_date"));
                performance.setRating(rs.getInt("rating"));
                performance.setRemarks(rs.getString("remarks"));
                performances.add(performance);
            }
        }
    }
    return performances;
}

}
