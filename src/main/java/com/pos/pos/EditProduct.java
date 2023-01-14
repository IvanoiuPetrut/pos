package com.pos.pos;

import com.pos.pos.common.ProductDto;
import com.pos.pos.ejb.ProductsBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "EditProduct", value = "/EditProduct")
public class EditProduct extends HttpServlet {
    @Inject
    ProductsBean productsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductDto> products = productsBean.findAllProducts();
        request.setAttribute("products", products);

        Long barCode = Long.parseLong(request.getParameter("barCode"));
        ProductDto productDto = productsBean.findProductByBarCode(barCode);
        request.setAttribute("product", productDto);

        request.getRequestDispatcher("/WEB-INF/pages/editProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String stock = request.getParameter("stock");
        String type = request.getParameter("type");

        int stockInt = Integer.parseInt(stock);

//        Long barCode = Long.parseLong(request.getParameter("barCode"));
        Long barCode = Long.parseLong(request.getParameter("barCode"));

//        Long barCode = 5177876058910510128L;

        ProductDto productDto = new ProductDto(barCode, name, price, stockInt, description, type);
        productsBean.updateProduct(productDto);
        response.sendRedirect(request.getContextPath() + "/Products");

    }
}
