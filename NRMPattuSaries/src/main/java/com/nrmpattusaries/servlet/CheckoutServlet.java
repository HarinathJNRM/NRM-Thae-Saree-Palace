package com.nrmpattusaries.servlet;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

import com.nrmpattusaries.dao.*;
import com.nrmpattusaries.daoimplementation.*;
import com.nrmpattusaries.model.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO;

    public void init() {
        orderDAO = new OrderDAOImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart?action=view");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserId();

        double total = 0;

        for (CartItem item : cart) {
            total += item.getQuantity() * item.getSaree().getPrice();
        }

        Order order = new Order();
        order.setUserId(userId);
        order.setTotalAmount(total);
        order.setStatus("PLACED");

        int orderId = orderDAO.createOrder(order);

        List<OrderItem> items = new ArrayList<>();

        for (CartItem c : cart) {

            OrderItem oi = new OrderItem();
            oi.setOrderId(orderId);
            oi.setSareeId(c.getSaree().getSareeId());
            oi.setQuantity(c.getQuantity());
            oi.setPrice(c.getSaree().getPrice());

            items.add(oi);
        }

        orderDAO.addOrderItems(items);

        // clear cart
        session.removeAttribute("cart");

        response.sendRedirect("order-success.jsp");
    }
}