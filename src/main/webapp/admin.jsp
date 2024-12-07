<%@page import="com.model.Order"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.model.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.Databaseconn"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.model.Category"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>

<%@ include file="Alldata/css_js.jsp"%>
<link rel="stylesheet" href="css/style.css">
</head>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<!-- Include Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Include custom CSS if needed -->
<link rel="stylesheet" href="css file/style.css">
</head>
<body>
	<%@ include file="Alldata/navbar.jsp"%>
	<%@ include file="message.jsp"%>

	<%
	User user = (User) session.getAttribute("current-user");
	System.out.println("46545" + user);
	if (user == null) {
		session.setAttribute("message", "You are not logged in. Please log in first.");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUser_type().equals("NORMAL")) {
			session.setAttribute("message", "You are not an Admin. Access to this page is restricted.");
			response.sendRedirect("login.jsp");
			return;
		}

	}
	%>
	<%
	CategoryDao cdao = new CategoryDao(Databaseconn.getConnection());
	List<Category> category = cdao.getAllCategory();

	ProductDao pdao = new ProductDao(Databaseconn.getConnection());
	List<Product> product = pdao.getAllProduct();

	UserDao uDao = new UserDao(Databaseconn.getConnection());
	List<User> userr = uDao.getAllUser();
	
	
	OrderDao oDao=new OrderDao(Databaseconn.getConnection());
	List<Order> order= oDao.getAllOrder();
	System.out.println(order);
	%>

	<div class="container admin ">
		<div class="row mt-3">
			<!-- First Column -->
			<div class="col-md-4">
				<div class="card" data-toggle="modal" data-target="#show-user-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="User Image" src="Image/user%20(1).png">
						</div>
						<h1><%=userr.size()%></h1>
						<h1 class="text-uppercase text-muted">User</h1>
					</div>
				</div>
			</div>

			<!-- Start show User Modal -->
			<!-- Modal -->
			<div class="modal fade" id="show-user-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom model">
							<h5 class="modal-title" id="exampleModalLabel">User Details</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="input-group mb-3" style="max-width: 300px;">
								<input type="search" id="search-input1" class="form-control"
									placeholder="Search By Name/User Id" aria-label="Search"
									style="font-size: 0.875rem; padding: 0.375rem 0.75rem;" /> 
									<span class="input-group-text print-button" style="background: transparent; border: none;">
    <i class="bi bi-file-earmark-pdf" style="font-size: 24px; color: red;"></i>
</span>
							</div>



							<table class="table">
								<thead>
									<tr>
										<th>S.no</th>
										<th>UID</th>
										<th>Name</th>
										<th>Email</th>
										<th>Phone</th>
										<th>Address</th>
										<th>Type</th>

									</tr>
								</thead>
								<tbody id="user-table-body">
									<%
									int a = 1;
									for (User u : userr) {
									%>
									<tr>
										<td><%=a%></td>
										<td><%=u.getUser_id()%></td>
										<td><%=u.getUser_name()%></td>
										<td><%=u.getUser_email()%></td>
										<td><%=u.getUser_phone()%></td>
										<td><%=u.getUser_address()%></td>
										<td><%=u.getUser_type()%></td>

									</tr>



									<%
									a++;
									}
									%>


								</tbody>
							</table>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
			<!-- End User Modal -->



			<!-- Second Column -->
			<div class="col-md-4">
				<div class="card" data-toggle="modal"
					data-target="#show-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="Category Image" src="Image/category.png">
						</div>
						<h1><%=category.size()%></h1>
						<h1 class="text-uppercase text-muted">Category</h1>
					</div>
				</div>
			</div>
			<!-- Start show Category Modal -->
			<!-- Modal -->
			<div class="modal fade" id="show-category-modal" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header custom model">
							<h5 class="modal-title" id="exampleModalLabel">Category
								Details</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="input-group mb-3" style="max-width: 300px;">
								<input type="search" id="search-input2" class="form-control"
									placeholder="Search By Title/Category Id" aria-label="Search"
									style="font-size: 0.875rem; padding: 0.375rem 0.75rem;" /> 
									<span class="input-group-text print-button" style="background: transparent; border: none;">
    <i class="bi bi-file-earmark-pdf" style="font-size: 24px; color: red;"></i>
</span>
							</div>



							<table class="table">
								<thead>
									<tr>
										<th>S.NO</th>
										<th>Id</th>
										<th>Title</th>
										<th>Description</th>
									</tr>
								</thead>
								<tbody id="category-table-body">
									<%
									int i = 1;
									for (Category c : category) {
									%>
									<tr>
										<td><%=i%></td>
										<td><%=c.getCategory_id()%></td>
										<td><%=c.getCategory_title()%></td>
										<td><%=c.getCategory_discription()%></td>
									</tr>
									<%
									i++;
									}
									%>
								</tbody>
							</table>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
			<!-- End Category Modal -->


			<!-- Third Column -->
			<div class="col-md-4">
				<div class="card" data-toggle="modal"
					data-target="#show-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="Products Image" src="Image/new-product.png">
						</div>
						<h1><%=product.size()%></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<!-- Start show Products Modal -->
		<!-- Modal -->
<div class="modal fade" id="show-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom model">
                <h5 class="modal-title" id="exampleModalLabel">Products Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3" style="max-width: 300px;">
                    <input type="search" id="search-input3" class="form-control" placeholder="Search By Title/Product Id" aria-label="Search" style="font-size: 0.875rem; padding: 0.375rem 0.75rem;" />
       	<span class="input-group-text print-button" style="background: transparent; border: none;">
    <i class="bi bi-file-earmark-pdf" style="font-size: 24px; color: red;"></i>
</span>
       
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th>S.NO</th>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Discount</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody id="product-table-body">
                        <%
                        int b = 1;
                        for (Product p : product) {
                        %>
                        <tr>
                            <td><%= b %></td>
                            <td><%= p.getPid() %></td>
                            <td><%= p.getPname() %></td>
                            <td><%= p.getPdesc() %></td>
                            <td><%= p.getPprice() %></td>
                            <td><%= p.getPdiscount() %></td>
                            <td><%= p.getPquantity() %></td>
                        </tr>
                        <%
                        b++;
                        }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
		<!-- End Category Modal -->



		<!-- Second Row -->
		<div class="row mt-4">
			<div class="col-md-4">
				<!-- Second Row First Column -->
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="Add Category Image" src="Image/category.png">
						</div>
						<h1>65465</h1>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<!-- Second Row Second Column -->
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="Add Products Image" src="Image/new-product.png">
						</div>
						<h1>65465</h1>
						<h1 class="text-uppercase text-muted">Add Products</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<!-- Second Row First Column -->
				<div class="card" data-toggle="modal"
					data-target="#show-AllOrder-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px" class="img-fluid rounded-circle"
								alt="Add Category Image" src="Image/category.png">
						</div>
						<h1>65465</h1>
						<h1 class="text-uppercase text-muted">All Order</h1>
					</div>
				</div>
			</div>
			
		</div>
	</div>

	<!-- Start Category Modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content ">
				<div class="modal-header custom model ">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AllServlet" method="Get">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Details" required />
						</div>


						<div class="form-group">
							<textarea style="height: 300px" class="form-control"
								placeholder="Enter Category Description " name="catDescription"
								required></textarea>

						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success" name="page"
								value="addcategory">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>
					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End Category Modal -->

	<!-- start Product Model -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content ">
				<div class="modal-header custom model">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="AllServlet" method="Post"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="text" class="form-control" name="proName"
								placeholder="Enter Product Name" required />
						</div>

						<div class="form-group">
							<input type="number" class="form-control" name="proPrice"
								placeholder="Enter Product Price" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="proDiscount"
								placeholder="Enter Product Discount" required />
						</div>
						<div class="form-group">
							<input type="number" class="form-control" name="proQuantity"
								placeholder="Enter Product Quantity" required />
						</div>

						<div class="form-group">
							<textarea style="height: 200px" class="form-control"
								placeholder="Enter Product Description " name="proDescription"
								required></textarea>
						</div>
						<div class="form-group">
							<select name="cid" id="" class="form-control" id="">
								<%
								for (Category c : category) {
									System.out.println(c);
								%>
								<option value="<%=c.getCategory_id()%>"><%=c.getCategory_title()%></option>
								<%
								}
								%>

							</select>
						</div>

						<div class="form-group">
							<label for="propic">Select Picture of Product</label> </br> <input
								type="file" id="propic" name="propic" required />
						</div>



						<div class="container text-center">
							<button class="btn btn-outline-success" name="page"
								value="addproduct">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>
					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<!-- End product Model -->

	
	<!-- Start All Order Modal -->
	<!-- Modal -->
	<div class="modal fade" id="show-AllOrder-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content ">
				<div class="modal-header custom model ">
					<h5 class="modal-title" id="exampleModalLabel">All Order Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
						<div class="modal-body">
							<div class="input-group mb-3" style="max-width: 300px;">
								<input type="search" id="search-input1" class="form-control"
									placeholder="Search By Name/User Id" aria-label="Search"
									style="font-size: 0.875rem; padding: 0.375rem 0.75rem;" /> 
									<span class="input-group-text print-button" style="background: transparent; border: none;">
    <i class="bi bi-file-earmark-pdf" style="font-size: 24px; color: red;"></i>
</span>
							</div>



							<table class="table">
								<thead>
									<tr>
										<th>S.no</th>
										<th>Order Id</th>
										<th>Name</th>
										<th>Email</th>
										<th>Address</th>
										<th>User Id</th>
										<th>Product Id</th>
									</tr>
								</thead>
								<tbody id="user-table-body">
									<%
									int c = 1;
									for (Order o : order) {
									%>
									<tr>
										<td><%=c%></td>
										<td><%=o.getoId()%></td>
										<td><%=o.getName()%></td>
										<td><%=o.getEmail()%></td>
										<td><%=o.getAddress()%></td>
										<td><%=o.getUid()%></td>
										<td><%=o.getPid()%></td>

									</tr>



									<%
									c++;
									}
									%>


								</tbody>
							</table>
						</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- End All Order Modal -->
	


	<!-- Include jQuery, Popper.js, and Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
    /* User Search */
// User Search
document.getElementById('search-input1').addEventListener('input', function() {
    const input = this.value.toLowerCase();
    const rows = document.querySelectorAll('#user-table-body tr');

    rows.forEach(row => {
        const cells = row.querySelectorAll('td');
        if (cells.length > 0) {
            const no = cells[0].innerText.toLowerCase();
            const id = cells[1].innerText.toLowerCase();
            const name = cells[2].innerText.toLowerCase();
            const email = cells[3].innerText.toLowerCase();
            const phone = cells[4].innerText.toLowerCase();
            const address = cells[5].innerText.toLowerCase();
            const type = cells[6].innerText.toLowerCase();

            if (id.includes(input) || name.includes(input) || email.includes(input) || no.includes(input) || phone.includes(input) || address.includes(input) || type.includes(input)) {
                row.style.display = ''; // Show row
            } else {
                row.style.display = 'none'; // Hide row
            }
        }
    });
});

// Category Search
document.getElementById('search-input2').addEventListener('input', function() {
    const input = this.value.toLowerCase();
    const rows = document.querySelectorAll('#category-table-body tr');

    rows.forEach(row => {
        const cells = row.querySelectorAll('td');
        if (cells.length > 0) {
            const no = cells[0].innerText.toLowerCase();
            const id = cells[1].innerText.toLowerCase();
            const title = cells[2].innerText.toLowerCase();
            const description = cells[3].innerText.toLowerCase();

            if (id.includes(input) || title.includes(input) || description.includes(input) || no.includes(input)) {
                row.style.display = ''; // Show row
            } else {
                row.style.display = 'none'; // Hide row
            }
        }
    });
});

// Product Search
document.getElementById('search-input3').addEventListener('input', function() {
    const input = this.value.toLowerCase();
    const rows = document.querySelectorAll('#product-table-body tr');

    rows.forEach(row => {
        const cells = row.querySelectorAll('td');
        if (cells.length > 0) {
            const no = cells[0].innerText.toLowerCase();
            const id = cells[1].innerText.toLowerCase();
            const name = cells[2].innerText.toLowerCase();
            const description = cells[3].innerText.toLowerCase();
            const price = cells[4].innerText.toLowerCase();
            const discount = cells[5].innerText.toLowerCase();
            const quantity = cells[6].innerText.toLowerCase();

            if (id.includes(input) || name.includes(input) || description.includes(input) || no.includes(input) || price.includes(input) || discount.includes(input) || quantity.includes(input)) {
                row.style.display = ''; // Show row
            } else {
                row.style.display = 'none'; // Hide row
            }
        }
    });
});

    /* Print Functionality */
    document.querySelectorAll('.print-button').forEach(button => {
    button.addEventListener('click', function() {
        window.print();
    });
});
	
</script>


	<%@ include file="Alldata/common_model.jsp"%>

</body>
</html>
