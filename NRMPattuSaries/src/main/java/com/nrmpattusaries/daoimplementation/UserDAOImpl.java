package com.nrmpattusaries.daoimplementation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;


import com.nrmpattusaries.dao.UserDAO;
import com.nrmpattusaries.model.User;
import com.nrmpattusaries.utill.DBConnection;


public class UserDAOImpl implements UserDAO{
	
	// 🔐 LOGIN
    @Override
    public User loginUser(String email, String password) {
        User user = null;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
        

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	String storedHashedPassword = rs.getString("password");

                // 🔐 BCrypt comparison
                if (BCrypt.checkpw(password, storedHashedPassword)) {
                    user = extractUser(rs);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    // 📝 REGISTER
    @Override
    public boolean registerUser(User user) {
        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO users(name,email,password,phone,address,role) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getRole() != null ? user.getRole() : "CUSTOMER");

            status = ps.executeUpdate() > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("Email already exists!");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

	
    // 🔍 GET USER BY ID
    @Override
    public User getUserById(int userId) {
        User user = null;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM users WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = extractUser(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    
    // 🔍 GET USER BY EMAIL
    @Override
    public User getUserByEmail(String email) {
        User user = null;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = extractUser(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    // 📋 GET ALL USERS
    @Override
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT * FROM users";
            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                users.add(extractUser(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }
    
    // ✏️ UPDATE USER
    @Override
    public boolean updateUser(User user) {
        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "UPDATE users SET name=?, email=?, phone=?, address=?, role=? WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getRole());
            ps.setInt(6, user.getUserId());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    // ❌ DELETE USER
    @Override
    public boolean deleteUser(int userId) {
        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "DELETE FROM users WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    
    // 🔐 UPDATE PASSWORD
    @Override
    public boolean updatePassword(int userId, String newPassword) {

        boolean status = false;

        try (Connection con = DBConnection.getConnection()) {

            // 🔐 HASH PASSWORD
            String hashedPassword =
                    BCrypt.hashpw(newPassword, BCrypt.gensalt());

            String query =
                    "UPDATE users SET password=? WHERE user_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, hashedPassword);
            ps.setInt(2, userId);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    
    // 📧 CHECK EMAIL EXISTS
    @Override
    public boolean isEmailExists(String email) {
        boolean exists = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT 1 FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            exists = rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return exists;
    }
    
    
    // 🔧 COMMON METHOD (ResultSet → User Object)
    private User extractUser(ResultSet rs) throws SQLException {

        User user = new User();

        user.setUserId(rs.getInt("user_id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        user.setCreatedAt(rs.getTimestamp("created_at"));

        return user;
    }
    
    
    @Override
    public List<User> searchUsers(String keyword) {

        List<User> users = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query =

            "SELECT * FROM users " +
            "WHERE name LIKE ? " +
            "OR email LIKE ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    "%" + keyword + "%");

            ps.setString(2,
                    "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                users.add(extractUser(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }







}
