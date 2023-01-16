<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="POS - Products">
    <h1>
        Products
    </h1>


    ${pageContext.request.isUserInRole('WRITE_PRODUCTS')}

    <c:if test="${pageContext.request.isUserInRole('WRITE_PRODUCTS')}">
        <a href="${pageContext.request.contextPath}/AddProduct" class="btn btn-primary btn-lg">Add Product</a>
    </c:if>

    <a href="${pageContext.request.contextPath}/AddProduct" class="btn btn-primary btn-lg">Add Product</a>
    <%--    <a href="${pageContext.request.contextPath}/AddProduct" class="btn btn-primary btn-lg">Add Product</a>--%>

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
                        <a href="${pageContext.request.contextPath}/EditProduct?barCode=${product.barCode}"
                           class="btn btn-secondary btn-lg">Edit</a>
                        <a href="${pageContext.request.contextPath}/DeleteProduct?barCode=${product.barCode}"
                           class="btn btn-danger btn-lg">Delete</a>
                        <button id="add-to-cart-${product.barCode}" data-barCode='${product.barCode}'
                                data-productName='${product.name}' data-productPrice='${product.price}'>Add to cart JS
                        </button>
                        <p>Price: ${product.price}</p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</t:pageTemplate>