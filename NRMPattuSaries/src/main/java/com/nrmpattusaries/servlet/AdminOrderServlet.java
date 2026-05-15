package com.nrmpattusaries.servlet;


import java.io.IOException;

import com.nrmpattusaries.dao.OrderDAO;
import com.nrmpattusaries.daoimplementation.OrderDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin-orders")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {

        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)

            throws ServletException, IOException {

        request.setAttribute(
                "orders",
                orderDAO.getAllOrders());

        request.getRequestDispatcher(
                "admin-orders.jsp")
                .forward(request, response);
    }
}
