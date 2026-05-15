package com.nrmpattusaries.servlet;

import java.io.IOException;

import com.nrmpattusaries.dao.CategoryDAO;
import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.CategoryDAOImpl;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminSareeList")
public class AdminSareeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SareeDAO sareeDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {

        sareeDAO = new SareeDAOImpl();
        categoryDAO = new CategoryDAOImpl();
    }

    // =========================
    // GET -> LIST + SEARCH
    // =========================
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String catId = request.getParameter("categoryId");

        Integer categoryId = null;

        // Convert category id
        if (catId != null && !catId.isEmpty()) {
            categoryId = Integer.parseInt(catId);
        }

        // Search / Filter
        if ((keyword != null && !keyword.isEmpty())
                || categoryId != null) {

            request.setAttribute(
                    "sarees",
                    sareeDAO.searchSarees(keyword, categoryId)
            );

        }

        // Show all sarees
        else {

            request.setAttribute(
                    "sarees",
                    sareeDAO.getAllSarees()
            );
        }

        // Categories for dropdown
        request.setAttribute(
                "categories",
                categoryDAO.getAllCategories()
        );

        // Forward to admin JSP
        request.getRequestDispatcher("saree-list.jsp")
               .forward(request, response);
    }

    // =========================
    // POST -> ADD SAREE
    // =========================
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        try {

            String name = request.getParameter("name");
            String description = request.getParameter("description");

            double price = Double.parseDouble(
                    request.getParameter("price"));

            int stock = Integer.parseInt(
                    request.getParameter("stock"));

            String image = request.getParameter("image");

            String catId = request.getParameter("categoryId");

            Integer categoryId = null;

            if (catId != null && !catId.isEmpty()) {
                categoryId = Integer.parseInt(catId);
            }

            // Create saree object
            com.nrmpattusaries.model.Saree saree =
                    new com.nrmpattusaries.model.Saree();

            saree.setName(name);
            saree.setDescription(description);
            saree.setPrice(price);
            saree.setStock(stock);
            saree.setImage(image);
            saree.setCategoryId(categoryId);

            // Save to DB
            sareeDAO.addSaree(saree);

            // Redirect back to admin list
            response.sendRedirect("AdminSareeList");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("AdminSareeList");
        }
    }
}