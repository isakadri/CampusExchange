package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.UserDAO;
import com.campusbook.model.User;
import com.campusbook.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String college = request.getParameter("college");
        String department = request.getParameter("department");
        String phone = request.getParameter("phone");

        int semester;

        try {
            semester = Integer.parseInt(
                    request.getParameter("semester")
            );
        } catch (NumberFormatException e) {
            response.getWriter().println(
                    "<h2>Invalid semester</h2>"
            );
            return;
        }

        // Hash password before storing it
        String hashedPassword =
                PasswordUtil.hashPassword(password);

        User user = new User(
                name,
                email,
                hashedPassword,
                college,
                department,
                semester,
                phone
        );

        UserDAO userDAO = new UserDAO();

        boolean registered =
                userDAO.registerUser(user);

        if (registered) {

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Registration Successful!</h2>"
            );

            response.getWriter().println(
                    "<a href='"
                    + request.getContextPath()
                    + "/login.jsp'>"
                    + "Login Here"
                    + "</a>"
            );

        } else {

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>Registration Failed!</h2>"
            );

            response.getWriter().println(
                    "<a href='"
                    + request.getContextPath()
                    + "/register.jsp'>"
                    + "Try Again"
                    + "</a>"
            );
        }
    }
}