<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="POS - Products">
  <h1>
    Products
  </h1>
  ${products[0].name}

  <c:forEach items="${products}" var="product">
    ${product.name}
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