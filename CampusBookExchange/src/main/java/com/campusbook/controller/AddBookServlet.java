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

@WebServlet("/add-book")
public class AddBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        try {

            int subjectId = Integer.parseInt(
                    request.getParameter("subjectId"));

            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String edition = request.getParameter("edition");

            int publicationYear = Integer.parseInt(
                    request.getParameter("publicationYear"));

            String bookCondition =
                    request.getParameter("bookCondition");

            double originalPrice = Double.parseDouble(
                    request.getParameter("originalPrice"));

            double sellingPrice = Double.parseDouble(
                    request.getParameter("sellingPrice"));

            String description =
                    request.getParameter("description");


            Book book = new Book();

            book.setSellerId(user.getUserId());
            book.setSubjectId(subjectId);
            book.setTitle(title);
            book.setAuthor(author);
            book.setEdition(edition);
            book.setPublicationYear(publicationYear);
            book.setBookCondition(bookCondition);
            book.setOriginalPrice(originalPrice);
            book.setSellingPrice(sellingPrice);
            book.setDescription(description);


            BookDAO bookDAO = new BookDAO();

            boolean added = bookDAO.addBook(book);


            if (added) {

                response.setContentType("text/html");

                response.getWriter().println(
                    "<h2>Book Listed Successfully!</h2>"
                );

                response.getWriter().println(
                    "<a href='student/dashboard.jsp'>"
                    + "Back to Dashboard</a>"
                );

            } else {

                response.setContentType("text/html");

                response.getWriter().println(
                    "<h2>Failed to List Book!</h2>"
                );

                response.getWriter().println(
                    "<a href='student/add-book.jsp'>"
                    + "Try Again</a>"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Error while adding book</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}