<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.campusbook.model.User"%>

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String name = user.getName() != null ? user.getName() : "Student";
    String email = user.getEmail() != null ? user.getEmail() : "Not provided";
    String college = user.getCollege() != null && !user.getCollege().isEmpty()
            ? user.getCollege() : "Not provided";
    String department = user.getDepartment() != null && !user.getDepartment().isEmpty()
            ? user.getDepartment() : "Not provided";
    String phone = user.getPhone() != null && !user.getPhone().isEmpty()
            ? user.getPhone() : "Not provided";
    String role = user.getRole() != null ? user.getRole() : "STUDENT";

    int semester = user.getSemester();

    String initial = name.substring(0, 1).toUpperCase();
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Profile | CampusBook Exchange</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

    <style>

        /* ================================
           PROFILE PAGE
           ================================ */

        .profile-page {
            max-width: 1100px;
            margin: 0 auto;
            padding: 35px 20px 60px;
        }

        /* PAGE HEADER */

        .profile-page-header {
            margin-bottom: 28px;
        }

        .profile-page-header .eyebrow {
            margin-bottom: 7px;
        }

        .profile-page-header h1 {
            margin: 0;
            font-size: 32px;
            color: #0f172a;
        }

        .profile-page-header p {
            margin-top: 8px;
            color: #64748b;
        }


        /* MAIN PROFILE CARD */

        .profile-main-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.07);
        }


        /* PROFILE TOP */

        .profile-cover {
            height: 145px;
            background:
                linear-gradient(
                    135deg,
                    #1d4ed8,
                    #4f46e5,
                    #7c3aed
                );
            position: relative;
        }


        .profile-top {
            display: flex;
            align-items: flex-end;
            gap: 22px;

            padding: 0 35px 28px;

            margin-top: -55px;

            position: relative;
        }


        /* AVATAR */

        .profile-avatar-large {
            width: 110px;
            height: 110px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #ffffff;

            border: 6px solid #ffffff;

            box-shadow:
                0 8px 20px rgba(15, 23, 42, 0.18);

            color: #2563eb;

            font-size: 38px;
            font-weight: 800;
        }


        /* USER NAME */

        .profile-user-info {
            padding-bottom: 5px;
        }

        .profile-user-info h2 {
            margin: 0;

            font-size: 26px;

            color: #0f172a;
        }

        .profile-user-info p {
            margin: 5px 0 10px;

            color: #64748b;

            font-size: 14px;
        }


        /* PROFILE BODY */

        .profile-body {
            padding: 0 35px 35px;
        }


        /* SECTION */

        .profile-info-section {
            margin-top: 28px;
        }

        .profile-info-section:first-child {
            margin-top: 0;
        }

        .profile-info-section h3 {
            margin: 0 0 17px;

            font-size: 17px;

            color: #0f172a;
        }


        /* INFO GRID */

        .profile-info-grid {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 15px;
        }


        /* INFO BOX */

        .profile-info-box {
            display: flex;
            align-items: center;

            gap: 15px;

            padding: 17px;

            background: #f8fafc;

            border: 1px solid #e5e7eb;

            border-radius: 13px;

            transition: 0.2s ease;
        }

        .profile-info-box:hover {
            transform: translateY(-2px);

            border-color: #c7d2fe;

            box-shadow:
                0 6px 15px rgba(37, 99, 235, 0.08);
        }


        /* INFO ICON */

        .profile-info-icon {
            width: 43px;
            height: 43px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 11px;

            background: #eff6ff;

            font-size: 20px;
        }


        /* INFO TEXT */

        .profile-info-content {
            min-width: 0;

            display: flex;
            flex-direction: column;

            gap: 4px;
        }

        .profile-info-label {
            font-size: 11px;

            text-transform: uppercase;

            letter-spacing: 0.06em;

            font-weight: 700;

            color: #94a3b8;
        }

        .profile-info-value {
            font-size: 15px;

            font-weight: 600;

            color: #1e293b;

            overflow-wrap: anywhere;
        }


        /* ROLE */

        .profile-role {
            display: inline-flex;

            align-items: center;

            gap: 7px;

            padding: 6px 11px;

            border-radius: 999px;

            background: #ecfdf5;

            color: #047857;

            font-size: 12px;

            font-weight: 700;
        }

        .profile-role-dot {
            width: 7px;
            height: 7px;

            border-radius: 50%;

            background: #10b981;
        }


        /* ACTIONS */

        .profile-actions {
            display: flex;

            justify-content: flex-end;

            gap: 12px;

            margin-top: 30px;

            padding-top: 25px;

            border-top: 1px solid #e5e7eb;
        }


        /* RESPONSIVE */

        @media (max-width: 768px) {

            .profile-page {
                padding: 25px 15px 40px;
            }

            .profile-cover {
                height: 110px;
            }

            .profile-top {
                align-items: center;

                flex-direction: column;

                text-align: center;

                padding: 0 20px 25px;

                margin-top: -50px;
            }

            .profile-body {
                padding: 0 20px 25px;
            }

            .profile-info-grid {
                grid-template-columns: 1fr;
            }

            .profile-avatar-large {
                width: 95px;
                height: 95px;

                font-size: 32px;
            }

            .profile-user-info h2 {
                font-size: 22px;
            }

            .profile-actions {
                flex-direction: column;
            }

            .profile-actions .btn {
                width: 100%;
                text-align: center;
            }
        }

    </style>

</head>

<body>


<!-- =====================================================
     NAVBAR
     ===================================================== -->

<nav class="navbar">

    <!-- LOGO -->

    <div class="navbar-brand">

        <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
            📚 CampusBook
        </a>

    </div>


    <!-- NAVIGATION -->

    <div class="navbar-links">

        <a href="<%= request.getContextPath() %>/student/dashboard.jsp">
            Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/books/search.jsp">
            Browse Books
        </a>

        <a href="<%= request.getContextPath() %>/my-listings">
            My Listings
        </a>

        <a href="<%= request.getContextPath() %>/my-reservations">
            Reservations
        </a>

        <a href="<%= request.getContextPath() %>/seller-reservations">
            Requests
        </a>

        <a href="<%= request.getContextPath() %>/student/profile.jsp"
           class="active">
            Profile
        </a>

        <a href="<%= request.getContextPath() %>/logout"
           class="btn btn-danger">
            Logout
        </a>

    </div>

</nav>


<!-- =====================================================
     PROFILE PAGE
     ===================================================== -->

<main class="profile-page">


    <!-- PAGE HEADER -->

    <div class="profile-page-header">

        <p class="eyebrow">
            ACCOUNT
        </p>

        <h1>
            My Profile
        </h1>

        <p>
            Manage and view your CampusBook Exchange account information.
        </p>

    </div>


    <!-- =================================================
         PROFILE CARD
         ================================================= -->

    <div class="profile-main-card">


        <!-- COVER -->

        <div class="profile-cover"></div>


        <!-- PROFILE TOP -->

        <div class="profile-top">


            <!-- AVATAR -->

            <div class="profile-avatar-large">
                <%= initial %>
            </div>


            <!-- NAME -->

            <div class="profile-user-info">

                <h2>
                    <%= name %>
                </h2>

                <p>
                    <%= email %>
                </p>

                <span class="profile-role">

                    <span class="profile-role-dot"></span>

                    <%= role %>

                </span>

            </div>

        </div>


        <!-- =================================================
             PROFILE BODY
             ================================================= -->

        <div class="profile-body">


            <!-- PERSONAL INFORMATION -->

            <section class="profile-info-section">

                <h3>
                    👤 Personal Information
                </h3>

                <div class="profile-info-grid">


                    <!-- NAME -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            👤
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Full Name
                            </span>

                            <span class="profile-info-value">
                                <%= name %>
                            </span>

                        </div>

                    </div>


                    <!-- EMAIL -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            ✉️
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Email Address
                            </span>

                            <span class="profile-info-value">
                                <%= email %>
                            </span>

                        </div>

                    </div>


                    <!-- PHONE -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            📱
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Phone Number
                            </span>

                            <span class="profile-info-value">
                                <%= phone %>
                            </span>

                        </div>

                    </div>


                    <!-- ROLE -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            🛡️
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Account Role
                            </span>

                            <span class="profile-info-value">
                                <%= role %>
                            </span>

                        </div>

                    </div>

                </div>

            </section>


            <!-- ACADEMIC INFORMATION -->

            <section class="profile-info-section">

                <h3>
                    🎓 Academic Information
                </h3>

                <div class="profile-info-grid">


                    <!-- COLLEGE -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            🏫
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                College
                            </span>

                            <span class="profile-info-value">
                                <%= college %>
                            </span>

                        </div>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            💻
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Department
                            </span>

                            <span class="profile-info-value">
                                <%= department %>
                            </span>

                        </div>

                    </div>


                    <!-- SEMESTER -->

                    <div class="profile-info-box">

                        <div class="profile-info-icon">
                            📚
                        </div>

                        <div class="profile-info-content">

                            <span class="profile-info-label">
                                Current Semester
                            </span>

                            <span class="profile-info-value">

                                <%
                                    if (semester > 0) {
                                %>

                                    Semester <%= semester %>

                                <%
                                    } else {
                                %>

                                    Not provided

                                <%
                                    }
                                %>

                            </span>

                        </div>

                    </div>

                </div>

            </section>


            <!-- ACTIONS -->

            <div class="profile-actions">

                <a href="<%= request.getContextPath() %>/student/dashboard.jsp"
                   class="btn">

                    ← Back to Dashboard

                </a>

                <a href="<%= request.getContextPath() %>/logout"
                   class="btn btn-danger">

                    Logout

                </a>

            </div>

        </div>

    </div>

</main>

</body>
</html>