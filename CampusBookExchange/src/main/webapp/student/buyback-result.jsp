<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.campusbook.model.Buyback" %>

<%
    Buyback buyback =
            (Buyback) request.getAttribute("buyback");

    if (buyback == null) {
        response.sendRedirect(
            request.getContextPath() + "/student/buyback.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Buyback Valuation Result</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
    padding: 40px;
}

.container {
    max-width: 600px;
    margin: auto;
}

.card {
    background: white;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 25px;
}

.result {
    text-align: center;
    background: #f1f1f1;
    padding: 25px;
    border-radius: 10px;
    margin-bottom: 25px;
}

.result-label {
    font-size: 16px;
    margin-bottom: 10px;
}

.estimated-value {
    font-size: 36px;
    font-weight: bold;
}

.details {
    margin-top: 20px;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #ddd;
}

.label {
    font-weight: bold;
}

.buttons {
    margin-top: 30px;
    text-align: center;
}

.btn {
    display: inline-block;
    padding: 12px 18px;
    margin: 5px;
    border-radius: 6px;
    text-decoration: none;
    color: white;
}

.primary {
    background: #333;
}

.secondary {
    background: #666;
}

.btn:hover {
    opacity: 0.85;
}

.note {
    margin-top: 25px;
    padding: 15px;
    background: #f8f8f8;
    border-radius: 6px;
    font-size: 14px;
    line-height: 1.5;
}

</style>

</head>

<body>

<div class="container">

    <div class="card">

        <h1>💰 Buyback Valuation</h1>


        <!-- Estimated Value -->

        <div class="result">

            <div class="result-label">
                Estimated Buyback Value
            </div>

            <div class="estimated-value">

                ₹<%= String.format("%.2f",
                    buyback.getEstimatedValue()) %>

            </div>

        </div>


        <!-- Book Details -->

        <div class="details">

            <div class="detail-row">

                <span class="label">
                    Book ID
                </span>

                <span>
                    <%= buyback.getBookId() %>
                </span>

            </div>


            <div class="detail-row">

                <span class="label">
                    Original Price
                </span>

                <span>
                    ₹<%= String.format("%.2f",
                        buyback.getOriginalPrice()) %>
                </span>

            </div>


            <div class="detail-row">

                <span class="label">
                    Condition
                </span>

                <span>
                    <%= buyback.getBookCondition() %>
                </span>

            </div>


            <div class="detail-row">

                <span class="label">
                    Edition Age
                </span>

                <span>
                    <%= buyback.getEditionAge() %> years
                </span>

            </div>

        </div>


        <!-- Information -->

        <div class="note">

            <strong>Note:</strong>

            This is an estimated buyback value based on
            the book's original price, condition and edition age.
            The actual resale price may vary depending on
            market demand and book condition.

        </div>


        <!-- Buttons -->

        <div class="buttons">

            <a class="btn primary"
               href="<%= request.getContextPath() %>/student/buyback.jsp">

                Calculate Again

            </a>


            <a class="btn secondary"
               href="<%= request.getContextPath() %>/student/dashboard.jsp">

                Back to Dashboard

            </a>

        </div>

    </div>

</div>

</body>

</html>