package controllers;

import models.ProductBean;
import models.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));

        ProductBean product = new ProductBean();
        product.setProductName(productName);
        product.setCategory(category);
        product.setPrice(price);
        product.setStockQuantity(stockQuantity);

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.addProduct(product);
            response.sendRedirect("manageProducts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
