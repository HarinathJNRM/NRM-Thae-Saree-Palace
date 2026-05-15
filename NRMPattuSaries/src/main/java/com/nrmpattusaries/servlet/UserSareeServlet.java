package com.nrmpattusaries.servlet;


import java.io.IOException;

import java.util.List;

import com.nrmpattusaries.dao.CategoryDAO;
import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.CategoryDAOImpl;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;
import com.nrmpattusaries.model.Category;
import com.nrmpattusaries.model.Saree;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/sareelist")
public class UserSareeServlet extends HttpServlet {

    private SareeDAO sareeDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {

        sareeDAO = new SareeDAOImpl();
        categoryDAO = new CategoryDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String catId = request.getParameter("categoryId");

        Integer categoryId = null;

        if (catId != null && !catId.isEmpty()) {
            categoryId = Integer.parseInt(catId);
        }

        List<Saree> sarees;

        if ((keyword != null && !keyword.isEmpty()) || categoryId != null) {

            sarees = sareeDAO.searchSarees(keyword, categoryId);

        } else {

            sarees = sareeDAO.getAllSarees();
        }

        List<Category> categories = categoryDAO.getAllCategories();

        request.setAttribute("sarees", sarees);
        request.setAttribute("categories", categories);

        request.getRequestDispatcher("user-saree-list.jsp")
               .forward(request, response);
    }
}