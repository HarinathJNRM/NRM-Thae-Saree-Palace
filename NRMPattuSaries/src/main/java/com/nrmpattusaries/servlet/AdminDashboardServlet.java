package com.nrmpattusaries.servlet;


import java.io.IOException;


import java.util.List;
import com.nrmpattusaries.model.Order;
import com.nrmpattusaries.model.Saree;

import com.nrmpattusaries.dao.OrderDAO;
import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.dao.UserDAO;

import com.nrmpattusaries.daoimplementation.OrderDAOImpl;
import com.nrmpattusaries.daoimplementation.UserDAOImpl;

import com.nrmpattusaries.daoimplementation.SareeDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {

    private UserDAO userDAO;
    private SareeDAO sareeDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() {

        userDAO = new UserDAOImpl();

        sareeDAO = new SareeDAOImpl();

        orderDAO = new OrderDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int totalUsers =
                userDAO.getAllUsers().size();

        int totalSarees =
                sareeDAO.getAllSarees().size();

        int totalOrders =
                orderDAO.getAllOrders().size();

        double totalRevenue =
                orderDAO.getTotalRevenue();

        request.setAttribute(
                "totalUsers", totalUsers);

        request.setAttribute(
                "totalSarees", totalSarees);

        request.setAttribute(
                "totalOrders", totalOrders);

        request.setAttribute(
                "totalRevenue", totalRevenue);
        
        List<Order> recentOrders =
                orderDAO.getRecentOrders();

        request.setAttribute(
                "recentOrders",
                recentOrders);
        
        List<Saree> lowStockSarees =
                sareeDAO.getLowStockSarees();

        request.setAttribute(
                "lowStockSarees",
                lowStockSarees);
        
        double[] monthlyRevenue =
                orderDAO.getMonthlyRevenue();

        request.setAttribute(
                "monthlyRevenue",
                monthlyRevenue);


        request.getRequestDispatcher(
                "admin-dashboard.jsp")
                .forward(request, response);
    }
}
