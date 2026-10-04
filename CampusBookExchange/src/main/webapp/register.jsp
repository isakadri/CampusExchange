<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Create Account | CampusBook Exchange</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>


<body>


<div class="auth-page">


    <div class="auth-card"
         style="max-width: 600px;">


        <!-- LOGO -->

        <div class="auth-logo">

            <div class="logo-icon">

                📚

            </div>

            <h1>
                Create Your Account
            </h1>

            <p>
                Join your campus textbook marketplace.
            </p>

        </div>



        <!-- REGISTER FORM -->

        <form action="<%= request.getContextPath() %>/register"
              method="post">


            <!-- NAME + EMAIL -->

            <div class="form-row">


                <div class="form-group">

                    <label class="form-label">
                        Full Name
                    </label>

                    <input
                        type="text"
                        name="name"
                        class="form-control"
                        placeholder="Enter your full name"
                        autocomplete="name"
                        required>

                </div>



                <div class="form-group">

                    <label class="form-label">
                        Email Address
                    </label>

                    <input
                        type="email"
                        name="email"
                        class="form-control"
                        placeholder="Enter your email"
                        autocomplete="email"
                        required>

                </div>


            </div>



            <!-- PASSWORD -->

            <div class="form-group">

                <label class="form-label">
                    Password
                </label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    placeholder="Create a password"
                    autocomplete="new-password"
                    minlength="6"
                    required>

            </div>



            <!-- COLLEGE -->

            <div class="form-group">

                <label class="form-label">
                    College
                </label>

                <input
                    type="text"
                    name="college"
                    class="form-control"
                    placeholder="Enter your college name">

            </div>



            <!-- DEPARTMENT + SEMESTER -->

            <div class="form-row">


                <div class="form-group">

                    <label class="form-label">
                        Department
                    </label>

                    <select
                        name="department"
                        class="form-select"
                        required>

                        <option value="">
                            Select Department
                        </option>

                        <option value="Computer Science">
                            Computer Science
                        </option>

                        <option value="Information Technology">
                            Information Technology
                        </option>

                        <option value="Mechanical Engineering">
                            Mechanical Engineering
                        </option>

                        <option value="Civil Engineering">
                            Civil Engineering
                        </option>

                        <option value="Electronics Engineering">
                            Electronics Engineering
                        </option>

                        <option value="Other">
                            Other
                        </option>

                    </select>

                </div>



                <div class="form-group">

                    <label class="form-label">
                        Semester
                    </label>

                    <select
                        name="semester"
                        class="form-select"
                        required>

                        <option value="">
                            Select Semester
                        </option>

                        <option value="1">
                            Semester 1
                        </option>

                        <option value="2">
                            Semester 2
                        </option>

                        <option value="3">
                            Semester 3
                        </option>

                        <option value="4">
                            Semester 4
                        </option>

                        <option value="5">
                            Semester 5
                        </option>

                        <option value="6">
                            Semester 6
                        </option>

                        <option value="7">
                            Semester 7
                        </option>

                        <option value="8">
                            Semester 8
                        </option>

                    </select>

                </div>


            </div>



            <!-- PHONE -->

            <div class="form-group">

                <label class="form-label">
                    Phone Number
                </label>

                <input
                    type="tel"
                    name="phone"
                    class="form-control"
                    placeholder="Enter your phone number"
                    maxlength="15">

            </div>



            <!-- SUBMIT -->

            <button
                type="submit"
                class="btn btn-primary"
                style="width: 100%;">

                Create CampusBook Account

            </button>


        </form>



        <!-- LOGIN -->

        <div style="
            text-align: center;
            margin-top: 24px;
            padding-top: 22px;
            border-top: 1px solid var(--border);
        ">

            <p style="font-size: 14px;">

                Already have an account?

                <a
                    href="<%= request.getContextPath() %>/login.jsp"
                    class="text-primary"
                    style="font-weight: 600;">

                    Login

                </a>

            </p>

        </div>



        <!-- BACK -->

        <div style="
            text-align: center;
            margin-top: 18px;
        ">

            <a
                href="<%= request.getContextPath() %>/index.jsp"
                class="text-muted"
                style="font-size: 13px;">

                ← Back to CampusBook

            </a>

        </div>


    </div>


</div>


</body>

</html>