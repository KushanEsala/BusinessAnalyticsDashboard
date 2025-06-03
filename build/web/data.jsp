<%@ page import="java.util.List" %>
<%@ page import="models.EmployeePerformanceBean" %>
<%@ page import="models.MonthlyRevenueBean" %>
<%@ page import="models.SalesSummaryBean" %>

<html>
<head>
    <title>View Data</title>
</head>
<body>
    <h2>Employee Performance Summary</h2>
    <table border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Position</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>Performance Date</th>
            <th>Rating</th>
            <th>Remarks</th>
        </tr>
        <% List<EmployeePerformanceBean> performanceSummary = (List<EmployeePerformanceBean>) request.getAttribute("performanceSummary");
           for (EmployeePerformanceBean bean : performanceSummary) { %>
            <tr>
                <td><%= bean.getEmployeeId() %></td>
                <td><%= bean.getEmployeeName() %></td>
                <td><%= bean.getPosition() %></td>
                <td><%= bean.getEmail() %></td>
                <td><%= bean.getPhoneNumber() %></td>
                <td><%= bean.getPerformanceDate() %></td>
                <td><%= bean.getRating() %></td>
                <td><%= bean.getRemarks() %></td>
            </tr>
        <% } %>
    </table>

    <h2>Monthly Revenue Summary</h2>
    <table border="1">
        <tr>
            <th>Year</th>
            <th>Month</th>
            <th>Total Revenue</th>
        </tr>
        <% List<MonthlyRevenueBean> revenueSummary = (List<MonthlyRevenueBean>) request.getAttribute("monthlyRevenueSummary");
           for (MonthlyRevenueBean bean : revenueSummary) { %>
            <tr>
                <td><%= bean.getYear() %></td>
                <td><%= bean.getMonth() %></td>
                <td><%= bean.getTotalRevenue() %></td>
            </tr>
        <% } %>
    </table>

    <h2>Sales Summary</h2>
    <table border="1">
        <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>Total Quantity Sold</th>
            <th>Total Sales</th>
        </tr>
        <% List<SalesSummaryBean> salesSummary = (List<SalesSummaryBean>) request.getAttribute("salesSummary");
           for (SalesSummaryBean bean : salesSummary) { %>
            <tr>
                <td><%= bean.getProductId() %></td>
                <td><%= bean.getProductName() %></td>
                <td><%= bean.getCategory() %></td>
                <td><%= bean.getTotalQuantitySold() %></td>
                <td><%= bean.getTotalSales() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
