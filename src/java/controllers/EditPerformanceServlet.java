package controllers;

import models.PerformanceBean;
import models.PerformanceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/EditPerformanceServlet")
public class EditPerformanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int performanceId = Integer.parseInt(request.getParameter("performanceId"));

        PerformanceDAO performanceDAO = new PerformanceDAO();
        try {
            PerformanceBean performance = null;
            for (PerformanceBean p : performanceDAO.getAllPerformances()) {
                if (p.getPerformanceId() == performanceId) {
                    performance = p;
                    break;
                }
            }
            if (performance != null) {
                request.setAttribute("performance", performance);
                request.getRequestDispatcher("editPerformanceForm.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int performanceId = Integer.parseInt(request.getParameter("performanceId"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        Date performanceDate = Date.valueOf(request.getParameter("performanceDate"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String remarks = request.getParameter("remarks");

        PerformanceBean performance = new PerformanceBean();
        performance.setPerformanceId(performanceId);
        performance.setEmployeeId(employeeId);
        performance.setPerformanceDate(performanceDate);
        performance.setRating(rating);
        performance.setRemarks(remarks);

        PerformanceDAO performanceDAO = new PerformanceDAO();
        try {
            performanceDAO.updatePerformance(performance);
            response.sendRedirect("managePerformance.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
