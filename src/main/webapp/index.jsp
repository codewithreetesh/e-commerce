<%@page import="com.dao.UserDao"%>
<%@page import="java.io.File"%>
<%@ page import="com.connection.Helper"%>
<%@ page import="com.model.Category"%>
<%@ page import="com.dao.CategoryDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.connection.Databaseconn"%>
<%@ page import="com.model.Product"%>
<%@ page import="com.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<%@ include file="Alldata/css_js.jsp"%>
<link rel="stylesheet" href="css file/style.css">
	

</head>
<body>
	<%@ include file="Alldata/navbar.jsp"%>
	<%@ include file="message.jsp"%>

	<%
	String cate = request.getParameter("category");
	out.println(cate);

	ProductDao pdo = new ProductDao(Databaseconn.getConnection());
	List<Product> plist = null;
	
	if( cate==null || cate.trim().isEmpty() || cate.trim().equals("all")){
		plist = pdo.getAllProduct();
	}	
	else{
		try{
			int cat= Integer.parseInt(cate.trim());
			out.println("ksjdf....."+cat);
			plist= pdo.getProductById(cat);
			System.out.println(plist);
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	CategoryDao cdao = new CategoryDao(Databaseconn.getConnection());
	List<Category> clist = cdao.getAllCategory();
	System.out.println(clist);
	
	UserDao uDao=new UserDao(Databaseconn.getConnection());
	List<User> userr= uDao.getAllUser();	
	
	%>
	<script>
	</script>
	
	
	<form >
	<div class="container-fluid  ">
		<div class="row mt-5">
			<!-- Show categories -->
			<div class="col-md-2 fixed-category">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active">All
						Products</a>
					<%
					for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategory_id()%>"
						class="list-group-item list-group-item-action"><%=c.getCategory_title()%></a>
					<%
					}
					%>
				</div>
			</div>

			<!-- Show products -->
			<div class="col-md-10">
				<div class="row mt-4 mr-2">
					<div class="col-md-12">
						<div class="card-columns">
							<!-- Traversing products -->
							<%
							for (Product p : plist) {
							%>
							<div class="card ">

								<%
								// Debugging: Check the generated path
								String imagePath = getServletContext().getContextPath() + "/upload/" + p.getPphoto();
								%>
								<div class="container text-center card-image" id="pImage">
										<img src="<%=imagePath%>" class="card-img-top "
									alt="Product image" ">
							
								</div>
							
								<div class="card-body">
									<h5 class="card-title" id="pname"><%=p.getPname()%></h5>
									<p class="card-text" id="pdesc">
										<%=Helper.get10Words(p.getPdesc())%>
									</p>
									<input type="hidden" id="pprice" value="<%= p.getPprice() %>">
									<input type="hidden" id="pid" value="<%= p.getPid()%>">
									<input type="hidden" id="pdiscount" value="<%= p.getPdiscount()%>">
									<input type="hidden" id="cid" value="<%= p.getCategory().getCategory_id()%>">
									
								</div>
									
								<div class="card-footer text-center">
									<button class="btn btn-primary" name="page"  value="Addtocart" onclick="add_to_cart(<%= p.getPid() %>, '<%= p.getPname() %>', <%= p.getPriceAfterDiscount() %>)">Add to Cart</button>

									<button class="btn btn-success" id="ppriceafterdis"><%=p.getPriceAfterDiscount()%>/-<span class="text-secondary discount-label">&#8377;<%= p.getPprice() %>/ <%= p.getPdiscount()%>% off</span></button>
								</div>
							</div>
							<%
							}	
							%>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	</form>
	<%@ include file="Alldata/common_model.jsp"%>
</body>
</html>
