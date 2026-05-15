package com.nrmpattusaries.servlet;


import java.io.IOException;

import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;
import com.nrmpattusaries.model.Saree;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/sareeview")
public class SareeViewServlet extends HttpServlet {

    private SareeDAO sareeDAO;

    @Override
    public void init() {
        sareeDAO = new SareeDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Saree saree = sareeDAO.getSareeById(id);

        request.setAttribute("saree", saree);

        request.getRequestDispatcher("view-saree.jsp")
               .forward(request, response);
    }
}