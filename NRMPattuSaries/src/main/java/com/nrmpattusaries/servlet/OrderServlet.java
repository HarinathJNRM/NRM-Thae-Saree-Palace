package com.nrmpattusaries.servlet;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import com.nrmpattusaries.dao.OrderDAO;
import com.nrmpattusaries.daoimplementation.OrderDAOImpl;
import com.nrmpattusaries.model.Order;
import com.nrmpattusaries.model.User;

@WebServlet("/orders")
public class OrderServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();

        List<Order> orders = orderDAO.getOrdersByUser(userId);

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("order-history.jsp")
               .forward(request, response);
    }
}