package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.Book;
import com.campusbook.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit-book")
public class EditBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp");

            return;
        }

        User user =
                (User) session.getAttribute("user");

        // Get book ID
        String id =
                request.getParameter("id");

        if (id == null ||
            id.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/my-listings");

            return;
        }

        try {

            int bookId =
                    Integer.parseInt(id);

            BookDAO bookDAO =
                    new BookDAO();

            // Get only this seller's book
            Book book =
                    bookDAO.getBookByIdForSeller(
                            bookId,
                            user.getUserId());

            if (book == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Book not found or you are not the owner.");

                return;
            }

            // Only AVAILABLE books can be edited
            if (!"AVAILABLE".equals(book.getStatus())) {

                response.setContentType(
                        "text/html;charset=UTF-8");

                

                response.getWriter().println(
                        "<!DOCTYPE html>"
                        + "<html>"
                        + "<head>"
                        + "<meta charset='UTF-8'>"
                        + "<title>Cannot Edit Book</title>"
                        + "</head>"
                        + "<body>"

                        + "<h2>This book cannot be edited</h2>"

                        + "<p>"
                        + "Only available books can be edited."
                        + "</p>"

                        + "<a href='"
                        + request.getContextPath()
                        + "/my-listings'>"
                        + "← Back to My Listings"
                        + "</a>"

                        + "</body>"
                        + "</html>"
                );

                return;
            }

            // Send book to JSP
            request.setAttribute(
                    "book",
                    book);

            request.getRequestDispatcher(
                    "student/edit-book.jsp")
                    .forward(
                            request,
                            response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID");
        }
    }
}