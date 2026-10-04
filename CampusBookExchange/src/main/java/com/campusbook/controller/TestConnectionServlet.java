package com.campusbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import com.campusbook.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test-db")
public class TestConnectionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Connection connection = DBConnection.getConnection();

            if (connection != null) {
                out.println("<h1>Database Connected Successfully!</h1>");
                connection.close();
            } else {
                out.println("<h1>Database Connection Failed!</h1>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            out.println("<h1>Error!</h1>");
            out.println("<p>" + e.getMessage() + "</p>");
        }
    }
}