<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="POS - Users">
    <h1>
        Users
    </h1>
    <table class="table table-bordered table-striped">
        <thead class="thead-light">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Type</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user" varStatus="status">
                <tr>
                    <th scope="row">${status.index+1}</th>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.usertype}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/EditUser?userId=${user.id}" class="btn btn-secondary btn-lg">Edit</a>
                        <a href="${pageContext.request.contextPath}/DeleteUser?userId=${user.id}" class="btn btn-danger btn-lg">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary btn-lg">Add User</a>

</t:pageTemplate>