<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.campusbook.model.Book" %>

<%
    Book book = (Book) request.getAttribute("book");

    if (book == null) {
        response.sendRedirect("search.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>
        <%= book.getTitle() %>
    </title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        .book-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.1);
        }

        h1 {
            margin-bottom: 25px;
        }

        .price {
            font-size: 25px;
            font-weight: bold;
        }

        .condition {
            display: inline-block;
            padding: 6px 12px;
            background: #eee;
            border-radius: 5px;
        }

        .status {
            display: inline-block;
            padding: 6px 12px;
            background: #eee;
            border-radius: 5px;
        }

        .reserve-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background: #333;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="book-card">

        <h1>
            <%= book.getTitle() %>
        </h1>

        <p>
            <strong>Author:</strong>
            <%= book.getAuthor() %>
        </p>

        <p>
            <strong>Edition:</strong>
            <%= book.getEdition() %>
        </p>

        <p>
            <strong>Publication Year:</strong>
            <%= book.getPublicationYear() %>
        </p>

        <p>
            <strong>Condition:</strong>

            <span class="condition">
                <%= book.getBookCondition() %>
            </span>

        </p>

        <hr>

        <p>
            <strong>Original Price:</strong>
            ₹<%= book.getOriginalPrice() %>
        </p>

        <p class="price">
            Selling Price:
            ₹<%= book.getSellingPrice() %>
        </p>

        <p>
            <strong>Description:</strong>
        </p>

        <p>
            <%= book.getDescription() %>
        </p>

        <p>
            <strong>Status:</strong>

            <span class="status">
                <%= book.getStatus() %>
            </span>

        </p>

        <% if ("AVAILABLE".equals(book.getStatus())) { %>

            <a class="reserve-btn"
               href="<%= request.getContextPath() %>/reserve-book?id=<%= book.getBookId() %>">

                Reserve This Book

            </a>

        <% } %>

        <br>

        <a class="back"
           href="<%= request.getContextPath() %>/books/search.jsp">

            ← Back to Search

        </a>

    </div>

</div>

</body>

</html>