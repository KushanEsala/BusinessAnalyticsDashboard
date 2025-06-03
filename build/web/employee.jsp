<%@page import="java.util.List"%>
<%@ page import="models.EmployeeDAO, models.EmployeeBean" %>
<%
    // Fetch all employees data
    EmployeeDAO employeeDAO = new EmployeeDAO();
    List<EmployeeBean> employees = employeeDAO.getAllEmployees();
%>

<html>
<head>
    <title>Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h1>Employee List</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Employee Name</th>
                    <th>Position</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (EmployeeBean employee : employees) {
                %>
                <tr>
                    <td><%= employee.getEmployeeId() %></td>
                    <td><%= employee.getEmployeeName() %></td>
                    <td><%= employee.getPosition() %></td>
                    <td><%= employee.getSalary() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="userDashboard.jsp">Back</a>
    </div>
</body>
</html>
