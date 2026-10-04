package com.campusbook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.campusbook.model.Buyback;
import com.campusbook.util.DBConnection;

public class BuybackDAO {

    // Calculate estimated buyback value
    public double calculateValue(double originalPrice,
                                 String bookCondition,
                                 int editionAge) {

        double conditionPercentage;

        switch (bookCondition.toUpperCase()) {

            case "NEW":
                conditionPercentage = 0.80;
                break;

            case "LIKE_NEW":
                conditionPercentage = 0.70;
                break;

            case "GOOD":
                conditionPercentage = 0.60;
                break;

            case "FAIR":
                conditionPercentage = 0.45;
                break;

            case "POOR":
                conditionPercentage = 0.30;
                break;

            default:
                conditionPercentage = 0.30;
        }

        // Base value based on condition
        double value = originalPrice * conditionPercentage;

        // 5% reduction for every year
        double ageReduction = editionAge * 0.05;

        // Maximum reduction = 50%
        if (ageReduction > 0.50) {
            ageReduction = 0.50;
        }

        value = value * (1 - ageReduction);

        // Minimum value = 10% of original price
        double minimumValue = originalPrice * 0.10;

        if (value < minimumValue) {
            value = minimumValue;
        }

        return Math.round(value * 100.0) / 100.0;
    }


    // Save valuation in database
    public boolean saveBuyback(Buyback buyback) {

        String sql = """
            INSERT INTO buyback
            (book_id, original_price, book_condition,
             edition_age, estimated_value)
            VALUES (?, ?, ?, ?, ?)
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps =
                    connection.prepareStatement(sql)
        ) {

            ps.setInt(1, buyback.getBookId());
            ps.setDouble(2, buyback.getOriginalPrice());
            ps.setString(3, buyback.getBookCondition());
            ps.setInt(4, buyback.getEditionAge());
            ps.setDouble(5, buyback.getEstimatedValue());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }


    // Get latest valuation for a book
    public Buyback getLatestBuyback(int bookId) {

        String sql = """
            SELECT *
            FROM buyback
            WHERE book_id = ?
            ORDER BY created_at DESC
            LIMIT 1
            """;

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement ps =
                    connection.prepareStatement(sql)
        ) {

            ps.setInt(1, bookId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Buyback buyback = new Buyback();

                buyback.setBuybackId(
                        rs.getInt("buyback_id")
                );

                buyback.setBookId(
                        rs.getInt("book_id")
                );

                buyback.setOriginalPrice(
                        rs.getDouble("original_price")
                );

                buyback.setBookCondition(
                        rs.getString("book_condition")
                );

                buyback.setEditionAge(
                        rs.getInt("edition_age")
                );

                buyback.setEstimatedValue(
                        rs.getDouble("estimated_value")
                );

                return buyback;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}