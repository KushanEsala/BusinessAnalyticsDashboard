package controllers;

import models.SalesBeans;
import models.SalesDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/EditSalesServlet")
public class EditSalesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int saleId = Integer.parseInt(request.getParameter("saleId"));

        SalesDAO salesDAO = new SalesDAO();
        try {
            SalesBeans sale = salesDAO.getSaleById(saleId); // Use getSaleById from SalesDAO
            if (sale != null) {
                request.setAttribute("sale", sale);
                request.getRequestDispatcher("editSalesForm.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sale not found");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching sale details.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Validate parameters before parsing
            String saleIdStr = request.getParameter("saleId");
            String productIdStr = request.getParameter("productId");
            String saleDateStr = request.getParameter("saleDate");
            String quantityStr = request.getParameter("quantity");
            String totalPriceStr = request.getParameter("totalPrice");

            // Check if any parameter is null or empty
            if (saleIdStr == null || productIdStr == null || saleDateStr == null ||
                quantityStr == null || totalPriceStr == null || 
                saleIdStr.isEmpty() || productIdStr.isEmpty() || saleDateStr.isEmpty() ||
                quantityStr.isEmpty() || totalPriceStr.isEmpty()) {

                // Handle the case where parameters are missing
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("editSalesForm.jsp").forward(request, response);
                return;
            }

            // Parse the parameters if they're valid
            int saleId = Integer.parseInt(saleIdStr);
            int productId = Integer.parseInt(productIdStr);
            Date saleDate = Date.valueOf(saleDateStr);
            int quantity = Integer.parseInt(quantityStr);
            BigDecimal totalPrice = new BigDecimal(totalPriceStr);

            // Create SalesBeans object and set the values
            SalesBeans sale = new SalesBeans();
            sale.setSaleId(saleId);
            sale.setProductId(productId);
            sale.setSaleDate(saleDate);
            sale.setQuantity(quantity);
            sale.setTotalPrice(totalPrice);

            // Update the sale in the database
            SalesDAO salesDAO = new SalesDAO();
            salesDAO.updateSale(sale);

            // Redirect to the manage sales page
            response.sendRedirect("manageSales.jsp");

        } catch (NumberFormatException e) {
            // Catch NumberFormatException for invalid inputs
            request.setAttribute("error", "Invalid number format. Please check your input.");
            request.getRequestDispatcher("editSalesForm.jsp").forward(request, response);
        } catch (SQLException e) {
            // Catch SQLException for database-related errors
            request.setAttribute("error", "Error updating the sale in the database.");
            request.getRequestDispatcher("editSalesForm.jsp").forward(request, response);
        } catch (Exception e) {
            // Catch other exceptions
            request.setAttribute("error", "An error occurred while updating the sale.");
            request.getRequestDispatcher("editSalesForm.jsp").forward(request, response);
        }
    }
}
