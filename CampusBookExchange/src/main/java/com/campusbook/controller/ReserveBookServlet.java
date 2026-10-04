package com.campusbook.controller;

import java.io.IOException;

import com.campusbook.dao.ReservationDAO;
import com.campusbook.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/reserve-book")
public class ReserveBookServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check login
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");
            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get book ID
        String id = request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath() + "/books/search.jsp");
            return;
        }

        try {

            int bookId = Integer.parseInt(id);

            ReservationDAO reservationDAO =
                    new ReservationDAO();

            boolean reserved =
                    reservationDAO.reserveBook(
                            bookId,
                            user.getUserId()
                    );

            if (reserved) {

                // Reservation successful
                response.sendRedirect(
                        request.getContextPath()
                        + "/my-reservations");

            } else {

                // Reservation failed
                response.setContentType(
                        "text/html;charset=UTF-8");

                response.getWriter().println("""
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>Reservation Failed</title>
                    </head>
                    <body>

                        <h2>Unable to Reserve Book</h2>

                        <p>
                            The book may already be reserved,
                            unavailable, or you may be the seller.
                        </p>

                        <a href="javascript:history.back()">
                            ← Go Back
                        </a>

                    </body>
                    </html>
                    """);
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid book ID"
            );
        }
    }
}