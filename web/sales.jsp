<%@page import="java.util.List"%>
<%@ page import="models.SalesDAO, models.SalesBeans, models.ProductDAO, models.ProductBean" %>
<%
    // Fetch all sales data
    SalesDAO salesDAO = new SalesDAO();
    List<SalesBeans> sales = salesDAO.getAllSales();

    // Fetch all products data
    ProductDAO productDAO = new ProductDAO();
%>

<html>
<head>
    <title>Sales List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Sales List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity Sold</th>
                    <th>Sale Date</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (SalesBeans sale : sales) {
                        ProductBean product = productDAO.getProductById(sale.getProductId());
                %>
                <tr>
                    <td><%= product.getProductName() %></td>
                    <td><%= sale.getQuantity() %></td>
                    <td><%= sale.getSaleDate() %></td>
                    <td><%= sale.getTotalPrice() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="userDashboard.jsp">Back</a>
    </div>
</body>
</html>
