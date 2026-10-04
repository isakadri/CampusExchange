<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CampusBook Exchange | Buy & Sell Textbooks</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>


<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar">

    <div class="navbar-inner">

        <a href="<%= request.getContextPath() %>/index.jsp"
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

            <a href="#how-it-works">
                How It Works
            </a>

            <a href="#features">
                Features
            </a>

        </div>


        <div class="nav-actions">

            <a class="btn btn-secondary btn-sm"
               href="<%= request.getContextPath() %>/login.jsp">

                Login

            </a>


            <a class="btn btn-primary btn-sm"
               href="<%= request.getContextPath() %>/register.jsp">

                Get Started

            </a>

        </div>

    </div>

</nav>



<!-- =====================================================
     HERO
     ===================================================== -->

<section class="hero">

    <div class="hero-content">

        <div class="badge badge-primary"
             style="margin-bottom: 18px;">

            🎓 Built for College Students

        </div>


        <h1>

            Buy. Sell.
            <span>Exchange.</span>

            <br>

            Textbooks Made Simple.

        </h1>


        <p>

            A campus-focused marketplace where students
            can buy and sell second-hand textbooks using
            subject codes, semesters and departments.

        </p>


        <div class="hero-actions">

            <a class="btn btn-primary btn-lg"
               href="<%= request.getContextPath() %>/books/search.jsp">

                🔍 Browse Books

            </a>


            <a class="btn btn-outline btn-lg"
               href="<%= request.getContextPath() %>/login.jsp">

                Sell Your Book

            </a>

        </div>

    </div>

</section>



<!-- =====================================================
     SEARCH SECTION
     ===================================================== -->

<section class="section-sm">

    <div class="container">

        <div class="text-center mb-4">

            <h2>
                Find the book you need
            </h2>

            <p>
                Search using a subject code, title,
                author or edition.
            </p>

        </div>


        <div class="search-wrapper">

            <form
                action="<%= request.getContextPath() %>/search-books"
                method="get">

                <div class="search-box">

                    <input
                        type="text"
                        name="keyword"
                        placeholder="Try CS301, Java, Database, Data Structures..."
                        autocomplete="off"
                        required>


                    <button type="submit">

                        🔍 Search

                    </button>

                </div>

            </form>

        </div>

    </div>

</section>



<!-- =====================================================
     FEATURES
     ===================================================== -->

<section class="section"
         id="features">

    <div class="container">

        <div class="text-center mb-5">

            <h2>
                Everything students need
            </h2>

            <p>
                Designed specifically for campus textbook
                buying and selling.
            </p>

        </div>


        <div class="grid grid-3">


            <!-- FEATURE 1 -->

            <div class="card">

                <div class="stat-icon">

                    🔎

                </div>

                <h3>

                    Smart Book Search

                </h3>

                <p class="mt-2">

                    Search textbooks using subject codes,
                    subject names, titles, authors and
                    editions.

                </p>

            </div>


            <!-- FEATURE 2 -->

            <div class="card">

                <div class="stat-icon">

                    💰

                </div>

                <h3>

                    Sell Your Textbooks

                </h3>

                <p class="mt-2">

                    List your used books with condition,
                    original price and your selling price.

                </p>

            </div>


            <!-- FEATURE 3 -->

            <div class="card">

                <div class="stat-icon">

                    📚

                </div>

                <h3>

                    Campus Focused

                </h3>

                <p class="mt-2">

                    Find books based on departments,
                    semesters and university subject codes.

                </p>

            </div>


            <!-- FEATURE 4 -->

            <div class="card">

                <div class="stat-icon">

                    🔒

                </div>

                <h3>

                    Secure Accounts

                </h3>

                <p class="mt-2">

                    Student accounts are protected with
                    password hashing and authenticated
                    sessions.

                </p>

            </div>


            <!-- FEATURE 5 -->

            <div class="card">

                <div class="stat-icon">

                    🤝

                </div>

                <h3>

                    Easy Reservations

                </h3>

                <p class="mt-2">

                    Reserve an available textbook and let
                    the seller manage your request.

                </p>

            </div>


            <!-- FEATURE 6 -->

            <div class="card">

                <div class="stat-icon">

                    📈

                </div>

                <h3>

                    Buyback Valuation

                </h3>

                <p class="mt-2">

                    Get an estimated buyback value based
                    on book condition, price and age.

                </p>

            </div>


        </div>

    </div>

</section>



<!-- =====================================================
     HOW IT WORKS
     ===================================================== -->

<section class="section"
         id="how-it-works"
         style="background: white;">

    <div class="container">

        <div class="text-center mb-5">

            <h2>
                How CampusBook works
            </h2>

            <p>
                Buying or selling a textbook takes only
                a few simple steps.
            </p>

        </div>


        <div class="grid grid-3">


            <div class="card text-center">

                <div class="stat-icon"
                     style="margin: 0 auto 15px;">

                    01

                </div>

                <h3>
                    Find a Book
                </h3>

                <p class="mt-2">

                    Search by subject code, title,
                    author or edition.

                </p>

            </div>


            <div class="card text-center">

                <div class="stat-icon"
                     style="margin: 0 auto 15px;">

                    02

                </div>

                <h3>
                    Reserve
                </h3>

                <p class="mt-2">

                    Open the listing and send a
                    reservation request.

                </p>

            </div>


            <div class="card text-center">

                <div class="stat-icon"
                     style="margin: 0 auto 15px;">

                    03

                </div>

                <h3>
                    Connect & Exchange
                </h3>

                <p class="mt-2">

                    Once the seller accepts, arrange
                    the textbook exchange.

                </p>

            </div>


        </div>

    </div>

</section>



<!-- =====================================================
     CTA
     ===================================================== -->

<section class="section">

    <div class="container">

        <div class="card"
             style="
                background: linear-gradient(
                    135deg,
                    #0f172a,
                    #1e293b
                );
                color: white;
                padding: 50px;
                text-align: center;
             ">

            <h2 style="color: white;">

                Have textbooks sitting unused?

            </h2>


            <p style="
                color: #cbd5e1;
                max-width: 600px;
                margin: 12px auto 25px;
             ">

                Turn your old textbooks into money and
                help another student save on expensive
                study material.

            </p>


            <a class="btn btn-primary btn-lg"
               href="<%= request.getContextPath() %>/register.jsp">

                Start Selling

            </a>

        </div>

    </div>

</section>



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

                A smarter way for students to
                buy and sell textbooks.

            </p>

        </div>


        <div class="footer-links">

            <a href="<%= request.getContextPath() %>/books/search.jsp">
                Browse
            </a>

            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>

            <a href="<%= request.getContextPath() %>/register.jsp">
                Register
            </a>

        </div>

    </div>


    <div style="
        max-width: 1200px;
        margin: 30px auto 0;
        padding-top: 20px;
        border-top: 1px solid #334155;
        text-align: center;
        color: #64748b;
        font-size: 13px;
    ">

        © 2026 CampusBook Exchange.
        Built for students.

    </div>

</footer>


</body>

</html>