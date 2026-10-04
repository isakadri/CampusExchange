<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Login | CampusBook Exchange</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

</head>


<body>


<div class="auth-page">


    <div class="auth-card">


        <!-- LOGO -->

        <div class="auth-logo">

            <div class="logo-icon">

                📚

            </div>

            <h1>
                CampusBook Exchange
            </h1>

            <p>
                Welcome back! Login to continue.
            </p>

        </div>



        <!-- LOGIN FORM -->

        <form action="<%= request.getContextPath() %>/login"
              method="post">


            <div class="form-group">

                <label class="form-label">

                    Email Address

                </label>

                <input
                    type="email"
                    name="email"
                    class="form-control"
                    placeholder="Enter your college email"
                    autocomplete="email"
                    required>

            </div>



            <div class="form-group">

                <label class="form-label">

                    Password

                </label>

                <input
                    type="password"
                    name="password"
                    class="form-control"
                    placeholder="Enter your password"
                    autocomplete="current-password"
                    required>

            </div>



            <button
                type="submit"
                class="btn btn-primary"
                style="width: 100%;">

                Login to CampusBook

            </button>


        </form>



        <!-- REGISTER -->

        <div style="
            text-align: center;
            margin-top: 24px;
            padding-top: 22px;
            border-top: 1px solid var(--border);
        ">

            <p style="font-size: 14px;">

                Don't have an account?

                <a
                    href="<%= request.getContextPath() %>/register.jsp"
                    class="text-primary"
                    style="font-weight: 600;">

                    Create Account

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