<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="com.campusbook.model.Book" %>

<%
    Book book =
            (Book) request.getAttribute("book");

    if (book == null) {
        response.sendRedirect(
                request.getContextPath()
                + "/my-listings");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Book</title>

<style>

body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    margin: 0;
    padding: 40px;
}

.container {
    max-width: 700px;
    margin: auto;
}

.form-card {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
}

h1 {
    text-align: center;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 18px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 7px;
}

input,
select,
textarea {

    width: 100%;

    padding: 11px;

    box-sizing: border-box;

    border: 1px solid #ccc;

    border-radius: 6px;

    font-size: 15px;
}

textarea {
    min-height: 100px;
    resize: vertical;
}

button {

    width: 100%;

    padding: 12px;

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

    display: inline-block;

    margin-top: 20px;

    color: #333;

    text-decoration: none;
}

</style>

</head>

<body>

<div class="container">

<div class="form-card">

<h1>✏️ Edit Book</h1>

<form
    action="<%= request.getContextPath() %>/update-book"
    method="post">

    <!-- Book ID -->

    <input
        type="hidden"
        name="bookId"
        value="<%= book.getBookId() %>">


    <!-- Subject -->

    <div class="form-group">

        <label>Subject ID</label>

        <input
            type="number"
            name="subjectId"
            value="<%= book.getSubjectId() %>"
            required>

    </div>


    <!-- Title -->

    <div class="form-group">

        <label>Book Title</label>

        <input
            type="text"
            name="title"
            value="<%= book.getTitle() %>"
            required>

    </div>


    <!-- Author -->

    <div class="form-group">

        <label>Author</label>

        <input
            type="text"
            name="author"
            value="<%= book.getAuthor() %>"
            required>

    </div>


    <!-- Edition -->

    <div class="form-group">

        <label>Edition</label>

        <input
            type="text"
            name="edition"
            value="<%= book.getEdition() %>"
            required>

    </div>


    <!-- Publication Year -->

    <div class="form-group">

        <label>Publication Year</label>

        <input
            type="number"
            name="publicationYear"
            value="<%= book.getPublicationYear() %>"
            required>

    </div>


    <!-- Condition -->

    <div class="form-group">

        <label>Book Condition</label>

        <select name="bookCondition" required>

            <option value="NEW"
                <%= "NEW".equals(book.getBookCondition())
                    ? "selected" : "" %>>
                New
            </option>

            <option value="LIKE_NEW"
                <%= "LIKE_NEW".equals(book.getBookCondition())
                    ? "selected" : "" %>>
                Like New
            </option>

            <option value="GOOD"
                <%= "GOOD".equals(book.getBookCondition())
                    ? "selected" : "" %>>
                Good
            </option>

            <option value="FAIR"
                <%= "FAIR".equals(book.getBookCondition())
                    ? "selected" : "" %>>
                Fair
            </option>

            <option value="POOR"
                <%= "POOR".equals(book.getBookCondition())
                    ? "selected" : "" %>>
                Poor
            </option>

        </select>

    </div>


    <!-- Original Price -->

    <div class="form-group">

        <label>Original Price</label>

        <input
            type="number"
            step="0.01"
            name="originalPrice"
            value="<%= book.getOriginalPrice() %>"
            required>

    </div>


    <!-- Selling Price -->

    <div class="form-group">

        <label>Selling Price</label>

        <input
            type="number"
            step="0.01"
            name="sellingPrice"
            value="<%= book.getSellingPrice() %>"
            required>

    </div>


    <!-- Description -->

    <div class="form-group">

        <label>Description</label>

        <textarea
            name="description"
            required><%= book.getDescription() %></textarea>

    </div>


    <button type="submit">
        Update Book
    </button>

</form>


<a
    class="back"
    href="<%= request.getContextPath() %>/my-listings">

    ← Back to My Listings

</a>

</div>

</div>

</body>

</html>