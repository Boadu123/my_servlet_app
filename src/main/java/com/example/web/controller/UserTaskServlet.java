package com.example.web.controller;

import com.example.web.dao.UserTaskDao;
import com.example.web.database.UserTask;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/tasks")
public class UserTaskServlet extends HttpServlet {
    private UserTaskDao userTaskDao;

    @Override
    public void init() throws ServletException {
        try {
            userTaskDao = new UserTaskDao();
        } catch (SQLException e) {
            throw new ServletException("DB connection failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("new".equals(action)) {
            req.setAttribute("action", "create");
            req.getRequestDispatcher("/WEB-INF/views/task-form.jsp").forward(req, resp);
        }

        if (action == null) action = "list";

        try {
            switch (action) {
                case "edit":
                    showEditForm(req, resp);
                    break;
                case "delete":
                    deleteTask(req, resp);
                    break;
                default:
                    listTasks(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listTasks(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        List<UserTask> tasks = userTaskDao.getAllUserTasks();
        req.setAttribute("tasks", tasks);
        req.getRequestDispatcher("/WEB-INF/views/tasks.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserTask task = userTaskDao.getUserTaskById(id);
        req.setAttribute("task", task);
        req.getRequestDispatcher("/WEB-INF/views/editTask.jsp").forward(req, resp);
    }

    private void deleteTask(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        userTaskDao.deleteUserTask(id);
        resp.sendRedirect("tasks");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "create";

        try {
            switch (action) {
                case "create":
                    createTask(req, resp);
                    break;
                case "update":
                    updateTask(req, resp);
                    break;
                case "delete":
                    deleteTask(req, resp);
                    break;
                default:
                    resp.sendRedirect("tasks");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void createTask(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String dueDateStr = req.getParameter("due_date");
        int userId = Integer.parseInt(req.getParameter("user_id"));
        String status = req.getParameter("status");

        Date dueDate = new SimpleDateFormat("yyyy-MM-dd").parse(dueDateStr);
        UserTask task = new UserTask(title, description, dueDate, userId, status);
        userTaskDao.addUserTask(task);
        resp.sendRedirect("tasks");
    }

    private void updateTask(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String dueDateStr = req.getParameter("due_date");
        int userId = Integer.parseInt(req.getParameter("user_id"));
        String status = req.getParameter("status");

        Date dueDate = new SimpleDateFormat("yyyy-MM-dd").parse(dueDateStr);
        UserTask task = new UserTask(title, description, dueDate, userId, status);
        task.setId(id);
        userTaskDao.updateUserTask(task);
        resp.sendRedirect("tasks");
    }
}
