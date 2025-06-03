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

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        EmployeeDAO employeeDAO = new EmployeeDAO();
        try {
            EmployeeBean employee = null;
            for (EmployeeBean e : employeeDAO.getAllEmployees()) {
                if (e.getEmployeeId() == employeeId) {
                    employee = e;
                    break;
                }
            }
            if (employee != null) {
                request.setAttribute("employee", employee);
                request.getRequestDispatcher("editEmployeeForm.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String position = request.getParameter("position");
        BigDecimal salary = new BigDecimal(request.getParameter("salary"));
        Date hireDate = Date.valueOf(request.getParameter("hireDate"));

        EmployeeBean employee = new EmployeeBean();
        employee.setEmployeeId(employeeId);
        employee.setEmployeeName(employeeName);
        employee.setEmail(email);
        employee.setPhoneNumber(phoneNumber);
        employee.setPosition(position);
        employee.setSalary(salary);
        employee.setHireDate(hireDate);

        EmployeeDAO employeeDAO = new EmployeeDAO();
        try {
            employeeDAO.updateEmployee(employee);
            response.sendRedirect("manageEmployee.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
