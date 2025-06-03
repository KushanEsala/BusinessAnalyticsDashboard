<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="models.*" %>
<%@ page import="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page language="java" %>
<%@ page import="models.ProductDAO, models.ProductBean" %>
<%@ page session="true" %>
<%@ page import="java.sql.*" %> <!-- Import SQL classes for the transaction -->

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports</title>
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
        <h2>Generate Monthly Reports</h2>
        <form method="get" action="">
            <label for="year">Year:</label>
            <input type="number" name="year" id="year" required min="2000" max="2100" />
            <label for="month">Month:</label>
            <select name="month" id="month" required>
                <option value="">-- Select Month --</option>
                <% for (int i = 1; i <= 12; i++) { %>
                    <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <br><br>

            <label>Select Report Type:</label><br>
            <input type="radio" name="reportType" value="sales" required /> Sales<br>
            <input type="radio" name="reportType" value="employees" /> Employees<br>
            <input type="radio" name="reportType" value="products" /> Products<br>
            <input type="radio" name="reportType" value="performances" /> Performance<br>
            <br>
            <button type="submit" name="action" value="preview">Preview Report</button>
            <button type="submit" name="action" value="download">Download Report</button>
        </form>

        <%
            // Retrieve form data
            String selectedMonth = request.getParameter("month");
            String selectedYear = request.getParameter("year");
            String reportType = request.getParameter("reportType");
            String action = request.getParameter("action");

            if (selectedMonth != null && !selectedMonth.isEmpty() && 
                selectedYear != null && !selectedYear.isEmpty() && 
                reportType != null && !reportType.isEmpty()) {

                Connection conn = null;
                PreparedStatement ps = null;

                try {
                    int month = Integer.parseInt(selectedMonth);
                    int year = Integer.parseInt(selectedYear);

                    // Prepare DAOs
                    SalesDAO salesDAO = new SalesDAO();
                    EmployeeDAO employeeDAO = new EmployeeDAO();
                    ProductDAO productDAO = new ProductDAO();
                    PerformanceDAO performanceDAO = new PerformanceDAO();

                    // Set up PDF document
                    Document document = new Document();
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    PdfWriter writer = PdfWriter.getInstance(document, baos);
                    document.open();

                    // Add Title
                    document.add(new Paragraph(reportType.substring(0, 1).toUpperCase() + reportType.substring(1) + " Report for " + 
                                                new SimpleDateFormat("MMMM yyyy").format(new GregorianCalendar(year, month - 1, 1).getTime())));
                    document.add(Chunk.NEWLINE);

                    // Generate the selected report
                    switch (reportType) {
                        case "sales":
                            List<SalesBeans> salesRecords = salesDAO.getSalesByMonth(year, month);
                            PdfPTable salesTable = new PdfPTable(5); // Adjust columns as per SalesBean fields
                            salesTable.addCell("Sale ID");
                            salesTable.addCell("Product ID");
                            salesTable.addCell("Quantity");
                            salesTable.addCell("Total Price");
                            salesTable.addCell("Sale Date");

                            for (SalesBeans sale : salesRecords) {
                                salesTable.addCell(String.valueOf(sale.getSaleId()));
                                salesTable.addCell(String.valueOf(sale.getProductId()));
                                salesTable.addCell(String.valueOf(sale.getQuantity()));
                                salesTable.addCell(String.valueOf(sale.getTotalPrice()));
                                salesTable.addCell(sale.getSaleDate().toString());
                            }
                            document.add(salesTable);
                            break;

                        case "employees":
                            List<EmployeeBean> employees = employeeDAO.getAllEmployees();
                            PdfPTable employeeTable = new PdfPTable(4); // Adjust columns as per EmployeeBean fields
                            employeeTable.addCell("Employee ID");
                            employeeTable.addCell("Name");
                            employeeTable.addCell("Position");
                            employeeTable.addCell("Hire Date");

                            for (EmployeeBean employee : employees) {
                                employeeTable.addCell(String.valueOf(employee.getEmployeeId()));
                                employeeTable.addCell(employee.getEmployeeName());
                                employeeTable.addCell(employee.getPosition());
                                employeeTable.addCell(employee.getHireDate().toString());
                            }
                            document.add(employeeTable);
                            break;

                        case "products":
                            List<ProductBean> products = productDAO.getAllProducts();
                            PdfPTable productTable = new PdfPTable(4); // Adjust columns as per ProductBean fields
                            productTable.addCell("Product ID");
                            productTable.addCell("Name");
                            productTable.addCell("Category");
                            productTable.addCell("Stock Quantity");

                            for (ProductBean product : products) {
                                productTable.addCell(String.valueOf(product.getProductId()));
                                productTable.addCell(product.getProductName());
                                productTable.addCell(product.getCategory());
                                productTable.addCell(String.valueOf(product.getStockQuantity()));
                            }
                            document.add(productTable);
                            break;

                        case "performances":
                            List<PerformanceBean> performances = performanceDAO.getPerformancesByMonth(year, month);
                            PdfPTable performanceTable = new PdfPTable(4); // Adjust columns as per PerformanceBean fields
                            performanceTable.addCell("Performance ID");
                            performanceTable.addCell("Employee ID");
                            performanceTable.addCell("Rating");
                            performanceTable.addCell("Remarks");

                            for (PerformanceBean performance : performances) {
                                performanceTable.addCell(String.valueOf(performance.getPerformanceId()));
                                performanceTable.addCell(String.valueOf(performance.getEmployeeId()));
                                performanceTable.addCell(String.valueOf(performance.getRating()));
                                performanceTable.addCell(performance.getRemarks());
                            }
                            document.add(performanceTable);
                            break;

                        default:
                            document.add(new Paragraph("Invalid report type selected."));
                            break;
                    }

                    document.close();

                    // If 'Preview' is selected, display the report in the browser
                    if ("preview".equals(action)) {
                        out.println("<h3>Report Preview:</h3>");
                        out.println("<iframe src='data:application/pdf;base64," + Base64.getEncoder().encodeToString(baos.toByteArray()) + "' width='100%' height='600px'></iframe>");
                    }

                    // If 'Download' is selected, prompt the user to download the PDF file
                    if ("download".equals(action)) {
                        // Update the reports table within a transaction
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yourdatabase", "yourusername", "yourpassword");
                        String insertQuery = "INSERT INTO reports (report_type, generated_by) VALUES (?, ?)";
                        ps = conn.prepareStatement(insertQuery);
                        ps.setString(1, reportType);
                        ps.setString(2, "admin"); // Change to the current user's identifier if necessary
                        ps.executeUpdate();

                        // Set response headers for file download
                        response.setContentType("application/pdf");
                        response.setHeader("Content-Disposition", "attachment; filename=report.pdf");
                        response.getOutputStream().write(baos.toByteArray());
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (ps != null) {
                        try {
                            ps.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ABC Inventory System</p>
    </footer>

</body>
</html>
