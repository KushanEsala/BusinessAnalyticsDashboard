<%@ page import="models.SalesDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="models.SalesBeans, models.ProductDAO, models.ProductBean" %>
<%
    // Fetch all sales from the SalesDAO
    SalesDAO salesDAO = new SalesDAO();
    List<SalesBeans> sales = salesDAO.getAllSales();

    // Fetch all products from the ProductDAO
    ProductDAO productDAO = new ProductDAO();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Sales</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #4A90E2;
        }
        .navbar-brand {
            color: white;
        }
        .navbar-nav .nav-link {
            color: white;
        }
        .navbar-nav .nav-link:hover {
            color: #357ABD;
        }
        .container {
            max-width: 900px;
            margin-top: 30px;
        }
        .card {
            margin-bottom: 20px;
        }
        .card-body {
            text-align: center;
        }
        footer {
            background-color: #4A90E2;
            color: white;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">ABC Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="home.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageProducts.jsp">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="managePerformance.jsp">Performance</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageEmployee.jsp">Employees</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageSales.jsp">Sales</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="downloadReports.jsp">Reports</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logoutcontroller">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1>Manage Sales</h1>

        <!-- Display Error Message -->
        <div class="alert alert-danger" <% if(request.getAttribute("error") != null) { %> style="display:block;" <% } else { %> style="display:none;" <% } %>>
            <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
        </div>

        <!-- Add Sale Form -->
        <div class="card">
            <div class="card-header">
                <h3>Add Sale</h3>
            </div>
            <div class="card-body">
                <form action="AddSalesServelet" method="post">
                    <div class="form-group">
                        <label for="productId">Product</label>
                        <select id="productId" name="productId" class="form-control" required>
                            <option value="" disabled selected>Select a product</option>
                            <% 
                                List<ProductBean> products = productDAO.getAllProducts();
                                for (ProductBean product : products) { 
                            %>
                                <option value="<%= product.getProductId() %>"><%= product.getProductName() %></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="saleDate">Sale Date</label>
                        <input type="date" id="saleDate" name="saleDate" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="quantitySold">Quantity Sold</label>
                        <input type="number" id="quantitySold" name="quantitySold" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="totalAmount">Total Amount</label>
                        <input type="number" step="0.01" id="totalAmount" name="totalAmount" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Add Sale</button>
                </form>
            </div>
        </div>

        <!-- Sales List -->
        <h2 class="mt-4">Sales List</h2>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Quantity Sold</th>
                    <th>Sale Date</th>
                    <th>Total Amount</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (SalesBeans sale : sales) {
                        // Fetch the product by its ID from the ProductDAO
                        ProductBean product = productDAO.getProductById(sale.getProductId());
                %>
                    <tr>
                        <td><%= product.getProductName() %></td>
                        <td><%= sale.getQuantity() %></td>
                        <td><%= sale.getSaleDate() %></td>
                        <td><%= sale.getTotalPrice() %></td>
                        <td>
                            <a href="EditSalesServlet?saleId=<%= sale.getSaleId() %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="DeleteSalesServlet?saleId=<%= sale.getSaleId() %>" onclick="return confirm('Are you sure you want to delete this sale?');" class="btn btn-danger btn-sm">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <a href="home.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 ABC Company. All Rights Reserved.
    </footer>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
