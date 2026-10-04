


📚 CampusBook Exchange
A college-focused second-hand textbook marketplace built with Java Servlets, JSP, JDBC, and MySQL.

CampusBook Exchange is a web-based marketplace designed specifically for college students to buy, sell, search, reserve, and manage second-hand academic textbooks.

Students often purchase expensive textbooks for a semester and then struggle to resell them. Existing platforms and messaging groups are either too broad, unstructured, or do not provide college-specific searching. CampusBook Exchange solves this problem by organizing books around departments, semesters, subject codes, editions, authors, and book conditions.

🚀 Live Project Flow
Register
   ↓
Login
   ↓
Browse / Search Books
   ↓
View Book Details
   ↓
Reserve Book
   ↓
Seller Receives Request
   ↓
Accept / Reject
   ↓
Accepted → SOLD
Rejected → AVAILABLE
✨ Key Features
👤 User Authentication
Student registration and login

BCrypt password hashing

Session-based authentication

Logout functionality

Authentication filter for protected pages

📚 Book Marketplace
Add second-hand textbooks

Edit your own listings

Delete available listings

View personal listings

Book condition tracking

Original price and selling price

Book status tracking

🔎 Smart Book Search
Search books using:

Book title

Author

Edition

Subject code

Subject name

This makes the platform more useful for students than a generic marketplace.

📌 Reservation System
Complete buyer-seller reservation workflow:

Status	Meaning
PENDING	Buyer requested the book
ACCEPTED	Seller accepted the request
REJECTED	Seller rejected the request
CANCELLED	Buyer cancelled the request
SOLD	Book has been sold
🏷️ Buyback Valuation
The project includes a simple estimated buyback calculator based on:

Original price

Book condition

Edition age

Condition-based valuation:

NEW       → 80%
LIKE_NEW  → 70%
GOOD      → 60%
FAIR      → 45%
POOR      → 30%
The estimated value is reduced according to edition age, with a minimum valuation rule.

Note: Buyback values are project estimates and are not intended to represent guaranteed market prices.

🎨 Modern UI
Responsive interface

Modern dashboard

Profile page

Listing management

Reservation management

Search interface

Dark mode support

Mobile-friendly layouts

Status badges and cards

🛠️ Technology Stack
Technology	Purpose
☕ Java	Backend programming
🌐 JSP	Dynamic web pages
⚙️ Servlets	Request handling
🗄️ JDBC	Database connectivity
🐬 MySQL	Relational database
🎨 HTML5	Page structure
🎨 CSS3	UI styling
🔐 jBCrypt	Password hashing
🖥️ Apache Tomcat 10.1	Application server
🏗️ Architecture
CampusBook Exchange follows an MVC-style layered architecture.

                    ┌─────────────────────┐
                    │      Browser        │
                    │   HTML / JSP / CSS  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Servlets       │
                    │   Controller Layer   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │        DAO          │
                    │   Database Logic    │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │        JDBC         │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │        MySQL        │
                    │     Database        │
                    └─────────────────────┘
Application Layers
JSP
 ↓
Servlet
 ↓
DAO
 ↓
JDBC
 ↓
MySQL
The project separates presentation, request handling, business/data access logic, models, and database connectivity to keep the application maintainable.

📂 Project Structure
CampusBookExchange/
│
├── src/main/java/com/campusbook/
│   │
│   ├── controller/
│   │   ├── TestConnectionServlet.java
│   │   ├── LoginServlet.java
│   │   ├── RegisterServlet.java
│   │   ├── AddBookServlet.java
│   │   ├── MyListingsServlet.java
│   │   ├── SearchBookServlet.java
│   │   ├── BookDetailsServlet.java
│   │   ├── ReserveBookServlet.java
│   │   ├── MyReservationsServlet.java
│   │   ├── CancelReservationServlet.java
│   │   ├── SellerReservationServlet.java
│   │   ├── ManageReservationServlet.java
│   │   ├── EditBookServlet.java
│   │   ├── UpdateBookServlet.java
│   │   ├── DeleteBookServlet.java
│   │   ├── BuybackServlet.java
│   │   └── LogoutServlet.java
│   │
│   ├── dao/
│   │   ├── UserDAO.java
│   │   ├── BookDAO.java
│   │   ├── ReservationDAO.java
│   │   └── BuybackDAO.java
│   │
│   ├── model/
│   │   ├── User.java
│   │   ├── Book.java
│   │   ├── Reservation.java
│   │   └── Buyback.java
│   │
│   ├── util/
│   │   ├── DBConnection.java
│   │   └── PasswordUtil.java
│   │
│   └── filter/
│       └── AuthenticationFilter.java
│
└── src/main/webapp/
    │
    ├── index.jsp
    ├── login.jsp
    ├── register.jsp
    ├── css/
    ├── js/
    ├── images/
    │
    ├── student/
    │   ├── dashboard.jsp
    │   ├── add-book.jsp
    │   ├── edit-book.jsp
    │   ├── my-listings.jsp
    │   ├── my-reservations.jsp
    │   ├── profile.jsp
    │   ├── buyback.jsp
    │   └── buyback-result.jsp
    │
    ├── books/
    │   ├── search.jsp
    │   ├── book-details.jsp
    │   └── search-results.jsp
    │
    └── error/
        ├── 404.jsp
        └── 500.jsp
🗄️ Database Design
The application uses MySQL with relational tables for users, academic subjects, books, reservations, and buyback calculations.

users
  │
  ├───────────────┐
  │               │
  ▼               ▼
books         reservations
  │
  ▼
subjects
  │
  ▼
departments

books
  │
  ▼
buyback
Main Tables
users

departments

subjects

books

reservations

buyback

Foreign keys are used to maintain relationships between users, books, subjects, and reservations.

🔐 Security
The project implements several basic security practices:

Password Hashing
Passwords are never intentionally stored as plain text during registration.

String hashedPassword =
        PasswordUtil.hashPassword(password);
BCrypt is used for password hashing and verification.

Authentication Filter
Protected pages are secured using a Servlet Filter.

Request
   ↓
AuthenticationFilter
   ↓
Logged In?
  ↙     ↘
 YES     NO
 ↓       ↓
Page    Login
Session Authentication
A logged-in user is stored in the HTTP session and protected routes verify the session before allowing access.

📸 Screenshots
Add your actual application screenshots inside the screenshots/ folder using the filenames below.

🏠 Home Page


🔐 Login


📝 Registration


📊 Student Dashboard


📚 Browse Books


📖 Book Details


➕ Add Book


📋 My Listings


📌 Reservations


👤 Profile


🌙 Dark Mode


⚙️ Installation & Setup
1. Clone the Repository
git clone https://github.com/YOUR_USERNAME/CampusBookExchange.git
cd CampusBookExchange
2. Create the MySQL Database
Open MySQL and run:

CREATE DATABASE campus_book_exchange;
Then select it:

USE campus_book_exchange;
Create the required tables:

users
departments
subjects
books
reservations
buyback
Add the project seed data for departments and subjects.

3. Configure Database Connection
Update your database configuration in:

src/main/java/com/campusbook/util/DBConnection.java
Example:

private static final String URL =
        "jdbc:mysql://localhost:3306/campus_book_exchange";

private static final String USER =
        "root";

private static final String PASSWORD =
        "YOUR_MYSQL_PASSWORD";
Replace the password with your local MySQL password.

4. Add Required Libraries
Make sure the project contains:

MySQL Connector/J

jBCrypt

Jakarta Servlet API compatible with Tomcat 10.1

5. Configure Apache Tomcat
Recommended environment:

Apache Tomcat 10.1.x
Java 21+
MySQL 8.x
Add the project to Tomcat from Eclipse/IDE and start the server.

6. Open the Application
Example:

http://localhost:8080/CampusBookExchange/
🧪 Main Test Flow
Use this flow to test the complete application:

1. Register Student
        ↓
2. Login
        ↓
3. Add Book
        ↓
4. Search Book
        ↓
5. Open Book Details
        ↓
6. Reserve Book
        ↓
7. Login as Seller
        ↓
8. Open Requests
        ↓
9. Accept / Reject Reservation
        ↓
10. Verify Book Status
📌 Important Functional Modules
Student Module
Registration
Login
Dashboard
Profile
Book Listings
Book Search
Book Details
Reservations
Buyback
Logout
Seller Module
My Listings
Incoming Reservation Requests
Buyer Information
Accept Reservation
Reject Reservation
Book Status Management
💡 Problem Statement
College students frequently purchase textbooks that are required only for one semester. After completing the course, these books often remain unused because students have difficulty finding relevant buyers.

Existing communication channels such as WhatsApp groups can become difficult to search and manage, while general marketplaces are not specifically designed around academic requirements.

CampusBook Exchange provides a centralized platform where students can find books based on their department, semester, subject code, title, author, and edition.

🎯 Project Objectives
Create a centralized textbook marketplace for students.

Make academic books easier to discover.

Reduce the cost of textbooks through second-hand sales.

Provide a structured reservation process.

Allow students to manage their own listings.

Provide an estimated buyback value.

Practice Java web development using Servlets, JSP, JDBC, and MySQL.

Implement authentication and role-aware application behavior.

🔮 Future Improvements
The project can be extended with:

💳 Online payment integration

📍 Campus/location-based listings

⭐ Seller ratings and reviews

💬 Buyer-seller messaging

🔔 Email notifications

📱 Android/mobile application

🖼️ Book image upload

🔎 Advanced filters

❤️ Wishlist/favorites

📈 Admin analytics dashboard

🧑‍💼 Admin user management

📦 Order and delivery tracking

🤖 AI-powered book recommendations

📊 What I Learned
Through this project, I practiced:

Java web application development

JSP and Servlet lifecycle

HTTP GET/POST request handling

MVC architecture

JDBC database connectivity

SQL joins and foreign keys

CRUD operations

Session management

Servlet Filters

Password hashing with BCrypt

Relational database design

Tomcat deployment

Responsive frontend development

Building complete buyer/seller workflows

👨‍💻 Author
Isa Abdul Kadri

B.Tech Computer Science Engineering
Sandipani Technical Campus

Technologies
Java JSP Servlets JDBC MySQL HTML CSS Tomcat

⭐ If you find this project useful
Give the repository a ⭐ and feel free to explore the code.

📄 License
This project is developed for educational and portfolio purposes.
