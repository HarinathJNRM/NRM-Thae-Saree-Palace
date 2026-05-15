package com.nrmpattusaries.servlet;


import java.io.IOException;
import java.util.regex.Pattern;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

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
                "register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        String nameRegex = "^[A-Za-z_]{3,}$";
        String phoneRegex = "^[6-9]\\d{9}$";
        String emailRegex = "^[a-zA-Z0-9._%+-]+@gmail\\.com$";
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{4,}$";

        if (!Pattern.matches(nameRegex, name)) {
            request.setAttribute("error", "Invalid name");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!Pattern.matches(emailRegex, email)) {
            request.setAttribute("error", "Invalid Gmail");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!Pattern.matches(passwordRegex, password)) {
            request.setAttribute("error", "Weak password");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!Pattern.matches(phoneRegex, phone)) {
            request.setAttribute("error", "Invalid phone");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        User user = new User();

        user.setName(name);
        user.setEmail(email);

        // HASH PASSWORD
        String hashedPassword =
                BCrypt.hashpw(password, BCrypt.gensalt());

        user.setPassword(hashedPassword);

        user.setPhone(phone);
        user.setAddress(address);
        user.setRole("CUSTOMER");

        if (userDAO.registerUser(user)) {

            response.sendRedirect("login.jsp");

        } else {

            request.setAttribute("error", "Registration failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);

        }
    }
}
