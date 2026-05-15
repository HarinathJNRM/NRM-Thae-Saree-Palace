package com.nrmpattusaries.servlet;


import java.io.IOException;
import java.util.List;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/manage-users")
public class UserManagementServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("keyword");

        List<User> users;

        // SEARCH
        if(keyword != null &&
           !keyword.trim().isEmpty()) {

            users =
            userDAO.searchUsers(keyword);

        }

        // ALL USERS
        else {

            users =
            userDAO.getAllUsers();
        }

        request.setAttribute(
                "users",
                users);

        request.getRequestDispatcher(
                "manage-users.jsp")
                .forward(request, response);
    }
}