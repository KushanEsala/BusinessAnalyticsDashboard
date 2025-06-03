package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupController") // Ensure the mapping is correct
public class SingupController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email =request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
                // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/final_v2";
        String dbUser  = "root"; 
        String dbPassword = ""; 

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Load the JDBC driver (optional for newer versions)
            Class.forName("com.mysql.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcUrl, dbUser , dbPassword);

            // Create SQL insert statement
            String sql = "INSERT INTO users ( username, password, email) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);

            // Execute the insert operation
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message","Hello " + username + " Now you can log in to system" );
                request.getRequestDispatcher("login.jsp").forward(request, response);
                
                
              
            } else {
                out.println("User  registration failed.");
            }
        } catch (ClassNotFoundException e) {
            out.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            out.println("Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}

        
    
