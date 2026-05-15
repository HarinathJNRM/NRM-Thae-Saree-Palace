package com.nrmpattusaries.servlet;

import java.io.IOException;

import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteSaree")
public class DeleteSareeServlet extends HttpServlet {

    private SareeDAO sareeDAO;

    @Override
    public void init() {
        sareeDAO = new SareeDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id"));

            sareeDAO.deleteSaree(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("AdminSareeList");
    }
}