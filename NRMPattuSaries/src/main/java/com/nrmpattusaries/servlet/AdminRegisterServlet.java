package com.nrmpattusaries.servlet;


import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin-register")
public class AdminRegisterServlet
        extends HttpServlet {

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
                "admin-register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)

            throws ServletException, IOException {

        User user = new User();

        user.setName(
                request.getParameter("name"));

        user.setEmail(
                request.getParameter("email"));

        String password =
                request.getParameter("password");

        // HASH PASSWORD
        String hashed =
                BCrypt.hashpw(password,
                              BCrypt.gensalt());

        user.setPassword(hashed);

        user.setPhone(
                request.getParameter("phone"));

        user.setAddress(
                request.getParameter("address"));

        // ADMIN ROLE
        user.setRole("ADMIN");

        boolean status =
                userDAO.registerUser(user);

        if(status){

            response.sendRedirect(
                    "admin-login");
        }

        else{

            request.setAttribute(
                    "error",
                    "Registration failed");

            request.getRequestDispatcher(
                    "admin-register.jsp")
                    .forward(request, response);
        }
    }
}
