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

    <title>List a Book | CampusBook Exchange</title>

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
     PAGE
     ===================================================== -->

<main class="section">

    <div class="container-small">


        <!-- PAGE HEADER -->

        <div style="margin-bottom: 30px;">

            <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
               style="
                    text-decoration: none;
                    color: #64748b;
                    font-size: 14px;
               ">

                ← Back to Dashboard

            </a>


            <h1 style="margin-top: 18px;">

                List Your Textbook

            </h1>


            <p class="text-muted">

                Sell your unused textbook to another
                student on your campus.

            </p>

        </div>



        <!-- =================================================
             FORM CARD
             ================================================= -->

        <div class="card">


            <div class="card-header">

                <div>

                    <h2>
                        Book Information
                    </h2>

                    <p class="text-muted">

                        Provide accurate details so buyers
                        can easily find your book.

                    </p>

                </div>


                <span class="badge badge-primary">

                    New Listing

                </span>

            </div>



            <form action="<%= request.getContextPath() %>/add-book"
                  method="post">


                <!-- =========================================
                     SUBJECT
                     ========================================= -->

                <div class="form-group">

                    <label class="form-label"
                           for="subjectId">

                        Subject

                    </label>


                    <select class="form-select"
                            id="subjectId"
                            name="subjectId"
                            required>

                        <option value="">
                            Select Subject
                        </option>

                        <option value="1">
                            CS301 — Data Structures
                        </option>

                        <option value="2">
                            CS302 — Database Management System
                        </option>

                        <option value="3">
                            CS401 — Operating System
                        </option>

                        <option value="4">
                            CS402 — Computer Networks
                        </option>

                        <option value="5">
                            CS501 — Advanced Java
                        </option>

                        <option value="6">
                            IT301 — Web Technology
                        </option>

                        <option value="7">
                            ME301 — Thermodynamics
                        </option>

                    </select>


                    <div class="form-text">

                        Select the subject this textbook
                        is mainly used for.

                    </div>

                </div>



                <!-- =========================================
                     TITLE + AUTHOR
                     ========================================= -->

                <div class="form-row">


                    <div class="form-group">

                        <label class="form-label"
                               for="title">

                            Book Title

                        </label>


                        <input
                            type="text"
                            class="form-control"
                            id="title"
                            name="title"
                            placeholder="e.g. Data Structures Using Java"
                            required>

                    </div>



                    <div class="form-group">

                        <label class="form-label"
                               for="author">

                            Author

                        </label>


                        <input
                            type="text"
                            class="form-control"
                            id="author"
                            name="author"
                            placeholder="e.g. Robert Lafore"
                            required>

                    </div>


                </div>



                <!-- =========================================
                     EDITION + PUBLICATION YEAR
                     ========================================= -->

                <div class="form-row">


                    <div class="form-group">

                        <label class="form-label"
                               for="edition">

                            Edition

                        </label>


                        <input
                            type="text"
                            class="form-control"
                            id="edition"
                            name="edition"
                            placeholder="e.g. 5th Edition"
                            required>

                    </div>



                    <div class="form-group">

                        <label class="form-label"
                               for="publicationYear">

                            Publication Year

                        </label>


                        <input
                            type="number"
                            class="form-control"
                            id="publicationYear"
                            name="publicationYear"
                            min="1900"
                            max="2026"
                            placeholder="e.g. 2024"
                            required>

                    </div>


                </div>



                <!-- =========================================
                     CONDITION
                     ========================================= -->

                <div class="form-group">

                    <label class="form-label"
                           for="bookCondition">

                        Book Condition

                    </label>


                    <select
                        class="form-select"
                        id="bookCondition"
                        name="bookCondition"
                        required>

                        <option value="">
                            Select condition
                        </option>

                        <option value="NEW">
                            New
                        </option>

                        <option value="LIKE_NEW">
                            Like New
                        </option>

                        <option value="GOOD">
                            Good
                        </option>

                        <option value="FAIR">
                            Fair
                        </option>

                        <option value="POOR">
                            Poor
                        </option>

                    </select>


                    <div class="form-text">

                        Be honest about the condition.
                        It helps buyers make better decisions.

                    </div>

                </div>



                <!-- =========================================
                     PRICING
                     ========================================= -->

                <div class="card"
                     style="
                        background: #f8fafc;
                        margin: 25px 0;
                     ">


                    <h3 style="margin-bottom: 5px;">

                        💰 Pricing

                    </h3>


                    <p class="text-muted"
                       style="margin-bottom: 20px;">

                        Set a reasonable resale price
                        for your textbook.

                    </p>



                    <div class="form-row">


                        <div class="form-group">

                            <label class="form-label"
                                   for="originalPrice">

                                Original Price (₹)

                            </label>


                            <input
                                type="number"
                                class="form-control"
                                id="originalPrice"
                                name="originalPrice"
                                min="0"
                                step="0.01"
                                placeholder="e.g. 850"
                                required>

                        </div>



                        <div class="form-group">

                            <label class="form-label"
                                   for="sellingPrice">

                                Selling Price (₹)

                            </label>


                            <input
                                type="number"
                                class="form-control"
                                id="sellingPrice"
                                name="sellingPrice"
                                min="0"
                                step="0.01"
                                placeholder="e.g. 450"
                                required>

                        </div>


                    </div>


                </div>



                <!-- =========================================
                     DESCRIPTION
                     ========================================= -->

                <div class="form-group">

                    <label class="form-label"
                           for="description">

                        Description

                    </label>


                    <textarea
                        class="form-textarea"
                        id="description"
                        name="description"
                        rows="5"
                        placeholder="Mention highlights such as notes, markings, highlighting, missing pages, extra material, etc."
                        required></textarea>


                    <div class="form-text">

                        Example: "Good condition. Some pages
                        are highlighted. No torn pages."

                    </div>

                </div>



                <!-- =========================================
                     SELLER NOTICE
                     ========================================= -->

                <div class="alert alert-info"
                     style="margin-top: 25px;">

                    <strong>
                        📌 Listing Tips
                    </strong>

                    <ul style="
                        margin: 10px 0 0 20px;
                        line-height: 1.7;
                    ">

                        <li>
                            Enter the correct subject code.
                        </li>

                        <li>
                            Mention the actual condition.
                        </li>

                        <li>
                            Keep your selling price reasonable.
                        </li>

                        <li>
                            Clearly mention any damage or markings.
                        </li>

                    </ul>

                </div>



                <!-- =========================================
                     BUTTONS
                     ========================================= -->

                <div style="
                    display: flex;
                    justify-content: flex-end;
                    gap: 12px;
                    margin-top: 30px;
                ">


                    <a
                        href="<%= request.getContextPath() %>/student/dashboard.jsp"
                        class="btn btn-secondary">

                        Cancel

                    </a>


                    <button
                        type="submit"
                        class="btn btn-primary">

                        📚 List Book

                    </button>


                </div>


            </form>


        </div>


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

            <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
                Dashboard
            </a>

        </div>


    </div>

</footer>


</body>

</html>