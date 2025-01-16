package com.berea.controller;

import com.berea.util.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Server-side validation
        String errorMessage = "";

        if (!password.equals(confirmPassword)) {
            errorMessage += "Passwords do not match.\n";
        }

        if (password.length() < 6) {
            errorMessage += "Password is too short. It must be at least 6 characters long.\n";
        }

        int strength = 0;
        if (password.matches(".*[a-z].*")) strength++;
        if (password.matches(".*[A-Z].*")) strength++;
        if (password.matches(".*[0-9].*")) strength++;
        if (password.matches(".*[\\W_].*")) strength++;

        if (strength < 2) {
            errorMessage += "Password is weak. It should contain at least two of the following: lowercase letters, uppercase letters, numbers, special characters.\n";
        }

        if (!isValidEmail(email)) {
            errorMessage += "Invalid email format.\n";
        }

        if (!errorMessage.isEmpty()) {
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseUtil.getConnection()) {
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            String query = "INSERT INTO students (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, email);
                stmt.setString(4, hashedPassword);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("login.jsp");
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";
        return Pattern.compile(emailRegex).matcher(email).matches();
    }
}
