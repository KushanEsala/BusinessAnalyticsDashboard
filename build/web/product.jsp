<%@page import="java.util.List"%>
<%@ page import="models.ProductDAO, models.ProductBean" %>
<%
    // Fetch all products data
    ProductDAO productDAO = new ProductDAO();
    List<ProductBean> products = productDAO.getAllProducts();
%>

<html>
<head>
    <title>Products List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Products List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (ProductBean product : products) {
                %>
                <tr>
                    <td><%= product.getProductId() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= product.getPrice() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="userDashboard.jsp">Back</a>
    </div>
</body>
</html>
