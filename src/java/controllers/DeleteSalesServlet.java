package controllers;

import models.SalesDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteSalesServlet")
public class DeleteSalesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int saleId = Integer.parseInt(request.getParameter("saleId"));

        SalesDAO salesDAO = new SalesDAO();
        try {
            salesDAO.deleteSale(saleId);
            response.sendRedirect("manageSales.jsp");
        } catch (IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
