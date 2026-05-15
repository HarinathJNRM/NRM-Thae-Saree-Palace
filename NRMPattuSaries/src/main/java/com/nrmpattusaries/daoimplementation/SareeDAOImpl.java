package com.nrmpattusaries.daoimplementation;


import java.sql.*;
import java.util.*;

import com.nrmpattusaries.dao.SareeDAO;
import com.nrmpattusaries.model.Saree;
import com.nrmpattusaries.utill.DBConnection;

public class SareeDAOImpl implements SareeDAO {

    @Override
    public boolean addSaree(Saree saree) {
        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO sarees(name, description, price, stock, image, category_id) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, saree.getName());
            ps.setString(2, saree.getDescription());
            ps.setDouble(3, saree.getPrice());
            ps.setInt(4, saree.getStock());
            ps.setString(5, saree.getImage());

            if (saree.getCategoryId() != null) {
                ps.setInt(6, saree.getCategoryId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    @Override
    public List<Saree> getAllSarees() {
        List<Saree> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM sarees";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Saree s = new Saree();

                s.setSareeId(rs.getInt("saree_id"));
                s.setName(rs.getString("name"));
                s.setDescription(rs.getString("description"));
                s.setPrice(rs.getDouble("price"));
                s.setStock(rs.getInt("stock"));
                s.setImage(rs.getString("image"));
                s.setCategoryId((Integer) rs.getObject("category_id"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    @Override
    public List<Saree> getSareesByCategory(int categoryId) {

        List<Saree> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM sarees WHERE category_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Saree s = new Saree();

                s.setSareeId(rs.getInt("saree_id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getDouble("price"));
                s.setStock(rs.getInt("stock"));
                s.setImage(rs.getString("image"));
                s.setCategoryId((Integer) rs.getObject("category_id"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    @Override
    public List<Saree> searchSarees(String keyword, Integer categoryId) {

        List<Saree> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            StringBuilder query = new StringBuilder("SELECT * FROM sarees WHERE 1=1");

            if (keyword != null && !keyword.isEmpty()) {
                query.append(" AND name LIKE ?");
            }

            if (categoryId != null) {
                query.append(" AND category_id=?");
            }

            PreparedStatement ps = con.prepareStatement(query.toString());

            int index = 1;

            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(index++, "%" + keyword + "%");
            }

            if (categoryId != null) {
                ps.setInt(index++, categoryId);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Saree s = new Saree();

                s.setSareeId(rs.getInt("saree_id"));
                s.setName(rs.getString("name"));
                s.setPrice(rs.getDouble("price"));
                s.setStock(rs.getInt("stock"));
                s.setImage(rs.getString("image"));
                s.setCategoryId((Integer) rs.getObject("category_id"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Saree getSareeById(int sareeId) {

        Saree saree = null;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM sarees WHERE saree_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, sareeId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                saree = new Saree();

                saree.setSareeId(rs.getInt("saree_id"));
                saree.setName(rs.getString("name"));
                saree.setDescription(rs.getString("description"));
                saree.setPrice(rs.getDouble("price"));
                saree.setStock(rs.getInt("stock"));
                saree.setImage(rs.getString("image"));
                saree.setCategoryId((Integer) rs.getObject("category_id"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return saree;
    }

    @Override
    public boolean updateSaree(Saree saree) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "UPDATE sarees SET name=?, description=?, price=?, stock=?, image=?, category_id=? WHERE saree_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, saree.getName());
            ps.setString(2, saree.getDescription());
            ps.setDouble(3, saree.getPrice());
            ps.setInt(4, saree.getStock());
            ps.setString(5, saree.getImage());

            if (saree.getCategoryId() != null) {
                ps.setInt(6, saree.getCategoryId());
            } else {
                ps.setNull(6, Types.INTEGER);
            }

            ps.setInt(7, saree.getSareeId());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    @Override
    public boolean deleteSaree(int sareeId) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query =
                    "DELETE FROM sarees WHERE saree_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, sareeId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    
    @Override
    public List<Saree> getLowStockSarees() {

        List<Saree> sarees = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query =
                "SELECT * FROM sarees WHERE stock < 5";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Saree saree = new Saree();

                saree.setSareeId(
                        rs.getInt("saree_id"));

                saree.setName(
                        rs.getString("name"));

                saree.setDescription(
                        rs.getString("description"));

                saree.setPrice(
                        rs.getDouble("price"));

                saree.setStock(
                        rs.getInt("stock"));

                saree.setImage(
                        rs.getString("image"));

                saree.setCategoryId(
                        rs.getInt("category_id"));

                sarees.add(saree);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sarees;
    }
}
