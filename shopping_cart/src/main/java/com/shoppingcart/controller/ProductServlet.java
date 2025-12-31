package com.shoppingcart.controller;

import com.shoppingcart.dao.ProductDAO;
import com.shoppingcart.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<Product> products = productDAO.findAll();
        
        request.setAttribute("products", products);
        request.getRequestDispatcher("/webapp/index.jsp").forward(request, response);
    }
}