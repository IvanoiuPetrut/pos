<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="POS - Products">
    <h1>
        Products
    </h1>

    <a href="${pageContext.request.contextPath}/AddProduct" class="btn btn-primary btn-lg">Add Product</a>

    <c:forEach items="${products}" var="product">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="180"
                         xmlns="http://www.w3.org/2000/svg"
                         preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                         aria-label="Placeholder: Image cap">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#868e96"></rect>
                        <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text>
                    </svg>
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Category: ${product.type}</li>
                        <li class="list-group-item">Stock: ${product.stock}</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="btn btn-primary btn-lg">Add to cart</a>
                        <a href="${pageContext.request.contextPath}/EditProduct?barCode=${product.barCode}" class="btn btn-secondary btn-lg">Edit</a>
                        <p>Price: ${product.price}</p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <h3>
        Number of products: ${numberOfProducts}
    </h3>
    <div class="card">
        <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light" data-mdb-ripple-color="light">
            <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/img%20(17).webp" class="w-100">
            <a href="#!">
                <div class="mask">
                    <div class="d-flex justify-content-start align-items-end h-100"></div>
                </div>
                <div class="hover-overlay">
                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                </div>
            </a>
        </div>
        <div class="card-body">
            <a href="" class="text-reset">
                <h5 class="card-title mb-3">Product name</h5>
            </a>
            <a href="" class="text-reset">
                <p>Category</p>
            </a>
            <h6 class="mb-3">$61.99</h6>
        </div>
    </div>
</t:pageTemplate>