package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete-book")
public class DeleteBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp"
            );
            return;
        }

        User user = (User) session.getAttribute("user");

        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/my-listings"
            );
            return;
        }

        try {

            int bookId = Integer.parseInt(id);

            BookDAO bookDAO = new BookDAO();

            boolean deleted = bookDAO.deleteBook(
                bookId,
                user.getUserId()
            );

            if (deleted) {

                response.sendRedirect(
                    request.getContextPath() + "/my-listings"
                );

            } else {

                response.setContentType("text/html;charset=UTF-8");

                response.getWriter().println(
                    "<h2>Unable to delete book</h2>"
                );

                response.getWriter().println(
                    "<p>The book may not belong to you or "
                    + "may no longer be available.</p>"
                );

                response.getWriter().println(
                    "<a href='" + request.getContextPath()
                    + "/my-listings'>"
                    + "← Back to My Listings</a>"
                );
            }

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid book ID"
            );
        }
    }
}