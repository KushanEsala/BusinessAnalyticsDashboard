<%@ page import="models.ProductBean" %>
<%
    ProductBean product = (ProductBean) request.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
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
            max-width: 800px;
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
                        <a class="nav-link" href="home.jsp">Dashboard</a>
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
        <h1>Edit Product</h1>
        <div class="card">
            <div class="card-body">
                <form action="EditProductServlet" method="post">
                    <input type="hidden" name="productId" value="<%= product.getProductId() %>" />

                    <div class="form-group">
                        <label for="productName">Product Name:</label>
                        <input type="text" class="form-control" id="productName" name="productName" value="<%= product.getProductName() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="category">Category:</label>
                        <input type="text" class="form-control" id="category" name="category" value="<%= product.getCategory() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="price">Price:</label>
                        <input type="number" class="form-control" step="0.01" id="price" name="price" value="<%= product.getPrice() %>" required>
                    </div>

                    <div class="form-group">
                        <label for="stockQuantity">Stock Quantity:</label>
                        <input type="number" class="form-control" id="stockQuantity" name="stockQuantity" value="<%= product.getStockQuantity() %>" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Product</button>
                </form>
                <a href="manageProducts.jsp" class="btn btn-secondary mt-3">Back</a>
            </div>
        </div>
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
