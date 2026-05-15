/*
package com.nrmpattusaries.servlet;


import java.io.IOException;
import java.util.regex.Pattern;
import org.mindrot.jbcrypt.BCrypt;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;
import com.nrmpattusaries.model.User;

//@WebServlet("/user")
@WebServlet(urlPatterns = {"/login", "/register"})
public class UserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAOImpl();
    }

    // 🔁 Handles both GET & POST routing
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            logoutUser(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {

            case "register":
                registerUser(request, response);
                break;

            case "login":
                loginUser(request, response);
                break;

            default:
                response.sendRedirect("login.jsp");
        }
    }

    
    // 📝 REGISTER
    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // 🔍 Server-side validation
        String nameRegex = "^[A-Za-z_]{3,}$";
        String phoneRegex = "^[6-9]\\d{9}$";
        String emailRegex = "^[a-zA-Z0-9._%+-]+@gmail\\.com$";
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{4,}$";

        if (name == null || !Pattern.matches(nameRegex, name)) {
            sendError("Invalid name (only letters, _, min 3 chars)", request, response, "register.jsp");
            return;
        }

        if (email == null || !Pattern.matches(emailRegex, email)) {
            sendError("Only valid Gmail allowed", request, response, "register.jsp");
            return;
        }

        if (password == null || !Pattern.matches(passwordRegex, password)) {
            sendError("Weak password (must include uppercase, number, special char)", request, response, "register.jsp");
            return;
        }

        if (phone == null || !Pattern.matches(phoneRegex, phone)) {
            sendError("Valid Indian phone number is required", request, response, "register.jsp");
            return;
        }
        
        if (address == null || address.trim().isEmpty()) {
            address = "N/A"; // default value
        }
        
        // 🔐 Hash password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Create User object
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole("CUSTOMER");

        if (userDAO.registerUser(user)) {
            response.sendRedirect("login.jsp");
            System.out.println("Register method called");
        } else {
            sendError("Registration failed", request, response, "register.jsp");
        }
    }

    
    // 🔐 LOGIN
    private void loginUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {

                response.sendRedirect("saree?action=list");

            } else {

                response.sendRedirect("saree?action=user");

            }

        } else {

            sendError("Invalid credentials", request, response, "login.jsp");
        }
    }
    
    // 🔐 LOGOUT
    private void logoutUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false); // don't create new session

        if (session != null) {
            session.invalidate(); // destroy session
        }

        response.sendRedirect("login.jsp");
    }
    

    // ⚠️ COMMON ERROR HANDLER
    private void sendError(String msg, HttpServletRequest request,
                           HttpServletResponse response, String page)
            throws ServletException, IOException {

        request.setAttribute("error", msg);
        request.getRequestDispatcher(page).forward(request, response);
    }
}
*/