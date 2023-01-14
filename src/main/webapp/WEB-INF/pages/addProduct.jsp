<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="POS - Add Product">
  <h1>
    Add Product
  </h1>


  <form class="needs-validation" novalidate="" method="POST" action="${pageContext.request.contextPath}/AddProduct">
    <div class="row g-3">
      <div class="col-sm-6">
        <label for="name" class="form-label">Name</label>
        <input type="text" class="form-control" id="name" placeholder="Tomato" value="" required="">
        <div class="invalid-feedback">
          Valid name is required.
        </div>
      </div>

      <div class="col-12">
        <label for="description" class="form-label">Description</label>
        <div class="input-group has-validation">
          <input type="text" class="form-control" id="description" placeholder="Very tasty..." required="">
          <div class="invalid-feedback">
            Description is required.
          </div>
        </div>
      </div>

      <div class="col-12">
        <label for="price" class="form-label">Price</label>
        <input type="text" class="form-control" id="price" placeholder="9.99">
        <div class="invalid-feedback">
          Please enter a valid price.
        </div>
      </div>

      <div class="col-12">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" class="form-control" id="stock" placeholder="2312">
        <div class="invalid-feedback">
          Please enter a valid stock.
        </div>
      </div>
    </div>

    <hr class="my-4">

    <h4 class="mb-3">Type</h4>

    <div class="my-3">
      <div class="form-check">
        <input id="fruit" name="productType" type="radio" class="form-check-input" checked="" required="">
        <label class="form-check-label" for="fruit">Fruit</label>
      </div>
      <div class="form-check">
        <input id="vegetable" name="productType" type="radio" class="form-check-input" required="">
        <label class="form-check-label" for="vegetable">Vegetable</label>
      </div>
      <div class="form-check">
        <input id="electronic" name="productType" type="radio" class="form-check-input" required="">
        <label class="form-check-label" for="electronic">Electronic Device</label>
      </div>
    </div>

    <hr class="my-4">

    <button class="w-100 btn btn-primary btn-lg" type="submit">Add Product</button>
  </form>
</t:pageTemplate>