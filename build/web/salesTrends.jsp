<%@ page import="java.util.List, models.SalesTrend, models.SalesReportDAO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Monthly Sales Trends Report</h2>
        <hr>
        
        <%
            // Fetching the sales trends data from the database
            SalesReportDAO reportDAO = new SalesReportDAO();
            List<SalesTrend> trends = reportDAO.getMonthlySalesTrend();
        %>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Year</th>
                    <th>Month</th>
                    <th>Total Sales (USD)</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Loop through the list and display each record
                    for (SalesTrend trend : trends) {
                %>
                    <tr>
                        <td><%= trend.getYear() %></td>
                        <td><%= trend.getMonth() %></td>
                        <td><%= trend.getTotalSales() %></td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>

        <a href="exportSalesReport.jsp" class="btn btn-primary mt-3">Export to Excel</a>
        <a href="exportSalesReportPDF.jsp" class="btn btn-danger mt-3">Export to PDF</a>
    </div>
           

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
