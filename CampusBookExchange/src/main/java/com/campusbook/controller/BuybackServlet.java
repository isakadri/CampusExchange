package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.Book;

import com.campusbook.dao.BuybackDAO;
import com.campusbook.model.Buyback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/buyback")
public class BuybackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
                           throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {

            // Get form values
            int bookId = Integer.parseInt(
                    request.getParameter("bookId")
            );

            double originalPrice = Double.parseDouble(
                    request.getParameter("originalPrice")
            );

            String bookCondition =
                    request.getParameter("bookCondition");

            int editionAge = Integer.parseInt(
                    request.getParameter("editionAge")
            );


            // Validate values

            if (originalPrice <= 0) {
                response.getWriter().println(
                        "<h2>Original price must be greater than 0.</h2>"
                );
                return;
            }

            if (editionAge < 0) {
                response.getWriter().println(
                        "<h2>Edition age cannot be negative.</h2>"
                );
                return;
            }


            // Create DAO
            BuybackDAO buybackDAO = new BuybackDAO();


            // Calculate estimated value
            double estimatedValue =
                    buybackDAO.calculateValue(
                            originalPrice,
                            bookCondition,
                            editionAge
                    );


            // Create Buyback object
            Buyback buyback = new Buyback();

            buyback.setBookId(bookId);
            buyback.setOriginalPrice(originalPrice);
            buyback.setBookCondition(bookCondition);
            buyback.setEditionAge(editionAge);
            buyback.setEstimatedValue(estimatedValue);


            // Save valuation
            boolean saved =
                    buybackDAO.saveBuyback(buyback);


            if (saved) {

                request.setAttribute(
                        "buyback",
                        buyback
                );

                request.getRequestDispatcher(
                        "/student/buyback-result.jsp"
                ).forward(request, response);

            } else {

                response.getWriter().println(
                        "<h2>Unable to save buyback valuation.</h2>"
                );

                response.getWriter().println(
                        "<a href='"
                        + request.getContextPath()
                        + "/student/buyback.jsp'>"
                        + "Try Again"
                        + "</a>"
                );
            }

        } catch (NumberFormatException e) {

            response.getWriter().println(
                    "<h2>Invalid input.</h2>"
            );

            response.getWriter().println(
                    "<p>Please enter valid numbers.</p>"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error while calculating buyback value.</h2>"
            );
        }
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws ServletException, IOException {

        String id = request.getParameter("bookId");

        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect(
                request.getContextPath() + "/my-listings"
            );
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
                "/student/buyback.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                HttpServletResponse.SC_BAD_REQUEST,
                "Invalid book ID"
            );
        }
    }
}