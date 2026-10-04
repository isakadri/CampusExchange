package com.campusbook.controller;

import java.io.IOException;
import java.util.List;

import com.campusbook.dao.ReservationDAO;
import com.campusbook.model.Reservation;
import com.campusbook.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-reservations")
public class MyReservationsServlet extends HttpServlet {

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

        // Get reservations
        ReservationDAO reservationDAO =
                new ReservationDAO();

        List<Reservation> reservations =
                reservationDAO.getReservationsByBuyer(
                        user.getUserId());

        // Send data to JSP
        request.setAttribute(
                "reservations",
                reservations);

        // Forward to JSP
        request.getRequestDispatcher(
                "student/my-reservations.jsp")
                .forward(request, response);
    }
}