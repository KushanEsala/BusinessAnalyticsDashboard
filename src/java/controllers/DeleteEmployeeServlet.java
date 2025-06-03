package controllers;

import models.EmployeeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        EmployeeDAO employeeDAO = new EmployeeDAO();
        try {
            employeeDAO.deleteEmployee(employeeId);
            response.sendRedirect("manageEmployee.jsp");
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
