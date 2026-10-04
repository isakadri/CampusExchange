package com.campusbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.campusbook.model.Reservation;
import com.campusbook.util.DBConnection;

public class ReservationDAO {

    // =========================================================
    // 1. RESERVE BOOK
    // =========================================================

    public boolean reserveBook(int bookId, int buyerId) {

        Connection connection = null;

        try {

            connection = DBConnection.getConnection();
            connection.setAutoCommit(false);

            // Check book
            String checkSql = """
                SELECT seller_id, status
                FROM books
                WHERE book_id = ?
                FOR UPDATE
                """;

            PreparedStatement checkPs =
                    connection.prepareStatement(checkSql);

            checkPs.setInt(1, bookId);

            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                connection.rollback();
                return false;
            }

            int sellerId = rs.getInt("seller_id");
            String status = rs.getString("status");

            // Seller cannot reserve own book
            if (sellerId == buyerId) {
                connection.rollback();
                return false;
            }

            // Book must be available
            if (!"AVAILABLE".equals(status)) {
                connection.rollback();
                return false;
            }

            // Insert reservation
            String insertSql = """
                INSERT INTO reservations
                (book_id, buyer_id, status)
                VALUES (?, ?, 'PENDING')
                """;

            PreparedStatement insertPs =
                    connection.prepareStatement(insertSql);

            insertPs.setInt(1, bookId);
            insertPs.setInt(2, buyerId);

            int rows = insertPs.executeUpdate();

            if (rows == 0) {
                connection.rollback();
                return false;
            }

            // Change book status
            String updateSql = """
                UPDATE books
                SET status = 'RESERVED'
                WHERE book_id = ?
                AND status = 'AVAILABLE'
                """;

            PreparedStatement updatePs =
                    connection.prepareStatement(updateSql);

            updatePs.setInt(1, bookId);

            int updated = updatePs.executeUpdate();

            if (updated == 0) {
                connection.rollback();
                return false;
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (Exception rollbackException) {
                rollbackException.printStackTrace();
            }

            return false;

        } finally {

            try {

                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    // =========================================================
    // 2. GET RESERVATIONS BY BUYER
    // =========================================================

    public List<Reservation> getReservationsByBuyer(int buyerId) {

        List<Reservation> reservations = new ArrayList<>();

        String sql = """
            SELECT
                r.reservation_id,
                r.book_id,
                r.buyer_id,
                r.reservation_date,
                r.status,
                b.title,
                b.author,
                b.selling_price
            FROM reservations r
            JOIN books b
                ON r.book_id = b.book_id
            WHERE r.buyer_id = ?
            ORDER BY r.reservation_date DESC
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps =
                    connection.prepareStatement(sql)
        ) {

            ps.setInt(1, buyerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Reservation reservation =
                        new Reservation();

                reservation.setReservationId(
                        rs.getInt("reservation_id"));

                reservation.setBookId(
                        rs.getInt("book_id"));

                reservation.setBuyerId(
                        rs.getInt("buyer_id"));

                reservation.setReservationDate(
                        rs.getTimestamp("reservation_date"));

                reservation.setStatus(
                        rs.getString("status"));

                reservation.setBookTitle(
                        rs.getString("title"));

                reservation.setAuthor(
                        rs.getString("author"));

                reservation.setSellingPrice(
                        rs.getDouble("selling_price"));

                reservations.add(reservation);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return reservations;
    }


    // =========================================================
    // 3. CANCEL RESERVATION
    // =========================================================

    public boolean cancelReservation(
            int reservationId,
            int buyerId) {

        Connection connection = null;

        try {

            connection = DBConnection.getConnection();
            connection.setAutoCommit(false);

            // Check reservation
            String checkSql = """
                SELECT book_id, status
                FROM reservations
                WHERE reservation_id = ?
                AND buyer_id = ?
                FOR UPDATE
                """;

            PreparedStatement checkPs =
                    connection.prepareStatement(checkSql);

            checkPs.setInt(1, reservationId);
            checkPs.setInt(2, buyerId);

            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                connection.rollback();
                return false;
            }

            int bookId = rs.getInt("book_id");

            String status =
                    rs.getString("status");

            // Only pending reservation can be cancelled
            if (!"PENDING".equals(status)) {
                connection.rollback();
                return false;
            }

            // Cancel reservation
            String updateReservationSql = """
                UPDATE reservations
                SET status = 'CANCELLED'
                WHERE reservation_id = ?
                AND buyer_id = ?
                """;

            PreparedStatement reservationPs =
                    connection.prepareStatement(
                            updateReservationSql);

            reservationPs.setInt(1, reservationId);
            reservationPs.setInt(2, buyerId);

            int reservationUpdated =
                    reservationPs.executeUpdate();

            if (reservationUpdated == 0) {
                connection.rollback();
                return false;
            }

            // Make book available again
            String updateBookSql = """
                UPDATE books
                SET status = 'AVAILABLE'
                WHERE book_id = ?
                AND status = 'RESERVED'
                """;

            PreparedStatement bookPs =
                    connection.prepareStatement(updateBookSql);

            bookPs.setInt(1, bookId);

            int bookUpdated =
                    bookPs.executeUpdate();

            if (bookUpdated == 0) {
                connection.rollback();
                return false;
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (Exception rollbackException) {
                rollbackException.printStackTrace();
            }

            return false;

        } finally {

            try {

                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    // =========================================================
    // 4. GET RESERVATIONS BY SELLER
    // =========================================================

    public List<Reservation> getReservationsBySeller(
            int sellerId) {

        List<Reservation> reservations =
                new ArrayList<>();

        String sql = """
            SELECT
                r.reservation_id,
                r.book_id,
                r.buyer_id,
                r.reservation_date,
                r.status,
                b.title,
                b.author,
                b.selling_price,
                u.name AS buyer_name,
                u.email AS buyer_email,
                u.phone AS buyer_phone
            FROM reservations r
            INNER JOIN books b
                ON r.book_id = b.book_id
            INNER JOIN users u
                ON r.buyer_id = u.user_id
            WHERE b.seller_id = ?
            ORDER BY r.reservation_date DESC
            """;

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    connection.prepareStatement(sql)
        ) {

            ps.setInt(1, sellerId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Reservation reservation =
                        new Reservation();

                reservation.setReservationId(
                        rs.getInt("reservation_id"));

                reservation.setBookId(
                        rs.getInt("book_id"));

                reservation.setBuyerId(
                        rs.getInt("buyer_id"));

                reservation.setReservationDate(
                        rs.getTimestamp("reservation_date"));

                reservation.setStatus(
                        rs.getString("status"));

                reservation.setBookTitle(
                        rs.getString("title"));

                reservation.setAuthor(
                        rs.getString("author"));

                reservation.setSellingPrice(
                        rs.getDouble("selling_price"));

                reservation.setBuyerName(
                        rs.getString("buyer_name"));

                reservation.setBuyerEmail(
                        rs.getString("buyer_email"));

                reservation.setBuyerPhone(
                        rs.getString("buyer_phone"));

                reservations.add(reservation);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return reservations;
    }


    // =========================================================
    // 5. ACCEPT RESERVATION
    // =========================================================

    public boolean acceptReservation(
            int reservationId,
            int sellerId) {

        Connection connection = null;

        try {

            connection = DBConnection.getConnection();
            connection.setAutoCommit(false);

            // Check reservation and seller ownership
            String checkSql = """
                SELECT
                    r.book_id,
                    r.status
                FROM reservations r
                JOIN books b
                    ON r.book_id = b.book_id
                WHERE r.reservation_id = ?
                AND b.seller_id = ?
                FOR UPDATE
                """;

            PreparedStatement checkPs =
                    connection.prepareStatement(checkSql);

            checkPs.setInt(1, reservationId);
            checkPs.setInt(2, sellerId);

            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                connection.rollback();
                return false;
            }

            int bookId =
                    rs.getInt("book_id");

            String reservationStatus =
                    rs.getString("status");

            // Reservation must be pending
            if (!"PENDING".equals(reservationStatus)) {
                connection.rollback();
                return false;
            }

            // Update reservation
            String reservationSql = """
                UPDATE reservations
                SET status = 'ACCEPTED'
                WHERE reservation_id = ?
                """;

            PreparedStatement reservationPs =
                    connection.prepareStatement(
                            reservationSql);

            reservationPs.setInt(1, reservationId);

            int reservationUpdated =
                    reservationPs.executeUpdate();

            if (reservationUpdated == 0) {
                connection.rollback();
                return false;
            }

            // Mark book as sold
            String bookSql = """
                UPDATE books
                SET status = 'SOLD'
                WHERE book_id = ?
                AND status = 'RESERVED'
                """;

            PreparedStatement bookPs =
                    connection.prepareStatement(bookSql);

            bookPs.setInt(1, bookId);

            int bookUpdated =
                    bookPs.executeUpdate();

            if (bookUpdated == 0) {
                connection.rollback();
                return false;
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (Exception rollbackException) {
                rollbackException.printStackTrace();
            }

            return false;

        } finally {

            try {

                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    // =========================================================
    // 6. REJECT RESERVATION
    // =========================================================

    public boolean rejectReservation(
            int reservationId,
            int sellerId) {

        Connection connection = null;

        try {

            connection = DBConnection.getConnection();
            connection.setAutoCommit(false);

            // Check reservation and seller ownership
            String checkSql = """
                SELECT
                    r.book_id,
                    r.status
                FROM reservations r
                JOIN books b
                    ON r.book_id = b.book_id
                WHERE r.reservation_id = ?
                AND b.seller_id = ?
                FOR UPDATE
                """;

            PreparedStatement checkPs =
                    connection.prepareStatement(checkSql);

            checkPs.setInt(1, reservationId);
            checkPs.setInt(2, sellerId);

            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                connection.rollback();
                return false;
            }

            int bookId =
                    rs.getInt("book_id");

            String reservationStatus =
                    rs.getString("status");

            // Reservation must be pending
            if (!"PENDING".equals(reservationStatus)) {
                connection.rollback();
                return false;
            }

            // Update reservation
            String reservationSql = """
                UPDATE reservations
                SET status = 'REJECTED'
                WHERE reservation_id = ?
                """;

            PreparedStatement reservationPs =
                    connection.prepareStatement(
                            reservationSql);

            reservationPs.setInt(1, reservationId);

            int reservationUpdated =
                    reservationPs.executeUpdate();

            if (reservationUpdated == 0) {
                connection.rollback();
                return false;
            }

            // Make book available again
            String bookSql = """
                UPDATE books
                SET status = 'AVAILABLE'
                WHERE book_id = ?
                AND status = 'RESERVED'
                """;

            PreparedStatement bookPs =
                    connection.prepareStatement(bookSql);

            bookPs.setInt(1, bookId);

            int bookUpdated =
                    bookPs.executeUpdate();

            if (bookUpdated == 0) {
                connection.rollback();
                return false;
            }

            connection.commit();

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            try {
                if (connection != null) {
                    connection.rollback();
                }
            } catch (Exception rollbackException) {
                rollbackException.printStackTrace();
            }

            return false;

        } finally {

            try {

                if (connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}