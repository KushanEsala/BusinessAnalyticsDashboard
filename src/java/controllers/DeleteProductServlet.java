package controllers;

import models.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.deleteProduct(productId);
            response.sendRedirect("manageProducts.jsp");
        } catch (IOException | SQLException e) {
        }
    }
}
