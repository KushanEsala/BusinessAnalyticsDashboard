<%@page import="java.util.List"%>
<%@ page import="models.PerformanceDAO, models.PerformanceBean" %>
<%
    // Fetch all performance data
    PerformanceDAO performanceDAO = new PerformanceDAO();
    List<PerformanceBean> performances = performanceDAO.getAllPerformances();
%>

<html>
<head>
    <title>Performance List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Performance List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Performance ID</th>
                    <th>Employee ID</th>
                    <th>Performance Date</th>
                    <th>Rating</th>
                    <th>Remarks</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (PerformanceBean performance : performances) {
                %>
                <tr>
                    <td><%= performance.getPerformanceId() %></td>
                    <td><%= performance.getEmployeeId() %></td>
                    <td><%= performance.getPerformanceDate() %></td>
                    <td><%= performance.getRating() %></td>
                    <td><%= performance.getRemarks() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="userDashboard.jsp">Back</a>
    </div>
</body>
</html>
