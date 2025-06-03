/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private Connection connection;

    public EmployeeDAO() {
        try {
            this.connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    public List<EmployeeBean> getAllEmployees() throws SQLException {
        List<EmployeeBean> employees = new ArrayList<>();
        String query = "SELECT * FROM employees";

        try (PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                EmployeeBean employee = new EmployeeBean();
                employee.setEmployeeId(rs.getInt("employee_id"));
                employee.setEmployeeName(rs.getString("employee_name"));
                employee.setEmail(rs.getString("email"));
                employee.setPhoneNumber(rs.getString("phone_number"));
                employee.setPosition(rs.getString("position"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employee.setHireDate(rs.getDate("hire_date"));
                employee.setCreatedAt(rs.getTimestamp("created_at"));
                employees.add(employee);
            }
        }
        return employees;
    }

    public void addEmployee(EmployeeBean employee) throws SQLException {
        String query = "INSERT INTO employees (employee_name, email, phone_number, position, salary, hire_date) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, employee.getEmployeeName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPhoneNumber());
            ps.setString(4, employee.getPosition());
            ps.setBigDecimal(5, employee.getSalary());
            ps.setDate(6, employee.getHireDate());
            ps.executeUpdate();
        }
    }

    public void updateEmployee(EmployeeBean employee) throws SQLException {
        String query = "UPDATE employees SET employee_name = ?, email = ?, phone_number = ?, position = ?, salary = ?, hire_date = ? WHERE employee_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, employee.getEmployeeName());
            ps.setString(2, employee.getEmail());
            ps.setString(3, employee.getPhoneNumber());
            ps.setString(4, employee.getPosition());
            ps.setBigDecimal(5, employee.getSalary());
            ps.setDate(6, employee.getHireDate());
            ps.setInt(7, employee.getEmployeeId());
            ps.executeUpdate();
        }
    }

    public void deleteEmployee(int employeeId) throws SQLException {
        String query = "DELETE FROM employees WHERE employee_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, employeeId);
            ps.executeUpdate();
        }
    }
    
    public int totalEmployees() {
    int totalEmployees = 0;
    String query = "SELECT COUNT(*) FROM employees";  // Assuming the table name is 'employees'
    
    try (PreparedStatement ps = connection.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {
        
        if (rs.next()) {
            totalEmployees = rs.getInt(1);  // Retrieve the count
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return totalEmployees;
}
public EmployeeBean getEmployeeById(int employeeId) throws SQLException {
    EmployeeBean employee = null;
    String query = "SELECT * FROM employees WHERE employee_id = ?";
    try (PreparedStatement ps = connection.prepareStatement(query)) {
        ps.setInt(1, employeeId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                employee = new EmployeeBean();
                employee.setEmployeeId(rs.getInt("employee_id"));
                employee.setEmployeeName(rs.getString("employee_name"));
                employee.setEmail(rs.getString("email"));
                employee.setPhoneNumber(rs.getString("phone_number"));
                employee.setPosition(rs.getString("position"));
                employee.setSalary(rs.getBigDecimal("salary"));
                employee.setHireDate(rs.getDate("hire_date"));
                employee.setCreatedAt(rs.getTimestamp("created_at"));
            }
        }
    }
    return employee;
}

}
