package com.nrmpattusaries.dao;

import java.util.List;
import com.nrmpattusaries.model.Order;
import com.nrmpattusaries.model.OrderItem;

public interface OrderDAO {

    int createOrder(Order order);

    boolean addOrderItems(List<OrderItem> items);

    List<Order> getOrdersByUser(int userId);
    
    double getTotalRevenue();

    List<Order> getAllOrders();
    
    List<Order> getRecentOrders();
    
    boolean updateOrderStatus(int orderId, String status);
    
    double[] getMonthlyRevenue();
}