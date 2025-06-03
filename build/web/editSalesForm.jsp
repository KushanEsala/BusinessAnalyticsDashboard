<%@ page import="models.SalesBeans" %>
<%
    // Retrieve the 'sale' object from the request
    SalesBeans sale = (SalesBeans) request.getAttribute("sale");
    
    // Check if the sale object is null
    if (sale == null) {
        out.println("Error: Sale data is missing.");
    } else {
%>

<html>
<head>
    <title>Edit Sale</title>
</head>
<body>
    <h1>Edit Sale</h1>
    <form action="EditSalesServlet" method="post">
        <!-- Hidden input to store saleId -->
        <input type="hidden" name="saleId" value="<%= sale.getSaleId() %>" />

        <label for="productId">Product ID:</label>
        <input type="number" id="productId" name="productId" value="<%= sale.getProductId() %>" required><br>
        
        <label for="saleDate">Sale Date:</label>
        <input type="date" id="saleDate" name="saleDate" value="<%= sale.getSaleDate() %>" required><br>

        <label for="quantitySold">Quantity Sold:</label>
        <input type="number" id="quantitySold" name="quantitySold" value="<%= sale.getQuantity() %>" required><br>

        <label for="totalAmount">Total Amount:</label>
        <input type="number" step="0.01" id="totalAmount" name="totalAmount" value="<%= sale.getTotalPrice() %>" required><br>

        <input type="submit" value="Update Sale">
    </form>
</body>
</html>

<%
    }
%>
