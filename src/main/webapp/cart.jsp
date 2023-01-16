<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="POS - Cart">
    <h1>
        Cart
    </h1>

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <ul id="cart-list" class="list-group">
                </ul>
            </div>
            <div class="col-sm">
                <div class="card">
                    <div class="card-header">
                        Order Summary
                    </div>
                    <div class="card-body">
                        <h5 class="card-title price">Total Pice:</h5>
                        <div class="col-md-5">
                        </div>
                        <form class="needs-validation" novalidate="" method="POST"
                              action="${pageContext.request.contextPath}/Checkout">
                            <input type="text" class="form-control" id="price" placeholder="Tomato" value=""
                                   name="price">
                            <input type="text" class="form-control" id="date" placeholder="Tomato" value=""
                                   name="date">
                            <input type="text" class="form-control" id="refounded" placeholder="Tomato" value=""
                                   name="refounded">

                            <hr class="my-4">

                            <h4 class="mb-3">Type</h4>

                            <div class="col-md-5">
                                <label for="paymentType" class="form-label">Payment Type</label>
                                <select class="form-select" id="paymentType" required="" name="paymentType">
                                    <option value="">Choose...</option>
                                    <option value="fruit">Cash</option>
                                    <option value="vegetable">Card</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid type.
                                </div>
                            </div>

                            <hr class="my-4">

                            <button class="btn btn-primary btn-lg" type="submit" id="checkout">Checkout</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const cart = JSON.parse(localStorage.getItem('cart'));

            document.querySelector('#price').value = cart.reduce((acc, item) => acc + item.price, 0);
            document.querySelector('#date').value = new Date().toLocaleString();
            document.querySelector('#refounded').value = false;

            const list = document.querySelector('#cart-list');
            let totalPrice = 0;
            for (let i = 0; i < cart.length; i++) {
                const item = cart[i];

                totalPrice += (item.quantity * item.price);

                const li = document.createElement('li');
                li.className = 'list-group-item d-flex justify-content-between align-items-center';

                const name = document.createElement('span');
                name.innerText = item.name;
                li.appendChild(name);

                const price = document.createElement('span');
                price.innerText = "Price: " + item.price + ' $';
                li.appendChild(price);

                const quantity = document.createElement('span');
                quantity.className = '';
                quantity.innerText = "Quantity: " + item.quantity;
                li.appendChild(quantity);

                const buttonWrapper = document.createElement('div');
                buttonWrapper.className = 'btn-group btn-group-sm';

                const increaseQuantity = document.createElement('button');
                increaseQuantity.className = 'btn btn-primary';
                increaseQuantity.innerText = '+';
                increaseQuantity.addEventListener('click', function () {
                    item.quantity++;
                    localStorage.setItem('cart', JSON.stringify(cart));
                    quantity.innerText = "Quantity: " + item.quantity;
                });
                buttonWrapper.appendChild(increaseQuantity);

                const decreaseQuantity = document.createElement('button');
                decreaseQuantity.className = 'btn btn-primary';
                decreaseQuantity.innerText = '-';
                decreaseQuantity.addEventListener('click', function () {
                    item.quantity--;
                    localStorage.setItem('cart', JSON.stringify(cart));
                    quantity.innerText = "Quantity: " + item.quantity;
                });
                buttonWrapper.appendChild(decreaseQuantity);

                const remove = document.createElement('button');
                remove.className = 'btn btn-danger';
                remove.innerText = 'Remove';
                remove.addEventListener('click', function () {
                    cart.splice(i, 1);
                    localStorage.setItem('cart', JSON.stringify(cart));
                    li.remove();
                });
                buttonWrapper.appendChild(remove);

                li.append(buttonWrapper);

                list.appendChild(li);
            }

            document.querySelector('.price').innerText = "Total Price: " + totalPrice + ' $';
            document.querySelector('#checkout').addEventListener('click', function () {
                localStorage.removeItem('cart');
            });
        });
    </script>

</t:pageTemplate>