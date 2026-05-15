package com.nrmpattusaries.servlet;

import java.io.IOException;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteUser")
public class DeleteUserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id"));

        userDAO.deleteUser(id);

        response.sendRedirect(
                "manage-users");
    }
}
