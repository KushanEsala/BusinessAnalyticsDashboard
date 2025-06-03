package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeePerformanceDAO {

    private Connection connection;

    public EmployeePerformanceDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<EmployeePerformanceBean> getEmployeePerformanceSummary() throws SQLException {
        List<EmployeePerformanceBean> performanceSummaryList = new ArrayList<>();
        String query = "SELECT e.employee_id, e.employee_name, e.position, e.email, e.phone_number, p.performance_date, p.rating, p.remarks "
                     + "FROM employees e "
                     + "JOIN performance p ON e.employee_id = p.employee_id";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                EmployeePerformanceBean bean = new EmployeePerformanceBean();
                bean.setEmployeeId(rs.getInt("employee_id"));
                bean.setEmployeeName(rs.getString("employee_name"));
                bean.setPosition(rs.getString("position"));
                bean.setEmail(rs.getString("email"));
                bean.setPhoneNumber(rs.getString("phone_number"));
                bean.setPerformanceDate(rs.getString("performance_date"));
                bean.setRating(rs.getInt("rating"));
                bean.setRemarks(rs.getString("remarks"));
                performanceSummaryList.add(bean);
            }
        }
        return performanceSummaryList;
    }
}
