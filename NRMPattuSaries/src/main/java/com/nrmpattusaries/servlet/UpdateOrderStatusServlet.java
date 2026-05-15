package com.nrmpattusaries.servlet;


import java.io.IOException;

import com.nrmpattusaries.dao.OrderDAO;
import com.nrmpattusaries.daoimplementation.OrderDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatusServlet
        extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {

        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        int orderId = Integer.parseInt(
                request.getParameter("orderId"));

        String status =
                request.getParameter("status");

        orderDAO.updateOrderStatus(
                orderId,
                status);

        response.sendRedirect(
                "admin-dashboard");
    }
}