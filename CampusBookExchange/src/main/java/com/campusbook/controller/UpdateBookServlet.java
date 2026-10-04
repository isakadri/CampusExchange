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

@WebServlet("/update-book")
public class UpdateBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        User user = (User) session.getAttribute("user");

        try {

            int bookId = Integer.parseInt(
                    request.getParameter("bookId"));

            int subjectId = Integer.parseInt(
                    request.getParameter("subjectId"));

            String title =
                    request.getParameter("title");

            String author =
                    request.getParameter("author");

            String edition =
                    request.getParameter("edition");

            int publicationYear =
                    Integer.parseInt(
                            request.getParameter("publicationYear"));

            String bookCondition =
                    request.getParameter("bookCondition");

            double originalPrice =
                    Double.parseDouble(
                            request.getParameter("originalPrice"));

            double sellingPrice =
                    Double.parseDouble(
                            request.getParameter("sellingPrice"));

            String description =
                    request.getParameter("description");


            Book book = new Book();

            book.setBookId(bookId);
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

            boolean updated =
                    bookDAO.updateBook(book);


            if (updated) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/my-listings");

            } else {

                response.setContentType(
                        "text/html;charset=UTF-8");

                response.getWriter().println(
                        "<h2>Failed to update book!</h2>");

                response.getWriter().println(
                        "<a href='"
                        + request.getContextPath()
                        + "/my-listings'>"
                        + "Back to My Listings"
                        + "</a>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8");

            response.getWriter().println(
                    "<h2>Error while updating book</h2>");

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>");
        }
    }
}