package controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Logincontroller")
public class Logincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String dbUrl = "jdbc:mysql://localhost:3306/final_v2";
        String dbUser = "root"; // Replace with your DB username
        String dbPass = ""; // Replace with your DB password

        try (Connection connection = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            String query = "SELECT role FROM users WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String role = resultSet.getString("role");

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Redirect based on role
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("home.jsp");
                } else if ("user".equalsIgnoreCase(role)) {
                    response.sendRedirect("userDashboard.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid username or password!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error!", e);
        }
    }
}
