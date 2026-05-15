package com.nrmpattusaries.daoimplementation;


import java.sql.*;
import java.util.*;

import com.nrmpattusaries.dao.CategoryDAO;
import com.nrmpattusaries.model.Category;
import com.nrmpattusaries.utill.DBConnection;


public class CategoryDAOImpl implements CategoryDAO {
	
	//@Override
    public List<Category> getAllCategories() {

        List<Category> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM categories";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setCategoryName(rs.getString("category_name"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


}
