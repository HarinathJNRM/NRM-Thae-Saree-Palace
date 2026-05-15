package com.nrmpattusaries.daoimplementation;


import java.sql.*;
import java.util.*;

import com.nrmpattusaries.dao.OrderDAO;
import com.nrmpattusaries.model.*;
import com.nrmpattusaries.utill.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int createOrder(Order order) {

        int orderId = 0;

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO orders(user_id, total_amount, status) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, "PLACED");

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public boolean addOrderItems(List<OrderItem> items) {

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO order_items(order_id, saree_id, quantity, price) VALUES(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            for (OrderItem item : items) {
                ps.setInt(1, item.getOrderId());
                ps.setInt(2, item.getSareeId());
                ps.setInt(3, item.getQuantity());
                ps.setDouble(4, item.getPrice());
                ps.addBatch();
            }

            ps.executeBatch();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM orders WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();

                o.setOrderId(rs.getInt("order_id"));
                o.setUserId(rs.getInt("user_id"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setOrderDate(rs.getTimestamp("order_date"));

                list.add(o);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    
    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM orders";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(
                        rs.getInt("order_id"));

                order.setUserId(
                        rs.getInt("user_id"));

                order.setTotalAmount(
                        rs.getDouble("total_amount"));

                order.setStatus(
                        rs.getString("status"));

                order.setOrderDate(
                        rs.getTimestamp("order_date"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
    
    
    @Override
    public double getTotalRevenue() {

        double revenue = 0;

        try (Connection con = DBConnection.getConnection()) {

            String query =
                    "SELECT SUM(total_amount) AS total FROM orders";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                revenue = rs.getDouble("total");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return revenue;
    }
    
    @Override
    public List<Order> getRecentOrders() {

        List<Order> orders = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query =
                "SELECT * FROM orders ORDER BY order_date DESC LIMIT 5";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(
                        rs.getInt("order_id"));

                order.setUserId(
                        rs.getInt("user_id"));

                order.setTotalAmount(
                        rs.getDouble("total_amount"));

                order.setStatus(
                        rs.getString("status"));

                order.setOrderDate(
                        rs.getTimestamp("order_date"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
    
    
    @Override
    public boolean updateOrderStatus(int orderId,
                                     String status) {

        boolean updated = false;

        try (Connection con = DBConnection.getConnection()) {

            String query =
                "UPDATE orders SET status=? WHERE order_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, status);

            ps.setInt(2, orderId);

            updated = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return updated;
    }
    
    
    @Override
    public double[] getMonthlyRevenue() {

        double[] revenue = new double[12];

        try (Connection con = DBConnection.getConnection()) {

            String query =

            "SELECT MONTH(order_date) AS month, " +
            "SUM(total_amount) AS total " +
            "FROM orders " +
            "GROUP BY MONTH(order_date)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int month =
                        rs.getInt("month");

                double total =
                        rs.getDouble("total");

                revenue[month - 1] = total;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return revenue;
    }
}
