<%@ page import="java.util.List" %>
<%@ page import="models.EmployeeDAO, models.EmployeeBean" %>
<%@ page session="true" %>
<%
    EmployeeDAO employeeDAO = new EmployeeDAO();
    List<EmployeeBean> employees = employeeDAO.getAllEmployees();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
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
            max-width: 1000px;
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
        <h1>Manage Employees</h1>
        <a href="performanceChart.jsp" class="btn btn-secondary">Performance chart</a>

        <!-- Add Employee Form -->
        <form action="AddEmployeeServelet" method="post">
            <div class="form-group">
                <label for="employeeName">Employee Name:</label>
                <input type="text" class="form-control" id="employeeName" name="employeeName" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
            </div>

            <div class="form-group">
                <label for="position">Position:</label>
                <input type="text" class="form-control" id="position" name="position" required>
            </div>

            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" step="0.01" class="form-control" id="salary" name="salary" required>
            </div>

            <div class="form-group">
                <label for="hireDate">Hire Date:</label>
                <input type="date" class="form-control" id="hireDate" name="hireDate" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>

        <h2 class="mt-4">Employee List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Position</th>
                    <th>Salary</th>
                    <th>Hire Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (EmployeeBean employee : employees) { %>
                <tr>
                    <td><%= employee.getEmployeeId() %></td>
                    <td><%= employee.getEmployeeName() %></td>
                    <td><%= employee.getEmail() %></td>
                    <td><%= employee.getPhoneNumber() %></td>
                    <td><%= employee.getPosition() %></td>
                    <td><%= employee.getSalary() %></td>
                    <td><%= employee.getHireDate() %></td>
                    <td>
                        <a href="EditEmployeeServlet?employeeId=<%= employee.getEmployeeId() %>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="DeleteEmployeeServlet?employeeId=<%= employee.getEmployeeId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
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
