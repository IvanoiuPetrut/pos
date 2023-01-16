package com.pos.pos;


import com.pos.pos.common.OrderDetailsDto;
import com.pos.pos.common.UserDto;
import com.pos.pos.ejb.OrderDetailsBean;
import com.pos.pos.ejb.UserBean;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


@WebServlet(name = "Checkout", value = "/Checkout")
public class Checkout extends HttpServlet {
    @Inject
    UserBean usersBean;
    @Inject
    OrderDetailsBean orderDetailsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("src/main/webapp/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String price = request.getParameter("price");
        String date = request.getParameter("date");
        boolean refounded = Boolean.parseBoolean(request.getParameter("refounded"));
        String paymentType = request.getParameter("paymentType");
        String userName = request.getUserPrincipal().getName();
        UserDto userDto = usersBean.findUserByUsername(userName);

        OrderDetailsDto orderDetailsDto = new OrderDetailsDto(userDto.getId(), paymentType, refounded, date, price);
        orderDetailsBean.createOrderDetails(orderDetailsDto);
        response.sendRedirect(request.getContextPath() + "/Products");

    }
}
