<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Establishing connection to the database
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    // Database connection parameters (update these with your actual database details)
    String dbURL = "jdbc:mysql://localhost:3306/final_v2"; // Change your_database to the actual database name
    String dbUsername = "root"; // Your database username
    String dbPassword = ""; // Your database password

    // Variables for dynamic values
    int totalProducts = 0;
    int totalEmployees = 0;
    double totalSales = 0;
    int remainingStock = 0;

    List<Map<String, Object>> productList = new ArrayList<>();

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Create a connection
        conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // Fetch total products
        String productsQuery = "SELECT COUNT(*) AS total FROM products"; // Assuming 'products' is the table name
        stmt = conn.createStatement();
        rs = stmt.executeQuery(productsQuery);
        if (rs.next()) {
            totalProducts = rs.getInt("total");
        }

        // Fetch total employees
        String employeesQuery = "SELECT COUNT(*) AS total FROM employees"; // Assuming 'employees' is the table name
        rs = stmt.executeQuery(employeesQuery);
        if (rs.next()) {
            totalEmployees = rs.getInt("total");
        }

        // Fetch total sales sum
        String salesQuery = "SELECT SUM(total_price) AS total_sales FROM sales"; // Assuming 'sales' is the table name
        rs = stmt.executeQuery(salesQuery);
        if (rs.next()) {
            totalSales = rs.getDouble("total_sales");
        }

        // Fetch remaining stock and sales from the procedure
        String stockQuery = "{CALL GetRemainingStockAndSales()}";
        rs = stmt.executeQuery(stockQuery);

        while (rs.next()) {
            Map<String, Object> productData = new HashMap<>();
            productData.put("product_name", rs.getString("product_name"));
            productData.put("remaining_stock", rs.getInt("remaining_stock"));
            productData.put("stocks_sold", rs.getInt("stocks_sold"));
            productList.add(productData);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Inventory Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #4A90E2, #9013FE);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            max-width: 1200px;
            width: 100%;
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
        .card {
            margin-bottom: 20px;
        }
        .card-body {
            text-align: center;
        }
        .card-body h5 {
            font-size: 18px;
            color: #FFFFFF;
        }
        .card-body h3 {
            font-size: 36px;
            color: #FFFFFF;
        }
        .footer {
            background-color: #4A90E2;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .tile-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .tile {
            width: 250px;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            border-radius: 10px;
            color: white;
        }
        table {
            margin-top: 30px;
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4A90E2;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
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
                            <a class="nav-link active" href="#">Dashboard</a>
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
                            <a class="nav-link" href="data.jsp">View Data</a>
                        </li> 
                        <li class="nav-item">
                            <a class="nav-link" href="Logoutcontroller">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <h1 class="text-center text-white mb-4">Welcome, <%= session.getAttribute("username") %>!</h1>

        <!-- Summary Tiles -->
        <div class="tile-container">
            <div class="tile bg-info">
                <div class="card-body">
                    <h5>Total Products</h5>
                    <h3><%= totalProducts %></h3> <!-- Dynamically display total products -->
                </div>
            </div>
            <div class="tile bg-success">
                <div class="card-body">
                    <h5>Total Employees</h5>
                    <h3><%= totalEmployees %></h3> <!-- Dynamically display total employees -->
                </div>
            </div>
            <div class="tile bg-warning">
                <div class="card-body">
                    <h5>Total Sales (LKR)</h5>
                    <h3>₨ <%= String.format("%.2f", totalSales) %></h3> <!-- Dynamically display total sales -->
                </div>
            </div>
        </div>

        <!-- Product Table -->
        <h2 class="text-center text-white mt-5">Product Stock and Sales</h2>
        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Remaining Stock</th>
                    <th>Stocks Sold</th>
                </tr>
            </thead>
            <tbody>
                <% for (Map<String, Object> product : productList) { %>
                    <tr>
                        <td><%= product.get("product_name") %></td>
                        <td><%= product.get("remaining_stock") %></td>
                        <td><%= product.get("stocks_sold") %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Footer -->
        <footer class="footer">
            &copy; 2024 ABC Company. All Rights Reserved.
        </footer>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
