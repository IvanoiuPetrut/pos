console.log("Hello world")
const buttons = document.querySelectorAll("[id^='add-to-cart-']");
//add event listener to btn
const cart = [];

buttons.forEach(button => {
    button.addEventListener("click", function() {
        // Get the product information from the button's data-product attribute
        const barCode = this.getAttribute("data-barCode");
        const name = this.getAttribute("data-productName");
        const price = this.getAttribute("data-productPrice")
        const product = {
            barCode: barCode,
            name: name,
            price: price,
        }
        addToCart(product);
        addCartToLocalStorage(cart);
    });
});

function addToCart(productToAdd) {
    const productFound = cart.some(product => product.barCode === productToAdd.barCode)

    if(productFound) {
        const index = cart.findIndex(product => product.barCode === productToAdd.barCode)
        cart[index].quantity += 1;
    } else {
        productToAdd.quantity = 1;
        cart.push(productToAdd)
    }
    console.log(cart);
}

function addCartToLocalStorage(cart) {
    localStorage.setItem("cart", JSON.stringify(cart));
}