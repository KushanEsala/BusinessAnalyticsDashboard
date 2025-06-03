package controllers;

import models.EmployeeBean;
import models.EmployeeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/AddEmployeeServelet")
public class AddEmployeeServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeName = request.getParameter("employeeName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String position = request.getParameter("position");
        BigDecimal salary = new BigDecimal(request.getParameter("salary"));
        Date hireDate = Date.valueOf(request.getParameter("hireDate"));

        EmployeeBean employee = new EmployeeBean();
        employee.setEmployeeName(employeeName);
        employee.setEmail(email);
        employee.setPhoneNumber(phoneNumber);
        employee.setPosition(position);
        employee.setSalary(salary);
        employee.setHireDate(hireDate);

        EmployeeDAO employeeDAO = new EmployeeDAO();
        try {
            employeeDAO.addEmployee(employee);
            response.sendRedirect("manageEmployee.jsp");
        } catch (IOException | SQLException e) {
        }
    }
}
