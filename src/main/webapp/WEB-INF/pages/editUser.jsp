<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="POS - Edit User">
    <h1>
        Edit user ${user.username}
    </h1>


    <form class="needs-validation" novalidate="" method="POST" action="${pageContext.request.contextPath}/EditUser?userId=${user.id}">
        <div class="row g-3">
            <div class="col-sm-6">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" placeholder="Cici" value="${user.username}" required="" name="username">
                <div class="invalid-feedback">
                    Valid username is required.
                </div>
            </div>

            <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <div class="input-group has-validation">
                    <input type="text" class="form-control" id="email" placeholder="youremail@yahoo.com" value="${user.email}" required="" name="email">
                    <div class="invalid-feedback">
                        Email is required.
                    </div>
                </div>
            </div>

            <div class="col-12">
                <label for="password" class="form-label">Password</label>
                <input type="text" class="form-control" id="password" placeholder="123sad12d#$e1" value="${user.password}" name="password">
                <div class="invalid-feedback">
                    Please enter a valid password.
                </div>
            </div>

        </div>

        <hr class="my-4">

        <h4 class="mb-3">Type</h4>

        <div class="col-md-5">
            <p>The currently type of this user is: ${user.usertype}</p>
            <label for="userType" class="form-label">Type</label>
            <select class="form-select" id="userType" required="" name="userType">
                <option value="">Choose...</option>
                <option value="admin">Admin</option>
                <option value="cashier">Cashier</option>

            </select>
            <div class="invalid-feedback">
                Please select a valid type.
            </div>
        </div>

        <hr class="my-4">

        <button class="w-100 btn btn-primary btn-lg" type="submit">Edit</button>
    </form>
</t:pageTemplate>