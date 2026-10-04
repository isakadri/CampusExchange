<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="com.campusbook.model.Book" %>

<%
    Book book = (Book) request.getAttribute("book");

    // If no book was selected
    if (book == null) {
        response.sendRedirect(
            request.getContextPath() + "/my-listings"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Book Buyback Valuation</title>

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
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

input,
select {
    width: 100%;
    padding: 12px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
}

button {
    width: 100%;
    padding: 13px;
    border: none;
    border-radius: 6px;
    background: #333;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #555;
}

.back {
    display: block;
    margin-top: 20px;
    text-align: center;
    color: #333;
    text-decoration: none;
}

.back:hover {
    text-decoration: underline;
}

.info {
    background: #f1f1f1;
    padding: 15px;
    border-radius: 6px;
    margin-bottom: 25px;
    line-height: 1.5;
}

.book-info {
    background: #e8f1ff;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 25px;
}

.book-info p {
    margin: 8px 0;
}

</style>

</head>

<body>

<div class="container">

    <div class="card">

        <h1>💰 Book Buyback Valuation</h1>


        <!-- Information -->

        <div class="info">

            <strong>How does it work?</strong>

            <p>
                Your book details are automatically loaded from
                your listing. Select the book condition and enter
                the edition age to calculate an estimated
                buyback value.
            </p>

        </div>


        <!-- Selected Book Information -->

        <div class="book-info">

            <p>
                <strong>Book:</strong>
                <%= book.getTitle() %>
            </p>

            <p>
                <strong>Book ID:</strong>
                <%= book.getBookId() %>
            </p>

            <p>
                <strong>Original Price:</strong>
                ₹<%= book.getOriginalPrice() %>
            </p>

        </div>


        <!-- Buyback Form -->

        <form action="<%= request.getContextPath() %>/buyback"
              method="post">


            <!-- Hidden Book ID -->

            <input type="hidden"
                   name="bookId"
                   value="<%= book.getBookId() %>">


            <!-- Hidden Original Price -->

            <input type="hidden"
                   name="originalPrice"
                   value="<%= book.getOriginalPrice() %>">


            <!-- Book Condition -->

            <div class="form-group">

                <label for="bookCondition">
                    Book Condition
                </label>

                <select
                    id="bookCondition"
                    name="bookCondition"
                    required>

                    <option value="">
                        -- Select Condition --
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

            </div>


            <!-- Edition Age -->

            <div class="form-group">

                <label for="editionAge">
                    Edition Age (Years)
                </label>

                <input
                    type="number"
                    id="editionAge"
                    name="editionAge"
                    placeholder="Example: 2"
                    min="0"
                    required>

            </div>


            <!-- Submit -->

            <button type="submit">
                Calculate Buyback Value
            </button>

        </form>


        <!-- Back -->

        <a class="back"
           href="<%= request.getContextPath() %>/my-listings">

            ← Back to My Listings

        </a>

    </div>

</div>

</body>

</html>