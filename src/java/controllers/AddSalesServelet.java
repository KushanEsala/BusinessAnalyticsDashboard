package controllers;

import models.SalesDAO;
import models.SalesBeans;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AddSalesServelet")
public class AddSalesServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form parameters
            String productIdStr = request.getParameter("productId");
            String quantitySoldStr = request.getParameter("quantitySold");
            String saleDateStr = request.getParameter("saleDate");
            String totalAmountStr = request.getParameter("totalAmount");

            // Check if any field is null or empty, and handle accordingly
            if (productIdStr == null || quantitySoldStr == null || saleDateStr == null || totalAmountStr == null ||
                productIdStr.isEmpty() || quantitySoldStr.isEmpty() || saleDateStr.isEmpty() || totalAmountStr.isEmpty()) {
                // Redirect to error page or set an error message
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("/manageSales.jsp").forward(request, response);
                return;
            }

            // Parse the integer and BigDecimal values
            int productId = Integer.parseInt(productIdStr);
            int quantitySold = Integer.parseInt(quantitySoldStr);
            java.sql.Date saleDate = java.sql.Date.valueOf(saleDateStr);
            java.math.BigDecimal totalAmount = new java.math.BigDecimal(totalAmountStr);

            // Create a new SalesBeans object and set the values
            SalesBeans sale = new SalesBeans();
            sale.setProductId(productId);
            sale.setQuantity(quantitySold);
            sale.setSaleDate(saleDate);
            sale.setTotalPrice(totalAmount);

            // Create SalesDAO instance and add sale to the database
            SalesDAO salesDAO = new SalesDAO();
            salesDAO.addSale(sale);

            // Now invoke the database procedure for handling product sale (optional, if needed)
            handleProductSale(productId, quantitySold, totalAmount);

            // Redirect to the sales management page
            response.sendRedirect("manageSales.jsp");

        } catch (NumberFormatException e) {
            // Handle the error gracefully
            request.setAttribute("error", "Invalid input for numerical fields.");
            request.getRequestDispatcher("/manageSales.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle SQL exceptions (e.g., database connection errors)
            request.setAttribute("error", "An error occurred while adding the sale.");
            request.getRequestDispatcher("/manageSales.jsp").forward(request, response);
        } catch (Exception e) {
            // General error handling
            request.setAttribute("error", "An unexpected error occurred.");
            request.getRequestDispatcher("/manageSales.jsp").forward(request, response);
        }
    }

    // Procedure call for handling product sale (if necessary)
    private void handleProductSale(int productId, int quantitySold, java.math.BigDecimal totalAmount) throws SQLException {
        SalesDAO salesDAO = new SalesDAO();
        // Optionally, you can add logic here to handle further product sale procedures, like stock update.
    }
}
