package controllers;

import models.PerformanceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeletePerformanceServlet")
public class DeletePerformanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int performanceId = Integer.parseInt(request.getParameter("performanceId"));

        PerformanceDAO performanceDAO = new PerformanceDAO();
        try {
            performanceDAO.deletePerformance(performanceId);
            response.sendRedirect("managePerformance.jsp");
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
