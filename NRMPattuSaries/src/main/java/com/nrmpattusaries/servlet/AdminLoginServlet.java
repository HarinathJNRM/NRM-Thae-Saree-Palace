package com.nrmpattusaries.servlet;


import java.io.IOException;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)

            throws ServletException, IOException {

        request.getRequestDispatcher(
                "admin-login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        User user =
                userDAO.loginUser(email, password);

        // ADMIN VALIDATION
        if(user != null &&
           "ADMIN".equals(user.getRole())) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "user",
                    user);

            response.sendRedirect(
                    "admin-dashboard");
        }

        else {

            request.setAttribute(
                    "error",
                    "Invalid admin credentials");

            request.getRequestDispatcher(
                    "admin-login.jsp")
                    .forward(request, response);
        }
    }
}
