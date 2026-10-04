package com.campusbook.model;

import java.sql.Timestamp;

public class Reservation {

    private int reservationId;
    private int bookId;
    private int buyerId;

    private Timestamp reservationDate;

    private String status;

    private String bookTitle;
    private String author;

    private double sellingPrice;

    // Buyer information
    private String buyerName;
    private String buyerEmail;
    private String buyerPhone;


    // =========================
    // Reservation ID
    // =========================

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }


    // =========================
    // Book ID
    // =========================

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }


    // =========================
    // Buyer ID
    // =========================

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }


    // =========================
    // Reservation Date
    // =========================

    public Timestamp getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Timestamp reservationDate) {
        this.reservationDate = reservationDate;
    }


    // =========================
    // Status
    // =========================

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    // =========================
    // Book Title
    // =========================

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }


    // =========================
    // Author
    // =========================

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }


    // =========================
    // Selling Price
    // =========================

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }


    // =========================
    // Buyer Name
    // =========================

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }


    // =========================
    // Buyer Email
    // =========================

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }


    // =========================
    // Buyer Phone
    // =========================

    public String getBuyerPhone() {
        return buyerPhone;
    }

    public void setBuyerPhone(String buyerPhone) {
        this.buyerPhone = buyerPhone;
    }
}