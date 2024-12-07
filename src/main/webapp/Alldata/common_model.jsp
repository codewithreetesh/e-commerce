<%@ page import="com.model.User"%>
<%-- 
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "You are not logged in. Please log in first.");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUser_type().equals("NORMAL")) {
            session.setAttribute("message", "You are not an Admin. Access to this page is restricted.");
            response.sendRedirect("index.jsp");
            return;
        }
    }
--%>

<!-- Modal -->
<div class="modal fade" id="cart" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="cart-body"></div>
				<!-- Cart items will be populated here -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary checkout-btn" id="checkoutBtn"
					onclick="location.href='checkout.jsp';">Checkout</button>
			</div>
		</div>
	</div>
</div>

<!-- Toast Notification -->
<div id="toast" class="toast hidden">
	<div class="toast-header">
		<strong class="toast-title">Notification</strong>
		<button type="button" class="toast-close" onclick="hideToast()">✖</button>
	</div>
	<div class="toast-body">This is a toast message.</div>
</div>
