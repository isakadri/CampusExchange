package com.campusbook.filter;

import java.io.IOException;

import com.campusbook.model.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {
        "/student/*",
        "/my-listings",
        "/my-reservations",
        "/seller-reservations",
        "/add-book",
        "/edit-book",
        "/update-book",
        "/delete-book",
        "/reserve-book",
        "/cancel-reservation",
        "/manage-reservation"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
                         throws IOException, ServletException {

        HttpServletRequest httpRequest =
                (HttpServletRequest) request;

        HttpServletResponse httpResponse =
                (HttpServletResponse) response;

        // Get existing session
        HttpSession session =
                httpRequest.getSession(false);

        // Check whether user is logged in
        boolean loggedIn =
                session != null &&
                session.getAttribute("user") != null;

        if (loggedIn) {

            // User is logged in
            User user =
                    (User) session.getAttribute("user");

            System.out.println(
                    "Authenticated user: "
                    + user.getEmail()
            );

            chain.doFilter(request, response);

        } else {

            // User is NOT logged in
            System.out.println(
                    "Unauthorized access attempt: "
                    + httpRequest.getRequestURI()
            );

            httpResponse.sendRedirect(
                    httpRequest.getContextPath()
                    + "/login.jsp"
            );
        }
    }
}