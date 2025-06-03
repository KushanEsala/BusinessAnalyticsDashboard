<%@ page import="models.PerformanceBean" %>
<%
    PerformanceBean performance = (PerformanceBean) request.getAttribute("performance");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Performance</title>
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
        .card-body h5 {
            font-size: 18px;
            color: #FFFFFF;
        }
        .card-body h3 {
            font-size: 36px;
            color: #FFFFFF;
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
        <h1>Edit Performance</h1>

        <!-- Edit Performance Form -->
        <form action="EditPerformanceServlet" method="post">
            <input type="hidden" name="performanceId" value="<%= performance.getPerformanceId() %>" />

            <div class="form-group">
                <label for="employeeId">Employee ID:</label>
                <input type="number" class="form-control" id="employeeId" name="employeeId" value="<%= performance.getEmployeeId() %>" required>
            </div>

            <div class="form-group">
                <label for="performanceDate">Performance Date:</label>
                <input type="date" class="form-control" id="performanceDate" name="performanceDate" value="<%= performance.getPerformanceDate() %>" required>
            </div>

            <div class="form-group">
                <label for="rating">Rating:</label>
                <input type="number" class="form-control" id="rating" name="rating" value="<%= performance.getRating() %>" min="1" max="5" required>
            </div>

            <div class="form-group">
                <label for="remarks">Remarks:</label>
                <textarea class="form-control" id="remarks" name="remarks" required><%= performance.getRemarks() %></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Update Performance</button>
        </form>

        <a href="managePerformance.jsp" class="btn btn-secondary mt-3">Back to Performance List</a>
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
