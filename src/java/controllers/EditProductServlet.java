package controllers;

import models.ProductBean;
import models.ProductDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDAO productDAO = new ProductDAO();
        try {
            ProductBean product = null;
            for (ProductBean p : productDAO.getAllProducts()) {
                if (p.getProductId() == productId) {
                    product = p;
                    break;
                }
            }
            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("editProductForm.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));

        ProductBean product = new ProductBean();
        product.setProductId(productId);
        product.setProductName(productName);
        product.setCategory(category);
        product.setPrice(price);
        product.setStockQuantity(stockQuantity);

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.updateProduct(product);
            response.sendRedirect("manageProducts.jsp");
        } catch (IOException | SQLException e) {
        }
    }
}
