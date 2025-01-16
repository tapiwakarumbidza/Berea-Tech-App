package com.berea.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {

    private static final String URL = "jdbc:mysql://localhost:3306/berea_portal";
    private static final String USER = "root"; // Your database username
    private static final String PASSWORD = ""; // Your database password

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure you have the correct driver class
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("JDBC Driver not found");
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
