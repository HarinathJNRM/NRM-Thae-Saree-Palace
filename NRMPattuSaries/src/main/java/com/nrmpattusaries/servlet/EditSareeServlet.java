package com.nrmpattusaries.servlet;

import java.io.IOException;

import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;
import com.nrmpattusaries.model.Saree;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditSaree")
public class EditSareeServlet extends HttpServlet {

    private SareeDAO sareeDAO;

    @Override
    public void init() {
        sareeDAO = new SareeDAOImpl();
    }

    // LOAD EDIT PAGE
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id"));

        Saree saree = sareeDAO.getSareeById(id);

        request.setAttribute("saree", saree);

        request.getRequestDispatcher("edit-saree.jsp")
               .forward(request, response);
    }

    // UPDATE SAREE
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        Saree saree = new Saree();

        saree.setSareeId(
                Integer.parseInt(
                        request.getParameter("sareeId")));

        saree.setName(request.getParameter("name"));

        saree.setDescription(
                request.getParameter("description"));

        saree.setPrice(
                Double.parseDouble(
                        request.getParameter("price")));

        saree.setStock(
                Integer.parseInt(
                        request.getParameter("stock")));

        saree.setImage(
                request.getParameter("image"));

        String catId =
                request.getParameter("categoryId");

        if (catId != null && !catId.isEmpty()) {

            saree.setCategoryId(
                    Integer.parseInt(catId));
        }

        sareeDAO.updateSaree(saree);

        response.sendRedirect("AdminSareeList");
    }
}