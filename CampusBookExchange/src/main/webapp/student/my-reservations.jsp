<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="com.campusbook.model.User" %>
<%@ page import="com.campusbook.model.Reservation" %>
<%@ page import="com.campusbook.dao.ReservationDAO" %>


<%
    User user = (User) session.getAttribute("user");

    if (user == null) {

        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );

        return;
    }


    ReservationDAO reservationDAO =
            new ReservationDAO();


    List<Reservation> reservations =
            reservationDAO.getReservationsByBuyer(
                    user.getUserId()
            );


    SimpleDateFormat dateFormat =
            new SimpleDateFormat("dd MMM yyyy, hh:mm a");
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Reservations | CampusBook Exchange</title>


    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">


    <style>

        .page-header {

            display: flex;

            justify-content: space-between;

            align-items: flex-end;

            gap: 20px;

            margin-bottom: 30px;
        }


        .reservation-grid {

            display: grid;

            grid-template-columns:
                repeat(auto-fit, minmax(320px, 1fr));

            gap: 20px;
        }


        .reservation-card {

            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 16px;

            padding: 24px;

            box-shadow:
                0 4px 12px rgba(15,23,42,0.05);

            transition: 0.2s ease;
        }


        .reservation-card:hover {

            transform: translateY(-3px);

            box-shadow:
                0 10px 25px rgba(15,23,42,0.08);
        }


        .reservation-top {

            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            gap: 15px;

            margin-bottom: 20px;
        }


        .book-heading {

            display: flex;

            gap: 13px;

            align-items: center;
        }


        .book-icon {

            width: 48px;

            height: 48px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eff6ff;

            border-radius: 12px;

            font-size: 24px;
        }


        .book-heading h3 {

            margin: 0 0 5px;

            font-size: 18px;
        }


        .reservation-id {

            color: #94a3b8;

            font-size: 13px;
        }


        .reservation-info {

            border-top: 1px solid #f1f5f9;

            border-bottom: 1px solid #f1f5f9;

            padding: 12px 0;

        }


        .info-row {

            display: flex;

            justify-content: space-between;

            gap: 15px;

            padding: 8px 0;

            font-size: 14px;
        }


        .info-label {

            color: #64748b;
        }


        .info-value {

            color: #0f172a;

            font-weight: 500;

            text-align: right;
        }


        .reservation-price {

            margin-top: 18px;

            padding: 15px;

            background: #f8fafc;

            border-radius: 10px;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }


        .price-label {

            color: #64748b;

            font-size: 13px;
        }


        .price {

            font-size: 22px;

            font-weight: 700;

            color: #0f172a;
        }


        .reservation-actions {

            margin-top: 18px;

            display: flex;

            gap: 10px;
        }


        .reservation-actions .btn {

            flex: 1;

            text-align: center;
        }


        .status-pending {

            background: #fef3c7;

            color: #92400e;
        }


        .status-accepted {

            background: #dcfce7;

            color: #166534;
        }


        .status-rejected {

            background: #fee2e2;

            color: #991b1b;
        }


        .status-cancelled {

            background: #e2e8f0;

            color: #475569;
        }


        .empty-state {

            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 18px;

            padding: 60px 25px;

            text-align: center;
        }


        .empty-icon {

            width: 70px;

            height: 70px;

            margin: 0 auto 20px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #eff6ff;

            border-radius: 50%;

            font-size: 32px;
        }


        @media(max-width:700px) {

            .page-header {

                flex-direction: column;

                align-items: flex-start;
            }

            .reservation-actions {

                flex-direction: column;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar">

    <div class="navbar-inner">


        <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
           class="logo">

            <span class="logo-icon">
                📚
            </span>

            CampusBook

        </a>


        <div class="nav-links">

            <a href="<%= request.getContextPath() %>/books/search.jsp">
                Browse Books
            </a>

            <a href="<%= request.getContextPath() %>/student/my-listings.jsp">
                My Listings
            </a>

            <a href="<%= request.getContextPath() %>/student/my-reservations.jsp">
                Reservations
            </a>

        </div>


        <div class="nav-actions">

            <a class="btn btn-secondary btn-sm"
               href="<%= request.getContextPath() %>/student/profile.jsp">

                👤 Profile

            </a>


            <a class="btn btn-danger btn-sm"
               href="<%= request.getContextPath() %>/logout">

                Logout

            </a>

        </div>

    </div>

</nav>



<!-- =====================================================
     MAIN
     ===================================================== -->

<main class="section">

    <div class="container">


        <!-- HEADER -->

        <div class="page-header">


            <div>

                <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
                   style="
                        text-decoration:none;
                        color:#64748b;
                        font-size:14px;
                   ">

                    ← Back to Dashboard

                </a>


                <h1 style="margin-top:18px;">

                    My Reservations

                </h1>


                <p class="text-muted">

                    Track the textbooks you have reserved.

                </p>

            </div>


            <a class="btn btn-primary"
               href="<%= request.getContextPath() %>/books/search.jsp">

                🔍 Browse Books

            </a>


        </div>



        <!-- =================================================
             RESERVATIONS
             ================================================= -->


        <%
            if (reservations == null ||
                reservations.isEmpty()) {
        %>


            <div class="empty-state">


                <div class="empty-icon">
                    📖
                </div>


                <h2>
                    No Reservations Yet
                </h2>


                <p class="text-muted"
                   style="
                        max-width:500px;
                        margin:10px auto 25px;
                   ">

                    You haven't reserved any textbooks yet.
                    Browse available books and reserve the
                    ones you need.

                </p>


                <a class="btn btn-primary"
                   href="<%= request.getContextPath() %>/books/search.jsp">

                    🔍 Find a Textbook

                </a>


            </div>


        <%
            } else {
        %>


            <div class="reservation-grid">


            <%
                for (Reservation reservation :
                        reservations) {


                    String status =
                            reservation.getStatus();


                    String statusClass =
                            "status-pending";


                    if ("ACCEPTED".equals(status)) {

                        statusClass =
                                "status-accepted";

                    } else if ("REJECTED".equals(status)) {

                        statusClass =
                                "status-rejected";

                    } else if ("CANCELLED".equals(status)) {

                        statusClass =
                                "status-cancelled";
                    }
            %>


                <div class="reservation-card">


                    <!-- TOP -->

                    <div class="reservation-top">


                        <div class="book-heading">


                            <div class="book-icon">
                                📖
                            </div>


                            <div>

                                <h3>
                                    <%= reservation.getBookTitle() %>
                                </h3>


                                <div class="reservation-id">

                                    Reservation
                                    #<%= reservation.getReservationId() %>

                                </div>

                            </div>

                        </div>


                        <span class="badge <%= statusClass %>">

                            <%= status %>

                        </span>


                    </div>



                    <!-- INFO -->

                    <div class="reservation-info">


                        <div class="info-row">

                            <span class="info-label">
                                Author
                            </span>

                            <span class="info-value">
                                <%= reservation.getAuthor() %>
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Book ID
                            </span>

                            <span class="info-value">
                                #<%= reservation.getBookId() %>
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Reserved On
                            </span>

                            <span class="info-value">

                                <%
                                    if (reservation.getReservationDate()
                                            != null) {
                                %>

                                    <%= dateFormat.format(
                                            reservation.getReservationDate()
                                       ) %>

                                <%
                                    } else {
                                %>

                                    -

                                <%
                                    }
                                %>

                            </span>

                        </div>


                    </div>



                    <!-- PRICE -->

                    <div class="reservation-price">


                        <div>

                            <div class="price-label">

                                Selling Price

                            </div>


                            <div class="price">

                                ₹<%= reservation.getSellingPrice() %>

                            </div>

                        </div>


                        <span style="
                            font-size:13px;
                            color:#64748b;
                        ">

                            Textbook

                        </span>


                    </div>



                    <!-- ACTIONS -->

                    <div class="reservation-actions">


                        <a class="btn btn-secondary btn-sm"
                           href="<%= request.getContextPath() %>/book-details?id=<%= reservation.getBookId() %>">

                            👁 View Book

                        </a>


                        <%
                            if ("PENDING".equals(status)) {
                        %>


                            <a class="btn btn-danger btn-sm"
                               href="<%= request.getContextPath() %>/cancel-reservation?id=<%= reservation.getReservationId() %>"
                               onclick="return confirm('Are you sure you want to cancel this reservation?');">

                                ✕ Cancel

                            </a>


                        <%
                            } else if ("ACCEPTED".equals(status)) {
                        %>


                            <span class="btn btn-success btn-sm">

                                ✓ Reservation Accepted

                            </span>


                        <%
                            } else if ("REJECTED".equals(status)) {
                        %>


                            <span class="btn btn-danger btn-sm">

                                Reservation Rejected

                            </span>


                        <%
                            } else if ("CANCELLED".equals(status)) {
                        %>


                            <span class="btn btn-secondary btn-sm">

                                Reservation Cancelled

                            </span>


                        <%
                            }
                        %>


                    </div>


                </div>


            <%
                }
            %>


            </div>


        <%
            }
        %>


    </div>

</main>



<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer class="footer">

    <div class="footer-inner">


        <div>

            <div class="logo"
                 style="color:white;">

                <span class="logo-icon">
                    📚
                </span>

                CampusBook Exchange

            </div>


            <p style="margin-top:10px;">

                Find affordable textbooks
                within your campus community.

            </p>

        </div>


        <div class="footer-links">

            <a href="<%= request.getContextPath() %>/books/search.jsp">
                Browse Books
            </a>

            <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                Dashboard
            </a>

        </div>


    </div>

</footer>


</body>

</html>