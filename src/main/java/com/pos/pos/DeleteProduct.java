package com.pos.pos;

import com.pos.pos.common.ProductDto;
import com.pos.pos.ejb.ProductsBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteProduct", value = "/DeleteProduct")
public class DeleteProduct extends HttpServlet {
    @Inject
    ProductsBean productsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long barCode = Long.parseLong(request.getParameter("barCode"));
        ProductDto productDto = productsBean.findProductByBarCode(barCode);

        productsBean.deleteProduct(productDto);

        List<ProductDto> products = productsBean.findAllProducts();
        request.setAttribute("products", products);

        request.getRequestDispatcher("/WEB-INF/pages/products.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
