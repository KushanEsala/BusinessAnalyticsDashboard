package controllers;

import models.EmployeePerformanceDAO;
import models.MonthlyRevenueDAO;
import models.SalesSummaryDAO;
import models.EmployeePerformanceBean;
import models.MonthlyRevenueBean;
import models.SalesSummaryBean;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class DataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeePerformanceDAO performanceDAO = new EmployeePerformanceDAO();
        MonthlyRevenueDAO revenueDAO = new MonthlyRevenueDAO();
        SalesSummaryDAO salesDAO = new SalesSummaryDAO();

        try {
            List<EmployeePerformanceBean> performanceSummary = performanceDAO.getEmployeePerformanceSummary();
            List<MonthlyRevenueBean> monthlyRevenueSummary = revenueDAO.getMonthlyRevenueSummary();
            List<SalesSummaryBean> salesSummary = salesDAO.getSalesSummary();

            request.setAttribute("performanceSummary", performanceSummary);
            request.setAttribute("monthlyRevenueSummary", monthlyRevenueSummary);
            request.setAttribute("salesSummary", salesSummary);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/viewData.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
