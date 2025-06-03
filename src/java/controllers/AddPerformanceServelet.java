package controllers;

import models.PerformanceBean;
import models.PerformanceDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/AddPerformanceServelet")
public class AddPerformanceServelet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        Date performanceDate = Date.valueOf(request.getParameter("performanceDate"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String remarks = request.getParameter("remarks");

        PerformanceBean performance = new PerformanceBean();
        performance.setEmployeeId(employeeId);
        performance.setPerformanceDate(performanceDate);
        performance.setRating(rating);
        performance.setRemarks(remarks);

        PerformanceDAO performanceDAO = new PerformanceDAO();
        try {
            performanceDAO.addPerformance(performance);
            response.sendRedirect("managePerformance.jsp");
        } catch (IOException | SQLException e) {
        }
    }
}
