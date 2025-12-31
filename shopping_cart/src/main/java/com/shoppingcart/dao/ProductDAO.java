package com.shoppingcart.dao;

import com.shoppingcart.model.Product;
import com.shoppingcart.util.HelloServlet;
import java.sql.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

public class ProductDAO {
    private static ConcurrentHashMap<Integer, Product> cache = new ConcurrentHashMap<>();

    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = HelloServlet.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Product p = new Product(
                    rs.getInt("id"), rs.getString("name"),
                    rs.getDouble("price"), rs.getString("description"),
                    rs.getString("image_url"), rs.getInt("stock")
                );
                products.add(p);
                cache.put(p.getId(), p);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return products;
    }

    public Product findById(int id) {
        if (cache.containsKey(id)) return cache.get(id);
        return null;
    }
}