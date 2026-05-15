package com.nrmpattusaries.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;
import com.nrmpattusaries.model.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private SareeDAO sareeDAO;

    public void init() {
        sareeDAO = new SareeDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("view".equals(action)) {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        int sareeId = Integer.parseInt(request.getParameter("id"));

        // ➕ ADD ITEM
        if ("add".equals(action)) {

            Saree saree = sareeDAO.getSareeById(sareeId);

            boolean found = false;

            for (CartItem item : cart) {
                if (item.getSaree().getSareeId() == sareeId) {
                    item.setQuantity(item.getQuantity() + 1);
                    found = true;
                    break;
                }
            }

            if (!found) {
                cart.add(new CartItem(saree, 1));
            }
        }

        // ➕➖ UPDATE QUANTITY
        else if ("update".equals(action)) {

            String type = request.getParameter("type");

            for (CartItem item : cart) {

                if (item.getSaree().getSareeId() == sareeId) {

                    if ("increase".equals(type)) {
                        item.setQuantity(item.getQuantity() + 1);
                    }

                    else if ("decrease".equals(type)) {
                        if (item.getQuantity() > 1) {
                            item.setQuantity(item.getQuantity() - 1);
                        }
                    }

                    break;
                }
            }
        }

        // ❌ REMOVE ITEM
        else if ("remove".equals(action)) {

            cart.removeIf(item -> item.getSaree().getSareeId() == sareeId);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart?action=view");
    }
}