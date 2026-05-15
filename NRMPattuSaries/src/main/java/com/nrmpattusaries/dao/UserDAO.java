package com.nrmpattusaries.dao;

import java.util.List;
import com.nrmpattusaries.model.User;

public interface UserDAO {

	// 🔐 Authentication
    User loginUser(String email, String password);

    // 📝 Registration
    boolean registerUser(User user);

    // 🔍 Get user by ID
    User getUserById(int userId);

    // 🔍 Get user by Email (useful for validation)
    User getUserByEmail(String email);

    // 📋 Get all users (Admin feature)
    List<User> getAllUsers();

    // ✏️ Update user details
    boolean updateUser(User user);

    // ❌ Delete user
    boolean deleteUser(int userId);

    // 🔐 Change password
    boolean updatePassword(int userId, String newPassword);

    // 📞 Optional: Check if email exists (validation)
    boolean isEmailExists(String email);
    
    //List users for Admin module
    List<User> searchUsers(String keyword);

}
