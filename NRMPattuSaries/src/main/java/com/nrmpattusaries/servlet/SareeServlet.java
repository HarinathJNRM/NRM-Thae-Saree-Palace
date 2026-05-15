/*
package com.nrmpattusaries.servlet;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.nrmpattusaries.dao.CategoryDAO;
import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.daoimplementation.SareeDAOImpl;
import com.nrmpattusaries.daoimplementation.CategoryDAOImpl;
import com.nrmpattusaries.model.Saree;
import com.nrmpattusaries.model.Category;


//@WebServlet("/saree")
@WebServlet(urlPatterns = {
	    "/sareelist",
	    "/sareeview",
	    "/AdminSareeList",
	    "/addSaree",
	    "/AdminViewSaree"
	})
public class SareeServlet extends HttpServlet {

    private SareeDAO sareeDAO;
    private CategoryDAO categoryDAO;

    @Override
    public void init() {
        sareeDAO = new SareeDAOImpl();
        categoryDAO = new CategoryDAOImpl();
    }

    // 🔍 GET → View / Delete
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

	        case "list":
	
	            String keyword = request.getParameter("keyword");
	            String catId = request.getParameter("categoryId");
	
	            Integer categoryId = null;
	
	            if (catId != null && !catId.isEmpty()) {
	                categoryId = Integer.parseInt(catId);
	            }
	
	            if ((keyword != null && !keyword.isEmpty()) || categoryId != null) {
	                request.setAttribute("sarees",
	                        sareeDAO.searchSarees(keyword, categoryId));
	            } else {
	                request.setAttribute("sarees", sareeDAO.getAllSarees());
	            }
	
	            request.setAttribute("categories", categoryDAO.getAllCategories());
	
	            request.getRequestDispatcher("saree-list.jsp").forward(request, response);
	            break;

            case "view":
                viewSaree(request, response);
                break;

            case "delete":
                deleteSaree(request, response);
                break;
                
            case "user":

                String userKeyword = request.getParameter("keyword");
                String userCatId = request.getParameter("categoryId");

                Integer userCategoryId = null;

                if (userCatId != null && !userCatId.isEmpty()) {
                    categoryId = Integer.parseInt(userCatId);
                }

                if ((userKeyword != null && !userKeyword.isEmpty()) || userCategoryId != null) {
                    request.setAttribute("sarees",
                            sareeDAO.searchSarees(userKeyword, userCategoryId));
                } else {
                    request.setAttribute("sarees", sareeDAO.getAllSarees());
                }

                request.setAttribute("categories", categoryDAO.getAllCategories());

                request.getRequestDispatcher("user-saree-list.jsp").forward(request, response);
                break;

            default:
                listSarees(request, response);
        }
    }

    // ➕ POST → Add / Update
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addSaree(request, response);
        } else if ("update".equals(action)) {
            updateSaree(request, response);
        }
    }

    // 📋 LIST ALL
    private void listSarees(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("sarees", sareeDAO.getAllSarees());
        request.getRequestDispatcher("saree-list.jsp").forward(request, response);
    }

    // 🔍 VIEW SINGLE
    private void viewSaree(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Saree saree = sareeDAO.getSareeById(id);

        request.setAttribute("saree", saree);
        request.getRequestDispatcher("view-saree.jsp").forward(request, response);
    }

    // ❌ DELETE
    private void deleteSaree(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        sareeDAO.deleteSaree(id);

        response.sendRedirect("saree?action=list");
    }

    // ➕ ADD
    private void addSaree(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Saree s = new Saree();

        s.setName(request.getParameter("name"));
        s.setDescription(request.getParameter("description"));
        s.setPrice(Double.parseDouble(request.getParameter("price")));
        s.setStock(Integer.parseInt(request.getParameter("stock")));
        s.setImage(request.getParameter("image"));

        String catId = request.getParameter("categoryId");
        if (catId != null && !catId.isEmpty()) {
            s.setCategoryId(Integer.parseInt(catId));
        }

        sareeDAO.addSaree(s);

        response.sendRedirect("saree?action=list");
    }

    // ✏️ UPDATE
    private void updateSaree(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Saree s = new Saree();

        s.setSareeId(Integer.parseInt(request.getParameter("id")));
        s.setName(request.getParameter("name"));
        s.setDescription(request.getParameter("description"));
        s.setPrice(Double.parseDouble(request.getParameter("price")));
        s.setStock(Integer.parseInt(request.getParameter("stock")));
        s.setImage(request.getParameter("image"));

        String catId = request.getParameter("categoryId");
        if (catId != null && !catId.isEmpty()) {
            s.setCategoryId(Integer.parseInt(catId));
        }

        sareeDAO.updateSaree(s);

        response.sendRedirect("saree?action=list");
    }
}

*/