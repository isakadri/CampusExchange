package com.campusbook.controller;

import java.io.IOException;
import java.util.List;

import com.campusbook.dao.BookDAO;
import com.campusbook.model.Book;
import com.campusbook.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-listings")
public class MyListingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        System.out.println("Logged-in User ID = " + user.getUserId());
        System.out.println("Logged-in User Name = " + user.getName());
        
       

        BookDAO bookDAO = new BookDAO();

        List<Book> books =
                bookDAO.getBooksBySeller(user.getUserId());
        System.out.println("Number of books found = " + books.size());

        request.setAttribute("books", books);

        request.getRequestDispatcher(
                "student/my-listings.jsp")
               .forward(request, response);
    }
}