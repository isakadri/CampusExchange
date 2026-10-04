package com.campusbook.model;

public class Buyback {

    private int buybackId;
    private int bookId;
    private double originalPrice;
    private String bookCondition;
    private int editionAge;
    private double estimatedValue;

    public Buyback() {
    }

    public Buyback(int bookId,
                   double originalPrice,
                   String bookCondition,
                   int editionAge,
                   double estimatedValue) {

        this.bookId = bookId;
        this.originalPrice = originalPrice;
        this.bookCondition = bookCondition;
        this.editionAge = editionAge;
        this.estimatedValue = estimatedValue;
    }

    public int getBuybackId() {
        return buybackId;
    }

    public void setBuybackId(int buybackId) {
        this.buybackId = buybackId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getBookCondition() {
        return bookCondition;
    }

    public void setBookCondition(String bookCondition) {
        this.bookCondition = bookCondition;
    }

    public int getEditionAge() {
        return editionAge;
    }

    public void setEditionAge(int editionAge) {
        this.editionAge = editionAge;
    }

    public double getEstimatedValue() {
        return estimatedValue;
    }

    public void setEstimatedValue(double estimatedValue) {
        this.estimatedValue = estimatedValue;
    }
}