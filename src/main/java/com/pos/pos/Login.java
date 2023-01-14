package com.pos.pos;

import com.pos.pos.common.ProductDto;
import com.pos.pos.ejb.ProductsBean;
import com.pos.pos.entities.Product;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {

    @Inject
    ProductsBean productsBean;



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("message", "Username or password incorrect");
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }
}
