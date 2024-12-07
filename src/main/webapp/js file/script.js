
// Add to cart
function add_to_cart(pid, pname, pprice) {
    console.log("Added to cart:", pid, pname, pprice);
    let cart = localStorage.getItem("cart");
	
    
    if (cart === null || cart === "null") { // Check for null or string "null"
        let products = [];
        let product = { productId: pid, productName: pname, productPrice: pprice, productQuantity: 1 };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showToast(pname + " has been added 1 to the cart."); // Corrected variable name
    } else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find(item => item.productId === pid);

        if (oldProduct) {
            swal({
                title: "Product Already in Cart",
                content: {
                    element: "div",
                    attributes: {
                        innerHTML: `<span style="color: red;">${oldProduct.productName} is already in the cart.</span>`,
                    },
                },
                icon: "warning",
                buttons: true,
                dangerMode: true,
            });
            console.log("Product already in the cart");
        } else {
            let product = { productId: pid, productName: pname, productPrice: pprice, productQuantity: 1 };
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product added");
            showToast(pname + " has been added to  the cart."); // Use pname for the toast message
        }
    }

    updateCart(); // Update the cart display
}

$(document).ready(function() {
    updateCart(); // Update the cart when the document is ready
});
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);

    // Check if cart is empty
    if (cart == null || cart.length === 0) {
        console.log("Cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $("#checkoutBtn").attr('disabled', true); // Disable checkout button
    } else {
        $(".cart-items").html(`(${cart.length})`);
        $("#checkoutBtn").attr('disabled', false); // Enable checkout button
        
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Serial No</th>
                        <th>Item Id</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
        `;

        let totalPrice = 0; // Initialize total price

        cart.forEach((item, index) => {
            totalPrice += item.productPrice * item.productQuantity; // Calculate total price
	
            table += `
                <tr>
                    <td>${index + 1}</td>
                    <td>${item.productId}</td>
                    <td>${item.productName}</td>
                    <td>${item.productPrice.toFixed(2)}</td>
                    <td>
                        <button class='btn btn-success btn-sm increase' data-id="${item.productId}">+</button>
                        <span class="quantity">${item.productQuantity}</span>
                        <button class='btn btn-danger btn-sm decrease' data-id="${item.productId}">-</button>
                    </td>
                    <td>${(item.productQuantity * item.productPrice).toFixed(2)}</td>
                    <td>
                        <button class='btn btn-danger btn-sm remove-btn' data-id="${item.productId}">Remove</button>
                    </td>
                </tr>
            `;
        });

        // Add total price row
        table += `
            <tr>
                <td colspan="6" style="text-align:right; font-weight:bold;">Grand Total Price:</td>
                <td>${totalPrice.toFixed(2)}</td>
                <td></td>
            </tr>
        `;

        table += `
                </tbody>
            </table>
        `;

        $(".cart-body").html(table); // Update cart display
    }

    attachEventListeners(); // Re-attach event listeners for buttons
}

function attachEventListeners() {
    // Attach event listeners for remove buttons
    $('.remove-btn').off('click').on('click', function() {
        const productId = $(this).data('id');
        removeFromCart(productId);
    });

    // Attach other event listeners as needed
    $('.increase').off('click').on('click', function() {
        const productId = $(this).data('id');
        increaseQuantity(productId);
    });

    $('.decrease').off('click').on('click', function() {
        const productId = $(this).data('id');
        decreaseQuantity(productId);
    });
}

function increaseQuantity(productId) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    if (cart) {
        let product = cart.find(item => item.productId === productId);
        if (product) {
            product.productQuantity += 1;
            localStorage.setItem("cart", JSON.stringify(cart));
            console.log("Product quantity increased");
            updateCart();
        	showToast("Quantity is Increase");
        }
    }
}

function decreaseQuantity(productId) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    if (cart) {
        let product = cart.find(item => item.productId === productId);
        if (product) {
            if (product.productQuantity > 1) {
                product.productQuantity -= 1;
                localStorage.setItem("cart", JSON.stringify(cart));
                console.log("Product quantity decreased");
                updateCart();
                showToast("Quantity is Decrease");
            }
        }
    }
}

function removeFromCart(productId) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    if (cart) {
        cart = cart.filter(item => item.productId !== productId);
        localStorage.setItem("cart", JSON.stringify(cart));
        console.log("Product removed from cart");
        updateCart();
        showToast("Item is  remove from the cart");
    }
}

// Toast functions
function showToast(message) {
    const toast = document.getElementById('toast');
    const toastMessage = toast.querySelector('.toast-body');
    toastMessage.textContent = message; // Set the message
    toast.classList.remove('hidden');
    toast.classList.add('show');

    // Automatically hide the toast after a certain duration
    setTimeout(() => {
        hideToast();
    }, 3000); // Adjust duration as needed
}

function hideToast() {
    const toast = document.getElementById('toast');
    toast.classList.remove('show');
    setTimeout(() => {
        toast.classList.add('hidden');
    }, 500); // Match the duration with CSS transition
}


function conformOrder() {
       	console.log("hello");
       	alert();
        	let cart = JSON.parse(localStorage.getItem("cart"));
            if (cart && cart.length > 0) {
                // Send cart to server for session storage
                $.ajax({
                    type: "POST",
                    url: "storeCartInSession.jsp", // URL to your JSP that stores the cart in session
                    data: { cart: JSON.stringify(cart) },
                    success: function(response) {
                        // Redirect to the order confirmation page
                        window.location.href = "orderConformation.jsp"; // Change to your actual confirmation page URL
                    },
                    error: function(error) {
                        console.error("Error storing cart in session:", error);
                        showToast("Failed to store cart. Please try again.");
                    }
                });
            } else {
                showToast("Your cart is empty!");
            }
        }

      