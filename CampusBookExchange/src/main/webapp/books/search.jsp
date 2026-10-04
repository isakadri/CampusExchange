<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Search Books</title>

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
    background: white;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1);
}

h1 {
    text-align: center;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #666;
    margin-bottom: 30px;
}

.search-box {
    display: flex;
    gap: 10px;
}

input {
    flex: 1;
    padding: 13px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
    outline: none;
}

input:focus {
    border-color: #333;
}

button {
    padding: 13px 25px;
    font-size: 16px;
    cursor: pointer;
    background: #333;
    color: white;
    border: none;
    border-radius: 6px;
}

button:hover {
    background: #555;
}

.examples {
    margin-top: 25px;
    padding: 15px;
    background: #f1f1f1;
    border-radius: 8px;
    line-height: 1.7;
}

.back {
    display: block;
    margin-top: 25px;
    text-align: center;
    color: #333;
    text-decoration: none;
}

.back:hover {
    text-decoration: underline;
}

@media (max-width: 600px) {

    body {
        padding: 20px;
    }

    .container {
        padding: 25px;
    }

    .search-box {
        flex-direction: column;
    }

    button {
        width: 100%;
    }
}

</style>

</head>

<body>

<div class="container">

    <h1>📚 Search Books</h1>

    <p class="subtitle">
        Find textbooks by title, author, subject code,
        subject name, or edition.
    </p>


    <form action="<%= request.getContextPath() %>/search-books"
          method="get">

        <div class="search-box">

            <input
                type="text"
                name="keyword"
                placeholder="Example: CS301, Java, Database..."
                autocomplete="off"
                required>

            <button type="submit">
                🔍 Search
            </button>

        </div>

    </form>


    <div class="examples">

        <strong>You can search by:</strong>

        <br>

        📌 Subject Code:
        <strong>CS301</strong>

        <br>

        📌 Subject Name:
        <strong>Data Structures</strong>

        <br>

        📌 Book Title:
        <strong>Java</strong>

        <br>

        📌 Author:
        <strong>Herbert Schildt</strong>

        <br>

        📌 Edition:
        <strong>5th</strong>

    </div>


    <a class="back"
       href="<%= request.getContextPath() %>/student/dashboard.jsp">

        ← Back to Dashboard

    </a>

</div>

</body>

</html>