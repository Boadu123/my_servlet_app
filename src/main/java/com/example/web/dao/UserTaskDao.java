package com.example.web.dao;

import com.example.web.database.UserTask;
import com.example.web.databaseConnection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserTaskDao {
    private Connection connection;

    public UserTaskDao() throws SQLException {
        this.connection = DatabaseConnection.getConnection();
    }


    public void addUserTask(UserTask userTask) throws SQLException {
        String query = "INSERT INTO usertask(title, description, due_date, user_id, status) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, userTask.getTitle());
            preparedStatement.setString(2, userTask.getDescription());
            preparedStatement.setDate(3, new Date(userTask.getDue_date().getTime()));
            preparedStatement.setInt(4, userTask.getUser_id());
            preparedStatement.setString(5, userTask.getStatus());
            preparedStatement.executeUpdate();
        }
    }

    public List<UserTask> getAllUserTasks() throws SQLException {
        String query = "SELECT * FROM usertask";
        List<UserTask> tasks = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                UserTask task = new UserTask(
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getDate("due_date"),
                        resultSet.getInt("user_id"),
                        resultSet.getString("status")
                );
                task.setId(resultSet.getInt("id"));
                tasks.add(task);
            }
        }

        return tasks;
    }

    public UserTask getUserTaskById(int id) throws SQLException {
        String query = "SELECT * FROM usertask WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            UserTask task = new UserTask(
                    resultSet.getString("title"),
                    resultSet.getString("description"),
                    resultSet.getDate("due_date"),
                    resultSet.getInt("user_id"),
                    resultSet.getString("status")
            );
            task.setId(resultSet.getInt("id"));
            return task;
        } else {
            return null;
        }
    }

    // Update
    public void updateUserTask(UserTask userTask) throws SQLException {
        String query = "UPDATE usertask SET title = ?, description = ?, due_date = ?, user_id = ?, status = ? WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, userTask.getTitle());
            preparedStatement.setString(2, userTask.getDescription());
            preparedStatement.setDate(3, new Date(userTask.getDue_date().getTime()));
            preparedStatement.setInt(4, userTask.getUser_id());
            preparedStatement.setString(5, userTask.getStatus());
            preparedStatement.setInt(6, userTask.getId());
            preparedStatement.executeUpdate();
        }
    }

    // Delete
    public void deleteUserTask(int id) throws SQLException {
        String query = "DELETE FROM usertask WHERE id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }
}
