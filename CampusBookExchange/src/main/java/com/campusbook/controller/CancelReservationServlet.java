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

@WebServlet("/cancel-reservation")
public class CancelReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Check login
        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp");

            return;
        }

        // Get logged-in user
        User user =
                (User) session.getAttribute("user");

        // Get reservation ID
        String id =
                request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/my-reservations");

            return;
        }

        try {

            int reservationId =
                    Integer.parseInt(id);

            ReservationDAO reservationDAO =
                    new ReservationDAO();

            boolean cancelled =
                    reservationDAO.cancelReservation(
                            reservationId,
                            user.getUserId()
                    );

            if (cancelled) {

                // Go back to reservations
                response.sendRedirect(
                        request.getContextPath()
                        + "/my-reservations");

            } else {

                response.setContentType(
                        "text/html;charset=UTF-8");

                response.getWriter().println("""
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta charset="UTF-8">
                        <title>Cancellation Failed</title>
                    </head>

                    <body>

                        <h2>Unable to Cancel Reservation</h2>

                        <p>
                            The reservation may already
                            be cancelled or completed.
                        </p>

                        <a href="
                    """ + request.getContextPath()
                    + "/my-reservations\">"
                    + "← Back to My Reservations"
                    + "</a>"

                    + """
                    </body>
                    </html>
                    """);
            }

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid reservation ID"
            );
        }
    }
}