<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.campusbook.model.User" %>
<%@ page import="com.campusbook.model.Reservation" %>

<%
    // =========================
    // CHECK LOGIN
    // =========================

    User user =
            (User) session.getAttribute("user");

    if (user == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp");

        return;
    }


    // =========================
    // GET RESERVATIONS
    // =========================

    List<Reservation> reservations =
            (List<Reservation>)
            request.getAttribute("reservations");


    // Prevent null
    if (reservations == null) {
        reservations = new java.util.ArrayList<>();
    }
%>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Seller Requests - CampusBook Exchange</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>


<body>


<!-- =========================================
     NAVBAR
========================================= -->

<nav class="navbar">

    <div class="navbar-inner">

        <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
           class="logo">

            <span class="logo-icon">CB</span>

            <span>CampusBook</span>

        </a>


        <div class="nav-links">

            <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                Dashboard
            </a>

            <a href="<%= request.getContextPath() %>/search-books?keyword=java">
                Browse Books
            </a>

            <a href="<%= request.getContextPath() %>/my-listings">
                My Listings
            </a>

            <a href="<%= request.getContextPath() %>/seller-reservations"
               class="active">

                Seller Requests

            </a>

        </div>


        <div class="nav-actions">

            <span class="text-muted">
                <%= user.getName() %>
            </span>

            <a href="<%= request.getContextPath() %>/logout"
               class="btn btn-outline btn-sm">

                Logout

            </a>

        </div>

    </div>

</nav>



<!-- =========================================
     MAIN CONTENT
========================================= -->

<main class="container section">


    <!-- PAGE HEADER -->

    <div class="page-header">

        <div>

            <div class="eyebrow">
                SELLER DASHBOARD
            </div>

            <h1>
                Reservation Requests
            </h1>

            <p class="text-muted">
                Manage students who want to buy your books.
            </p>

        </div>

        <div>

            <a href="<%= request.getContextPath() %>/my-listings"
               class="btn btn-secondary">

                My Listings

            </a>

        </div>

    </div>



    <!-- =========================================
         NO RESERVATIONS
    ========================================= -->

    <% if (reservations.isEmpty()) { %>

        <div class="empty-state">

            <div class="empty-icon">
                📚
            </div>

            <h2>
                No reservation requests
            </h2>

            <p class="text-muted">

                When another student reserves one of your books,
                the request will appear here.

            </p>

            <a href="<%= request.getContextPath() %>/my-listings"
               class="btn btn-primary">

                View My Listings

            </a>

        </div>


    <% } else { %>


        <!-- =========================================
             RESERVATION LIST
        ========================================= -->

        <div class="reservation-list">


            <% for (Reservation reservation : reservations) { %>


                <div class="card reservation-card">


                    <!-- =================================
                         HEADER
                    ================================== -->

                    <div class="reservation-header">

                        <div>

                            <h2>
                                <%= reservation.getBookTitle() %>
                            </h2>

                            <% if (reservation.getAuthor() != null
                                   && !reservation.getAuthor().isEmpty()) { %>

                                <p class="text-muted">

                                    by <%= reservation.getAuthor() %>

                                </p>

                            <% } %>

                        </div>


                        <!-- STATUS -->

                        <%
                            String status =
                                    reservation.getStatus();

                            String statusClass =
                                    "badge-secondary";

                            if ("PENDING".equalsIgnoreCase(status)) {

                                statusClass =
                                        "badge-warning";

                            } else if ("ACCEPTED".equalsIgnoreCase(status)) {

                                statusClass =
                                        "badge-success";

                            } else if ("REJECTED".equalsIgnoreCase(status)) {

                                statusClass =
                                        "badge-danger";

                            } else if ("CANCELLED".equalsIgnoreCase(status)) {

                                statusClass =
                                        "badge-secondary";
                            }
                        %>


                        <span class="status-badge <%= statusClass %>">

                            <%= status %>

                        </span>

                    </div>



                    <!-- =================================
                         DETAILS
                    ================================== -->

                    <div class="reservation-details">


                        <!-- BOOK ID -->

                        <div class="detail-item">

                            <span class="detail-label">
                                Book ID
                            </span>

                            <strong>
                                #<%= reservation.getBookId() %>
                            </strong>

                        </div>


                        <!-- PRICE -->

                        <div class="detail-item">

                            <span class="detail-label">
                                Selling Price
                            </span>

                            <strong class="price">

                                ₹<%= String.format(
                                    "%.2f",
                                    reservation.getSellingPrice()
                                ) %>

                            </strong>

                        </div>


                        <!-- RESERVATION DATE -->

                        <div class="detail-item">

                            <span class="detail-label">
                                Requested On
                            </span>

                            <strong>

                                <%= reservation.getReservationDate() %>

                            </strong>

                        </div>


                    </div>



                    <!-- =================================
                         BUYER INFORMATION
                    ================================== -->

                    <div class="buyer-section">

                        <h3>
                            Buyer Information
                        </h3>


                        <div class="reservation-details">


                            <!-- NAME -->

                            <div class="detail-item">

                                <span class="detail-label">
                                    Name
                                </span>

                                <strong>

                                    <%= reservation.getBuyerName() %>

                                </strong>

                            </div>


                            <!-- EMAIL -->

                            <div class="detail-item">

                                <span class="detail-label">
                                    Email
                                </span>

                                <strong>

                                    <%= reservation.getBuyerEmail() %>

                                </strong>

                            </div>


                            <!-- PHONE -->

                            <div class="detail-item">

                                <span class="detail-label">
                                    Phone
                                </span>

                                <strong>

                                    <%= reservation.getBuyerPhone() %>

                                </strong>

                            </div>


                        </div>

                    </div>



                    <!-- =================================
                         ACTIONS
                    ================================== -->

                    <% if ("PENDING".equalsIgnoreCase(
                            reservation.getStatus())) { %>


                        <div class="reservation-actions">


                            <!-- ACCEPT -->

                            <a href="<%= request.getContextPath() %>/manage-reservation?action=accept&id=<%= reservation.getReservationId() %>"
                               class="btn btn-success"
                               onclick="return confirm('Accept this reservation? The book will be marked as SOLD.');">

                                Accept Reservation

                            </a>


                            <!-- REJECT -->

                            <a href="<%= request.getContextPath() %>/manage-reservation?action=reject&id=<%= reservation.getReservationId() %>"
                               class="btn btn-danger"
                               onclick="return confirm('Reject this reservation? The book will become AVAILABLE again.');">

                                Reject

                            </a>


                        </div>


                    <% } else if ("ACCEPTED".equalsIgnoreCase(
                            reservation.getStatus())) { %>


                        <div class="alert alert-success">

                            Reservation accepted.
                            The book has been marked as SOLD.

                        </div>


                    <% } else if ("REJECTED".equalsIgnoreCase(
                            reservation.getStatus())) { %>


                        <div class="alert alert-error">

                            This reservation was rejected.

                        </div>


                    <% } else if ("CANCELLED".equalsIgnoreCase(
                            reservation.getStatus())) { %>


                        <div class="alert alert-error">

                            The buyer cancelled this reservation.

                        </div>


                    <% } %>


                </div>


            <% } %>


        </div>


    <% } %>


</main>



<!-- =========================================
     FOOTER
========================================= -->

<footer class="footer">

    <div class="container">

        <p>
            © 2026 CampusBook Exchange.
            Built for students, by students.
        </p>

    </div>

</footer>


</body>

</html>