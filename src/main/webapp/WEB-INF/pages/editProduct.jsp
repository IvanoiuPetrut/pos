<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="POS - Edit Poduct">
  <h1>
    Edit product ${product.name}
  </h1>

  <form class="needs-validation" novalidate="" method="POST" action="${pageContext.request.contextPath}/EditProduct?barCode=${product.barCode}">
    <div class="row g-3">
      <div class="col-sm-6">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Tomato" value="${product.name}" required="" name="name">
        <div class="invalid-feedback">
          Valid name is required.
        </div>
      </div>

      <div class="col-12">
        <label for="description" class="form-label">Description</label>
        <div class="input-group has-validation">
          <input type="text" class="form-control" id="description" placeholder="Very tasty..." required="" value="${product.description}" name="description">
          <div class="invalid-feedback">
            Description is required.
          </div>
        </div>
      </div>

      <div class="col-12">
        <label for="price" class="form-label">Price</label>
        <input type="text" class="form-control" id="price" placeholder="9.99" value="${product.price}" name="price">
        <div class="invalid-feedback">
          Please enter a valid price.
        </div>
      </div>

      <div class="col-12">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" class="form-control" id="stock" placeholder="2312" value="${product.stock}" name="stock">
        <div class="invalid-feedback">
          Please enter a valid stock.
        </div>
      </div>
    </div>

    <hr class="my-4">

    <h4 class="mb-3">Type</h4>

    <div class="col-md-5">
      <p>The currently type of this prodcut is: ${product.type}</p>
      <label for="country" class="form-label">Type</label>
      <select class="form-select" id="country" required="" name="type">
        <option value="">Choose...</option>
        <option value="fruit">Fruit</option>
        <option value="vegetable">Vegetable</option>
        <option value="clothing">Clothing</option>
        <option value="electronic">Electronic Device</option>
      </select>
      <div class="invalid-feedback">
        Please select a valid type.
      </div>
    </div>

    <hr class="my-4">

    <button class="w-100 btn btn-primary btn-lg" type="submit">Edit product</button>
  </form>
</t:pageTemplate>