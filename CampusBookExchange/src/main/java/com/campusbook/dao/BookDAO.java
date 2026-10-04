package com.campusbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusbook.model.Book;
import com.campusbook.util.DBConnection;

public class BookDAO {

    // =========================
    // ADD BOOK
    // =========================

    public boolean addBook(Book book) {

        String sql = """
                INSERT INTO books
                (seller_id, subject_id, title, author, edition,
                 publication_year, book_condition, original_price,
                 selling_price, description, status)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, book.getSellerId());
            ps.setInt(2, book.getSubjectId());
            ps.setString(3, book.getTitle());
            ps.setString(4, book.getAuthor());
            ps.setString(5, book.getEdition());
            ps.setInt(6, book.getPublicationYear());
            ps.setString(7, book.getBookCondition());
            ps.setDouble(8, book.getOriginalPrice());
            ps.setDouble(9, book.getSellingPrice());
            ps.setString(10, book.getDescription());
            ps.setString(11, "AVAILABLE");

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    // =========================
    // GET BOOKS BY SELLER
    // =========================

    public List<Book> getBooksBySeller(int sellerId) {

        List<Book> books = new ArrayList<>();

        String sql = """
                SELECT *
                FROM books
                WHERE seller_id = ?
                ORDER BY created_at DESC
                """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, sellerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Book book = new Book();

                book.setBookId(rs.getInt("book_id"));
                book.setSellerId(rs.getInt("seller_id"));
                book.setSubjectId(rs.getInt("subject_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setEdition(rs.getString("edition"));

                book.setPublicationYear(
                        rs.getInt("publication_year"));

                book.setBookCondition(
                        rs.getString("book_condition"));

                book.setOriginalPrice(
                        rs.getDouble("original_price"));

                book.setSellingPrice(
                        rs.getDouble("selling_price"));

                book.setDescription(
                        rs.getString("description"));

                book.setStatus(
                        rs.getString("status"));

                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }


    // =========================
    // SEARCH BOOKS
    // =========================

    public List<Book> searchBooks(String keyword) {

        List<Book> books = new ArrayList<>();

        String sql = """
            SELECT b.*
            FROM books b
            JOIN subjects s
                ON b.subject_id = s.subject_id
            WHERE b.status = 'AVAILABLE'
            AND (
                b.title LIKE ?
                OR b.author LIKE ?
                OR b.edition LIKE ?
                OR s.subject_code LIKE ?
                OR s.subject_name LIKE ?
            )
            ORDER BY b.created_at DESC
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            String search = "%" + keyword.trim() + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);
            ps.setString(4, search);
            ps.setString(5, search);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Book book = new Book();

                book.setBookId(
                        rs.getInt("book_id"));

                book.setSellerId(
                        rs.getInt("seller_id"));

                book.setSubjectId(
                        rs.getInt("subject_id"));

                book.setTitle(
                        rs.getString("title"));

                book.setAuthor(
                        rs.getString("author"));

                book.setEdition(
                        rs.getString("edition"));

                book.setPublicationYear(
                        rs.getInt("publication_year"));

                book.setBookCondition(
                        rs.getString("book_condition"));

                book.setOriginalPrice(
                        rs.getDouble("original_price"));

                book.setSellingPrice(
                        rs.getDouble("selling_price"));

                book.setDescription(
                        rs.getString("description"));

                book.setStatus(
                        rs.getString("status"));

                books.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }


    // =========================
    // GET BOOK BY ID
    // =========================

    public Book getBookById(int bookId) {

        Book book = null;

        String sql = """
            SELECT b.*
            FROM books b
            WHERE b.book_id = ?
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, bookId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                book = new Book();

                book.setBookId(rs.getInt("book_id"));
                book.setSellerId(rs.getInt("seller_id"));
                book.setSubjectId(rs.getInt("subject_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setEdition(rs.getString("edition"));

                book.setPublicationYear(
                        rs.getInt("publication_year"));

                book.setBookCondition(
                        rs.getString("book_condition"));

                book.setOriginalPrice(
                        rs.getDouble("original_price"));

                book.setSellingPrice(
                        rs.getDouble("selling_price"));

                book.setDescription(
                        rs.getString("description"));

                book.setStatus(
                        rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }


    // =========================
    // GET BOOK BY ID FOR SELLER
    // =========================

    public Book getBookByIdForSeller(int bookId, int sellerId) {

        Book book = null;

        String sql = """
            SELECT *
            FROM books
            WHERE book_id = ?
            AND seller_id = ?
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, bookId);
            ps.setInt(2, sellerId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                book = new Book();

                book.setBookId(rs.getInt("book_id"));
                book.setSellerId(rs.getInt("seller_id"));
                book.setSubjectId(rs.getInt("subject_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setEdition(rs.getString("edition"));

                book.setPublicationYear(
                        rs.getInt("publication_year"));

                book.setBookCondition(
                        rs.getString("book_condition"));

                book.setOriginalPrice(
                        rs.getDouble("original_price"));

                book.setSellingPrice(
                        rs.getDouble("selling_price"));

                book.setDescription(
                        rs.getString("description"));

                book.setStatus(
                        rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }


    // =========================
    // UPDATE BOOK
    // =========================

    public boolean updateBook(Book book) {

        String sql = """
            UPDATE books
            SET subject_id = ?,
                title = ?,
                author = ?,
                edition = ?,
                publication_year = ?,
                book_condition = ?,
                original_price = ?,
                selling_price = ?,
                description = ?
            WHERE book_id = ?
            AND seller_id = ?
            AND status = 'AVAILABLE'
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps =
                    connection.prepareStatement(sql)
        ) {

            ps.setInt(1, book.getSubjectId());
            ps.setString(2, book.getTitle());
            ps.setString(3, book.getAuthor());
            ps.setString(4, book.getEdition());
            ps.setInt(5, book.getPublicationYear());
            ps.setString(6, book.getBookCondition());
            ps.setDouble(7, book.getOriginalPrice());
            ps.setDouble(8, book.getSellingPrice());
            ps.setString(9, book.getDescription());
            ps.setInt(10, book.getBookId());
            ps.setInt(11, book.getSellerId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================
    // DELETE BOOK
    // =========================

    public boolean deleteBook(int bookId, int sellerId) {

        String sql = """
            DELETE FROM books
            WHERE book_id = ?
            AND seller_id = ?
            AND status = 'AVAILABLE'
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {

            ps.setInt(1, bookId);
            ps.setInt(2, sellerId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}