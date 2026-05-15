package com.nrmpattusaries.servlet;


import java.io.IOException;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

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
                "login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // ADMIN
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {

                response.sendRedirect("admin-dashboard");

            }

            // CUSTOMER
            else {

                response.sendRedirect("sareelist");

            }

        } else {

            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);

        }
    }
}
