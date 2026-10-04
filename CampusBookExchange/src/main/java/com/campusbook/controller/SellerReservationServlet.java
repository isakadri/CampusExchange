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

@WebServlet("/seller-reservations")
public class SellerReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.jsp");

            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        int sellerId = user.getUserId();

        // DAO
        ReservationDAO reservationDAO =
                new ReservationDAO();

        // Get reservations for this seller
        List<Reservation> reservations =
                reservationDAO.getReservationsBySeller(sellerId);

        // Send reservations to JSP
        request.setAttribute(
                "reservations",
                reservations);

        // Open JSP
        request.getRequestDispatcher(
                "/student/seller-reservations.jsp")
                .forward(request, response);
    }
}