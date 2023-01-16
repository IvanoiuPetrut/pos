package com.pos.pos;

import com.pos.pos.common.ProductDto;
import com.pos.pos.common.UserDto;
import com.pos.pos.ejb.ProductsBean;
import com.pos.pos.ejb.UserBean;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditUser", value = "/EditUser")
public class EditUser extends HttpServlet {
    @Inject
    UserBean usersBean;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserDto> users = usersBean.findAllUsers();
        request.setAttribute("users", users);

        Long userId = Long.parseLong(request.getParameter("userId"));
        UserDto userDto = usersBean.findUserById(userId);
        request.setAttribute("user", userDto);

        request.getRequestDispatcher("/WEB-INF/pages/editUser.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");


        Long id = Long.parseLong(request.getParameter("userId"));


        UserDto userDto = new UserDto(id, username, email,password,userType);
        usersBean.updateUser(userDto);
        response.sendRedirect(request.getContextPath() + "/Users");

    }

}
