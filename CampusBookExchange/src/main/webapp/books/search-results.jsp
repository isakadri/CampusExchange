<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.campusbook.model.Book" %>

<%
    List<Book> books =
        (List<Book>) request.getAttribute("books");

    String keyword =
        (String) request.getAttribute("keyword");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Search Results</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
    padding: 30px;
}

.container {
    max-width: 1100px;
    margin: auto;
}

h1 {
    text-align: center;
    margin-bottom: 10px;
}

.search-info {
    text-align: center;
    margin: 20px 0 30px;
    color: #555;
}

.search-keyword {
    color: #222;
}

.book-grid {
    display: grid;
    grid-template-columns:
        repeat(auto-fit, minmax(280px, 1fr));

    gap: 20px;
}

.book-card {
    background: white;
    padding: 20px;
    border-radius: 10px;

    box-shadow:
        0 3px 10px rgba(0,0,0,0.1);

    transition: transform 0.2s;
}

.book-card:hover {
    transform: translateY(-3px);
}

.book-title {
    font-size: 22px;
    font-weight: bold;
    margin-bottom: 15px;
}

.book-id {
    color: #777;
    font-size: 13px;
}

.price {
    font-size: 20px;
    font-weight: bold;
}

.condition {
    display: inline-block;
    background: #eee;
    padding: 5px 10px;
    border-radius: 5px;
}

.available {
    display: inline-block;
    background: #e8f5e9;
    color: #2e7d32;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
}

.view-btn {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 15px;
    background: #333;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.view-btn:hover {
    background: #555;
}

.search-again {
    display: inline-block;
    margin-top: 25px;
    padding: 10px 15px;
    background: #1565c0;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.search-again:hover {
    background: #0d47a1;
}

.no-results {
    text-align: center;
    background: white;
    padding: 40px;
    border-radius: 10px;
}

.no-results h2 {
    margin-bottom: 10px;
}

</style>

</head>

<body>

<div class="container">


    <h1>📚 Search Results</h1>


    <div class="search-info">

        Search results for:

        <strong class="search-keyword">
            "<%= keyword %>"
        </strong>

    </div>


    <%
        if (books == null || books.isEmpty()) {
    %>


        <div class="no-results">

            <h2>😕 No Books Found</h2>

            <p>
                We couldn't find any available books
                matching your search.
            </p>

            <p>
                Try searching for:
            </p>

            <p>
                <strong>
                    CS301
                </strong>
                ,
                <strong>
                    Java
                </strong>
                ,
                <strong>
                    Database
                </strong>
                ,
                <strong>
                    Data Structures
                </strong>
            </p>

            <a class="search-again"
               href="<%= request.getContextPath() %>/books/search.jsp">

                🔍 Search Again

            </a>

        </div>


    <%
        } else {
    %>


        <div class="book-grid">


        <%
            for (Book book : books) {
        %>


            <div class="book-card">


                <!-- Book ID -->

                <div class="book-id">

                    Book ID:
                    <%= book.getBookId() %>

                </div>


                <!-- Book Title -->

                <div class="book-title">

                    <%= book.getTitle() %>

                </div>


                <!-- Author -->

                <p>

                    <strong>Author:</strong>

                    <%= book.getAuthor() %>

                </p>


                <!-- Edition -->

                <p>

                    <strong>Edition:</strong>

                    <%= book.getEdition() %>

                </p>


                <!-- Publication Year -->

                <p>

                    <strong>Publication Year:</strong>

                    <%= book.getPublicationYear() %>

                </p>


                <!-- Condition -->

                <p>

                    <strong>Condition:</strong>

                    <span class="condition">

                        <%= book.getBookCondition() %>

                    </span>

                </p>


                <!-- Original Price -->

                <p>

                    <strong>Original Price:</strong>

                    ₹<%= book.getOriginalPrice() %>

                </p>


                <!-- Selling Price -->

                <p class="price">

                    Selling Price:

                    ₹<%= book.getSellingPrice() %>

                </p>


                <!-- Status -->

                <p>

                    <strong>Status:</strong>

                    <span class="available">

                        <%= book.getStatus() %>

                    </span>

                </p>


                <!-- View Details -->

                <a class="view-btn"
                   href="<%= request.getContextPath() %>/book-details?id=<%= book.getBookId() %>">

                    👁️ View Details

                </a>


            </div>


        <%
            }
        %>


        </div>


    <%
        }
    %>


    <!-- Back to Search -->

    <a class="search-again"
       href="<%= request.getContextPath() %>/books/search.jsp">

        ← Search Again

    </a>


</div>

</body>

</html>