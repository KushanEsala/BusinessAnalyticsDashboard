<%@page import="java.util.List"%>
<%@ page import="models.PerformanceDAO, models.PerformanceBean, models.EmployeeDAO, models.EmployeeBean" %>
<%@ page session="true" %>
<%
    PerformanceDAO performanceDAO = new PerformanceDAO();
    EmployeeDAO employeeDAO = new EmployeeDAO();
    List<PerformanceBean> performances = performanceDAO.getAllPerformances();
    List<EmployeeBean> employees = employeeDAO.getAllEmployees();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Performances</title>
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
            max-width: 1200px;
            margin-top: 30px;
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
                    <li class="nav-item"><a class="nav-link active" href="home.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageProducts.jsp">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="managePerformance.jsp">Performance</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageEmployee.jsp">Employees</a></li>
                    <li class="nav-item"><a class="nav-link" href="manageSales.jsp">Sales</a></li>
                    <li class="nav-item"><a class="nav-link" href="downloadReports.jsp">Reports</a></li>
                    <li class="nav-item"><a class="nav-link" href="Logoutcontroller">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <h1>Manage Performances</h1>

        <!-- Add Performance Form -->
        <form action="AddPerformanceServelet" method="post">
            <div class="form-group">
                <label for="employeeId">Employee</label>
                <select class="form-control" id="employeeId" name="employeeId" required>
                    <option value="">Select Employee</option>
                    <% for (EmployeeBean employee : employees) { %>
                        <option value="<%= employee.getEmployeeId() %>"><%= employee.getEmployeeName() %></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label for="performanceDate">Performance Date</label>
                <input type="date" class="form-control" id="performanceDate" name="performanceDate" required>
            </div>

            <div class="form-group">
                <label for="rating">Rating</label>
                <input type="number" class="form-control" id="rating" name="rating" min="1" max="5" required>
            </div>

            <div class="form-group">
                <label for="remarks">Remarks</label>
                <textarea class="form-control" id="remarks" name="remarks" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Add Performance</button>
        </form>

        <h2 class="mt-4">Performance List</h2>
        <table class="table table-bordered mt-4">
            <thead>
                <tr>
                    <th>Employee Name</th>
                    <th>Performance Date</th>
                    <th>Rating</th>
                    <th>Remarks</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (PerformanceBean performance : performances) {
                    EmployeeBean employee = employeeDAO.getEmployeeById(performance.getEmployeeId());
                %>
                <tr>
                    <td><%= employee != null ? employee.getEmployeeName() : "N/A" %></td>
                    <td><%= performance.getPerformanceDate() %></td>
                    <td><%= performance.getRating() %></td>
                    <td><%= performance.getRemarks() %></td>
                    <td>
                        <a href="EditPerformanceServlet?performanceId=<%= performance.getPerformanceId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeletePerformanceServlet?performanceId=<%= performance.getPerformanceId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this performance?');">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <a href="home.jsp" class="btn btn-secondary">Back</a>
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
