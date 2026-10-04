<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>



<%@ page import="java.util.List" %>
<%@ page import="com.campusbook.model.Book" %>
<%@ page import="com.campusbook.model.User" %>
<%@ page import="com.campusbook.dao.BookDAO" %>


<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp"
        );
        return;
    }


    BookDAO bookDAO = new BookDAO();

    List<Book> books =
        bookDAO.getBooksBySeller(user.getUserId());
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Listings | CampusBook Exchange</title>


    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">


    <style>

        .listing-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 20px;
            margin-bottom: 30px;
        }


        .listing-header h1 {
            margin-bottom: 8px;
        }


        .listing-header p {
            margin: 0;
        }


        .listing-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 24px;

            box-shadow:
                0 4px 12px rgba(15, 23, 42, 0.05);

            transition: 0.2s ease;
        }


        .listing-card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 10px 25px rgba(15, 23, 42, 0.08);
        }


        .listing-top {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            align-items: flex-start;
        }


        .book-icon {
            width: 52px;
            height: 52px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #eff6ff;
            border-radius: 12px;

            font-size: 25px;
        }


        .book-heading {
            display: flex;
            gap: 14px;
            align-items: center;
        }


        .book-heading h3 {
            margin: 0 0 5px;
            font-size: 19px;
        }


        .book-id {
            font-size: 13px;
            color: #94a3b8;
        }


        .listing-info {
            margin-top: 22px;
        }


        .info-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;

            padding: 9px 0;

            border-bottom: 1px solid #f1f5f9;

            font-size: 14px;
        }


        .info-row:last-child {
            border-bottom: none;
        }


        .info-label {
            color: #64748b;
        }


        .info-value {
            color: #0f172a;
            font-weight: 500;
            text-align: right;
        }


        .price-box {
            margin-top: 18px;
            padding: 15px;

            background: #f8fafc;

            border-radius: 10px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        .selling-price {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
        }


        .original-price {
            color: #94a3b8;
            font-size: 13px;
        }


        .listing-actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;

            margin-top: 20px;
            padding-top: 18px;

            border-top: 1px solid #e2e8f0;
        }


        .listing-actions .btn {
            flex: 1;
            min-width: 90px;
            text-align: center;
        }


        .status-available {
            background: #dcfce7;
            color: #166534;
        }


        .status-reserved {
            background: #fef3c7;
            color: #92400e;
        }


        .status-sold {
            background: #e2e8f0;
            color: #475569;
        }


        .empty-listings {
            text-align: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 18px;
            padding: 60px 25px;
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


        @media (max-width: 700px) {

            .listing-header {
                align-items: flex-start;
                flex-direction: column;
            }


            .listing-actions {
                flex-direction: column;
            }


            .listing-actions .btn {
                width: 100%;
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

        <div class="listing-header">


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
                    My Listings
                </h1>


                <p class="text-muted">

                    Manage the textbooks you have listed
                    for sale.

                </p>

            </div>


            <a class="btn btn-primary"
               href="<%= request.getContextPath() %>/student/add-book.jsp">

                + List a Book

            </a>


        </div>



        <!-- =================================================
             LISTINGS
             ================================================= -->


        <%
            if (books == null || books.isEmpty()) {
        %>


            <div class="empty-listings">


                <div class="empty-icon">
                    📚
                </div>


                <h2>
                    No Listings Yet
                </h2>


                <p class="text-muted"
                   style="max-width:500px; margin:10px auto 25px;">

                    You haven't listed any textbooks yet.
                    Sell your old books and help another
                    student save money.

                </p>


                <a class="btn btn-primary"
                   href="<%= request.getContextPath() %>/student/add-book.jsp">

                    📚 List Your First Book

                </a>


            </div>


        <%
            } else {
        %>


            <div class="book-grid">


            <%
                for (Book book : books) {
            %>


                <div class="listing-card">


                    <!-- TOP -->

                    <div class="listing-top">


                        <div class="book-heading">


                            <div class="book-icon">
                                📖
                            </div>


                            <div>

                                <h3>
                                    <%= book.getTitle() %>
                                </h3>


                                <div class="book-id">

                                    Book #<%= book.getBookId() %>

                                </div>

                            </div>


                        </div>



                        <!-- STATUS -->

                        <%
                            String status =
                                book.getStatus();

                            String statusClass =
                                "status-available";

                            if ("RESERVED".equals(status)) {
                                statusClass =
                                    "status-reserved";
                            }

                            if ("SOLD".equals(status)) {
                                statusClass =
                                    "status-sold";
                            }
                        %>


                        <span class="badge <%= statusClass %>">

                            <%= status %>

                        </span>


                    </div>



                    <!-- BOOK INFO -->

                    <div class="listing-info">


                        <div class="info-row">

                            <span class="info-label">
                                Author
                            </span>

                            <span class="info-value">
                                <%= book.getAuthor() %>
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Edition
                            </span>

                            <span class="info-value">
                                <%= book.getEdition() %>
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Publication Year
                            </span>

                            <span class="info-value">
                                <%= book.getPublicationYear() %>
                            </span>

                        </div>


                        <div class="info-row">

                            <span class="info-label">
                                Condition
                            </span>

                            <span class="info-value">
                                <%= book.getBookCondition() %>
                            </span>

                        </div>


                    </div>



                    <!-- PRICE -->

                    <div class="price-box">


                        <div>

                            <div class="original-price">

                                Original Price:
                                ₹<%= book.getOriginalPrice() %>

                            </div>


                            <div class="selling-price">

                                ₹<%= book.getSellingPrice() %>

                            </div>

                        </div>


                        <span class="text-muted"
                              style="font-size:13px;">

                            Selling Price

                        </span>


                    </div>



                    <!-- ACTIONS -->

                    <div class="listing-actions">


                        <%
                            if ("AVAILABLE".equals(book.getStatus())) {
                        %>


                            <a class="btn btn-secondary btn-sm"
                               href="<%= request.getContextPath() %>/edit-book?id=<%= book.getBookId() %>">

                                ✏️ Edit

                            </a>


                            <a class="btn btn-purple btn-sm"
                               href="<%= request.getContextPath() %>/buyback?bookId=<%= book.getBookId() %>">

                                💰 Buyback

                            </a>


                            <a class="btn btn-danger btn-sm"
                               href="<%= request.getContextPath() %>/delete-book?id=<%= book.getBookId() %>"
                               onclick="return confirm('Are you sure you want to delete this listing?');">

                                🗑 Delete

                            </a>


                        <%
                            } else if ("RESERVED".equals(book.getStatus())) {
                        %>


                            <span class="text-muted"
                                  style="font-size:13px;">

                                ⏳ This book has a pending reservation.

                            </span>


                        <%
                            } else if ("SOLD".equals(book.getStatus())) {
                        %>


                            <span class="text-muted"
                                  style="font-size:13px;">

                                ✓ This book has been sold.

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

                Sell smarter. Buy cheaper.
                Help your campus community.

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