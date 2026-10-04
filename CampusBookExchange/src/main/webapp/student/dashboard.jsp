<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.campusbook.model.User" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard | CampusBook Exchange</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

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
     DASHBOARD
     ===================================================== -->

<main class="dashboard">

    <div class="container">


        <!-- HEADER -->

        <div class="dashboard-header">

            <div>

                <h1 class="dashboard-title">

                    Welcome back,
                    <%= user.getName() %> 👋

                </h1>

                <p class="dashboard-subtitle">

                    Manage your textbooks, listings and
                    reservations from one place.

                </p>

            </div>


            <a class="btn btn-primary"
               href="<%= request.getContextPath() %>/student/add-book.jsp">

                + List a Book

            </a>

        </div>



        <!-- =================================================
             QUICK STATS
             ================================================= -->

        <div class="stats-grid">


            <div class="stat-card">

                <div class="stat-icon">
                    📚
                </div>

                <div class="stat-value">
                    Sell
                </div>

                <div class="stat-label">
                    List an unused textbook
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    🔍
                </div>

                <div class="stat-value">
                    Find
                </div>

                <div class="stat-label">
                    Search textbooks
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    📌
                </div>

                <div class="stat-value">
                    Reserve
                </div>

                <div class="stat-label">
                    Track your reservations
                </div>

            </div>



            <div class="stat-card">

                <div class="stat-icon">
                    💰
                </div>

                <div class="stat-value">
                    Buyback
                </div>

                <div class="stat-label">
                    Estimate book value
                </div>

            </div>


        </div>



        <!-- =================================================
             MAIN ACTIONS
             ================================================= -->

        <section class="section-sm">

            <div class="card-header">

                <div>

                    <h2>
                        Quick Actions
                    </h2>

                    <p class="text-muted">
                        What would you like to do?
                    </p>

                </div>

            </div>



            <div class="grid grid-3">


                <!-- SEARCH -->

                <a href="<%= request.getContextPath() %>/books/search.jsp"
                   class="card"
                   style="transition: 0.2s;">

                    <div class="stat-icon">

                        🔍

                    </div>

                    <h3>

                        Search Books

                    </h3>

                    <p class="mt-2">

                        Find textbooks using subject code,
                        title, author or edition.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        Browse marketplace →

                    </div>

                </a>



                <!-- SELL -->

                <a href="<%= request.getContextPath() %>/student/add-book.jsp"
                   class="card">

                    <div class="stat-icon">

                        📖

                    </div>

                    <h3>

                        Sell a Book

                    </h3>

                    <p class="mt-2">

                        List your used textbook and
                        reach students from your campus.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        Create listing →

                    </div>

                </a>



                <!-- LISTINGS -->

                <a href="<%= request.getContextPath() %>/student/my-listings.jsp"
                   class="card">

                    <div class="stat-icon">

                        🏷️

                    </div>

                    <h3>

                        My Listings

                    </h3>

                    <p class="mt-2">

                        View, edit or delete textbooks
                        you have listed for sale.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        Manage listings →

                    </div>

                </a>



                <!-- BUYER RESERVATIONS -->

                <a href="<%= request.getContextPath() %>/student/my-reservations.jsp"
                   class="card">

                    <div class="stat-icon">

                        📌

                    </div>

                    <h3>

                        My Reservations

                    </h3>

                    <p class="mt-2">

                        Track books you have reserved
                        from other students.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        View reservations →

                    </div>

                </a>



                <!-- SELLER RESERVATIONS -->

                <a href="<%= request.getContextPath() %>/seller-reservations"
                   class="card">

                    <div class="stat-icon">

                        🤝

                    </div>

                    <h3>

                        Seller Requests

                    </h3>

                    <p class="mt-2">

                        Review reservation requests
                        received for your books.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        Manage requests →

                    </div>

                </a>



                <!-- PROFILE -->

                <a href="<%= request.getContextPath() %>/student/profile.jsp"
                   class="card">

                    <div class="stat-icon">

                        👤

                    </div>

                    <h3>

                        My Profile

                    </h3>

                    <p class="mt-2">

                        View and manage your campus
                        account information.

                    </p>

                    <div class="text-primary mt-3"
                         style="font-weight: 600;">

                        View profile →

                    </div>

                </a>


            </div>

        </section>



        <!-- =================================================
             SEARCH CTA
             ================================================= -->

        <section>

            <div class="card"
                 style="
                    background:
                    linear-gradient(
                        135deg,
                        #eff6ff,
                        #f5f3ff
                    );
                 ">


                <div class="grid grid-2"
                     style="align-items: center;">


                    <div>

                        <span class="badge badge-primary">

                            📚 Campus Marketplace

                        </span>


                        <h2 style="margin-top: 12px;">

                            Looking for a textbook?

                        </h2>


                        <p class="mt-2">

                            Search by subject code,
                            semester, title or author
                            and find affordable books
                            from fellow students.

                        </p>


                        <a class="btn btn-primary mt-4"
                           href="<%= request.getContextPath() %>/books/search.jsp">

                            🔍 Find a Book

                        </a>

                    </div>


                    <div style="
                        text-align: center;
                        font-size: 90px;
                    ">

                        📚

                    </div>


                </div>

            </div>

        </section>



        <!-- =================================================
             ACCOUNT INFORMATION
             ================================================= -->

        <section class="section-sm">

            <div class="card">


                <div class="card-header">

                    <div>

                        <h3>
                            Account Overview
                        </h3>

                        <p class="text-muted">
                            Your CampusBook account
                        </p>

                    </div>


                    <a class="btn btn-outline btn-sm"
                       href="<%= request.getContextPath() %>/student/profile.jsp">

                        Edit Profile

                    </a>

                </div>


                <div class="grid grid-3">


                    <div>

                        <div class="text-muted"
                             style="font-size: 13px;">

                            Name

                        </div>

                        <strong>

                            <%= user.getName() %>

                        </strong>

                    </div>


                    <div>

                        <div class="text-muted"
                             style="font-size: 13px;">

                            Email

                        </div>

                        <strong>

                            <%= user.getEmail() %>

                        </strong>

                    </div>


                    <div>

                        <div class="text-muted"
                             style="font-size: 13px;">

                            Role

                        </div>

                        <span class="badge badge-success">

                            <%= user.getRole() %>

                        </span>

                    </div>


                </div>

            </div>

        </section>


    </div>

</main>



<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer class="footer">

    <div class="footer-inner">


        <div>

            <div class="logo"
                 style="color: white;">

                <span class="logo-icon">
                    📚
                </span>

                CampusBook Exchange

            </div>

            <p style="margin-top: 10px;">

                Your campus marketplace for
                affordable textbooks.

            </p>

        </div>


        <div class="footer-links">

            <a href="<%= request.getContextPath() %>/books/search.jsp">
                Browse Books
            </a>

            <a href="<%= request.getContextPath() %>/student/profile.jsp">
                Profile
            </a>

            <a href="<%= request.getContextPath() %>/logout">
                Logout
            </a>

        </div>


    </div>

</footer>


</body>

</html>