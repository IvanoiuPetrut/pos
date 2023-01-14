package com.pos.pos;

import com.pos.pos.common.ProductDto;
import com.pos.pos.ejb.ProductsBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Inject
    ProductsBean productsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/addProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String stock = request.getParameter("stock");
        String type = request.getParameter("type");

        int stockInt = Integer.parseInt(stock);

        UUID uuid = UUID.randomUUID();
        Long barCode = uuid.getMostSignificantBits() & Long.MAX_VALUE;

        ProductDto productDto = new ProductDto(barCode, name, price, stockInt, description, type);
        productsBean.createProduct(productDto);
        response.sendRedirect(request.getContextPath() + "/Products");
    }
}
