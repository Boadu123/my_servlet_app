package com.example.web.databaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/task";
    private static final String username = "root";
    private static final String password = "Abame123456";

    private DatabaseConnection(){}

    public static Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, username, password);
        }catch (ClassNotFoundException e){
            throw new SQLException("MySQL JDBC driver not found", e.getMessage());
        }
    }
}
