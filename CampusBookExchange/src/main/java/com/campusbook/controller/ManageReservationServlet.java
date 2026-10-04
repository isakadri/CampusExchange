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

@WebServlet("/manage-reservation")
public class ManageReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session =
                request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        // Get logged-in seller
        User user =
                (User) session.getAttribute("user");

        // Get parameters
        String id =
                request.getParameter("id");

        String action =
                request.getParameter("action");

        // Validate parameters
        if (id == null ||
            id.trim().isEmpty() ||
            action == null ||
            action.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/seller-reservations");

            return;
        }

        try {

            int reservationId =
                    Integer.parseInt(id);

            ReservationDAO reservationDAO =
                    new ReservationDAO();

            boolean success = false;


            // =========================
            // ACCEPT
            // =========================

            if ("accept".equalsIgnoreCase(action)) {

                success =
                    reservationDAO.acceptReservation(
                        reservationId,
                        user.getUserId()
                    );
            }


            // =========================
            // REJECT
            // =========================

            else if ("reject".equalsIgnoreCase(action)) {

                success =
                    reservationDAO.rejectReservation(
                        reservationId,
                        user.getUserId()
                    );
            }


            // =========================
            // RESULT
            // =========================

            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/seller-reservations");

            } else {

                response.setContentType(
                        "text/html;charset=UTF-8");

                response.getWriter().println("""
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <title>Action Failed</title>
                    </head>
                    <body>
                        <h2>Unable to process reservation.</h2>
                        <p>
                            The reservation may no longer be pending
                            or you may not own this book.
                        </p>

                        <a href="seller-reservations">
                            Back to Reservations
                        </a>
                    </body>
                    </html>
                    """);
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid reservation ID");
        }
    }
}