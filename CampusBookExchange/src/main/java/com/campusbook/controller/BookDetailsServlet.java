package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/book-details")
public class BookDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id == null || id.isEmpty()) {
            response.sendRedirect("books/search.jsp");
            return;
        }

        try {

            int bookId = Integer.parseInt(id);

            BookDAO bookDAO = new BookDAO();

            Book book = bookDAO.getBookById(bookId);

            if (book == null) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Book not found"
                );
                return;
            }

            request.setAttribute("book", book);

            request.getRequestDispatcher(
                    "books/book-details.jsp")
                    .forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID"
            );
        }
    }
}