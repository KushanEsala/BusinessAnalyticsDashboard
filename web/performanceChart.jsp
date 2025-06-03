<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="models.PerformanceDAO"%>
<%@ page import="models.PerformanceBean"%>
<%@ page import="models.EmployeeDAO"%>
<%@ page import="models.EmployeeBean"%>
<%@ page import="models.DBHelper"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Performance Chart</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
        footer {
            background-color: #4A90E2;
            color: white;
            padding: 10px;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Preparing chart data
            var data = google.visualization.arrayToDataTable([
                ['Employee Name', 'Rating'],
                <% 
                    Connection connection = null;
                    try {
                        connection = DBHelper.connectTODatabase("jdbc:mysql://localhost:3306/final_v2", "root", "");
                        PerformanceDAO performanceDAO = new PerformanceDAO();
                        EmployeeDAO employeeDAO = new EmployeeDAO();
                        
                        List<PerformanceBean> performances = performanceDAO.getAllPerformances();
                        if (performances != null && !performances.isEmpty()) {
                            for (PerformanceBean performance : performances) {
                                EmployeeBean employee = employeeDAO.getEmployeeById(performance.getEmployeeId());
                                if (employee != null) {
                %>
                ['<%= employee.getEmployeeName() %>', <%= performance.getRating() %>],
                <% 
                                }
                            }
                        } else {
                %>
                ['No Data Available', 0],
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                ['Error Loading Data', 0],
                <% 
                    } finally {
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch (SQLException ignored) {}
                        }
                    }
                %>
            ]);

            // Chart options
            var options = {
                title: 'Employee Performance Ratings',
                hAxis: {title: 'Employee Name', titleTextStyle: {color: '#333'}},
                vAxis: {title: 'Rating', minValue: 0},
                chartArea: {width: '70%', height: '70%'},
                legend: {position: 'none'}
            };

            // Drawing the chart
            var chart = new google.visualization.ColumnChart(document.getElementById('performance_chart'));
            chart.draw(data, options);
        }
    </script>
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
                        <a class="nav-link active" href="performanceChart.jsp">Performance</a>
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
        <h1>Employee Performance Chart</h1>
        <div id="performance_chart" style="width: 100%; height: 500px;"></div>
        <a href="manageEmployee.jsp" class="btn btn-secondary">Back to Manage Employees</a>
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
