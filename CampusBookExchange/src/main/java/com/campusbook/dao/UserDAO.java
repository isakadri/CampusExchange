package com.campusbook.dao;
import com.campusbook.util.PasswordUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.campusbook.model.User;
import com.campusbook.util.DBConnection;
import com.campusbook.util.PasswordUtil;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql = """
                INSERT INTO users
                (name, email, password, college, department,
                 semester, phone, role)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getCollege());
            ps.setString(5, user.getDepartment());
            ps.setInt(6, user.getSemester());
            ps.setString(7, user.getPhone());
            ps.setString(8, user.getRole());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
    public User loginUser(String email, String password) {

        String sql = "SELECT * FROM users WHERE email = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String hashedPassword =
                        rs.getString("password");

                // Check entered password against BCrypt hash
                if (PasswordUtil.checkPassword(
                        password,
                        hashedPassword)) {

                    User user = new User();

                    user.setUserId(
                            rs.getInt("user_id")
                    );

                    user.setName(
                            rs.getString("name")
                    );

                    user.setEmail(
                            rs.getString("email")
                    );

                    user.setCollege(
                            rs.getString("college")
                    );

                    user.setDepartment(
                            rs.getString("department")
                    );

                    user.setSemester(
                            rs.getInt("semester")
                    );

                    user.setPhone(
                            rs.getString("phone")
                    );

                    user.setRole(
                            rs.getString("role")
                    );

                    return user;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}