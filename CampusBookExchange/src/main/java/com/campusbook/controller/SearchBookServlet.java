package com.campusbook.controller;

import java.io.IOException;
import java.util.List;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search-books")
public class SearchBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("keyword");

        if (keyword == null ||
            keyword.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/books/search.jsp"
            );

            return;
        }

        keyword = keyword.trim();

        BookDAO bookDAO = new BookDAO();

        List<Book> books =
                bookDAO.searchBooks(keyword);

        request.setAttribute(
                "books",
                books);

        request.setAttribute(
                "keyword",
                keyword);

        request.getRequestDispatcher(
                "/books/search-results.jsp")
                .forward(request, response);
    }
}