package com.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.Databaseconn;
import com.dao.AddCartDao;
import com.dao.CategoryDao;
import com.dao.FeedbackDao;
import com.dao.OrderDao;
import com.dao.ProductDao;
import com.dao.UserDao;
import com.model.Addcart;
import com.model.Category;
import com.model.Feedback;
import com.model.Order;
import com.model.Product;
import com.model.User;

/**
 * Servlet implementation class AllServlet
 */
@MultipartConfig
@WebServlet("/AllServlet")
public class AllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String page = request.getParameter("page");

		if ("register".equals(page)) {
			handleRegistration(request, response);
		} else if ("login".equals(page)) {
			handleLogin(request, response);
		} else if ("logout".equals(page)) {
			handleLogout(request, response);
		} else if ("addcategory".equals(page)) {
			handleAddCategory(request, response);
		} 

		else {
			// Handle unknown page or default case here
		}
	}


	
	private void handleAddCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDescription");

			System.out.println(title);
			System.out.println(description);

			Category cate = new Category();
			cate.setCategory_title(title);
			cate.setCategory_discription(description);

			HttpSession session = request.getSession();

			CategoryDao cDao = new CategoryDao(Databaseconn.getConnection());
			int cid = cDao.addCategory(cate);

			System.out.println(cid);
			if (cid > 0) {
				System.out.println("category add");
				session.setAttribute("message", "Category Add Succesfully!!!" + cid);
				response.sendRedirect("admin.jsp");

			} else {
				System.out.println("category not add");
				session.setAttribute("message", "Category Already Available !!!" + cid);
				response.sendRedirect("admin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void handleLogout(HttpServletRequest request, HttpServletResponse response) {
		// Set the content type (though it's not strictly necessary for redirection)
		response.setContentType("text/html");

		try {
			// Perform logout logic here
			HttpSession session = request.getSession();
			if (session != null) {
				session.invalidate(); // Invalidate the session to log out the user
			}
			// Redirect to the login page
			response.sendRedirect("login.jsp");
		} catch (IOException e) {
			// Log the exception (use a logging framework in a real application)
			e.printStackTrace();
			// Optionally, redirect to an error page or display a friendly message

		}
	}

	private void handleLogin(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text.html");
		try (PrintWriter out = response.getWriter()) {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			System.out.println("serv" + email);

			User user = new User();
			user.setUser_email(email);
			user.setUser_password(password);

			UserDao udao = new UserDao(Databaseconn.getConnection());
			User loginUser = udao.loginUser(email, password);

			System.out.println(loginUser);
			HttpSession session = request.getSession();

			session.setAttribute("current-user", loginUser);

			if (loginUser != null) {
				System.out.println("ser user login");

				if (loginUser.getUser_type().equals("ADMIN")) {
					session.setAttribute("userlogindata", loginUser);
					session.setAttribute("message", "Admin login");
					response.sendRedirect("admin.jsp");
				} else if (loginUser.getUser_type().equals("NORMAL")) {
					session.setAttribute("userlogindata", loginUser);
					session.setAttribute("message", "Normal login");
					response.sendRedirect("index.jsp");
				} else {
					out.println("user type not identify");
				}
			} else {
				System.out.println(" ser user not login");

				session.setAttribute("message", "Invalid Details try with another one!!");
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void handleRegistration(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String pic = request.getParameter("pic");
			String address = request.getParameter("address");
			
			System.out.println(email);
			// Check if any parameter is null or empty and handle accordingly
			if (name == null || email == null || password == null || phone == null || pic == null || address == null) {
				session.setAttribute("message", "All fields are required.");
				response.sendRedirect("register.jsp");
				return;
			}

			User user = new User();
			user.setUser_name(name);
			user.setUser_email(email);
			user.setUser_password(password);
			user.setUser_phone(phone);
			user.setUser_pic(pic);
			user.setUser_address(address);
			user.setUser_type("NORMAL");

			UserDao ud = new UserDao(Databaseconn.getConnection());
			String message = ud.userReg(user);

			if ("failure".equals(message)) {
				session.setAttribute("message", "User Already Registered !!");
				response.sendRedirect("register.jsp");
			} else {
				session.setAttribute("message", "Registration Successfully !!");
				response.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "An error occurred. Please try again.");
			response.sendRedirect("register.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String page = request.getParameter("page");

		  if ("addproduct".equals(page)) {
				handleAddProduct(request, response);
			}
		  else if("feedback".equals(page)) {
				handleFeedback(request, response);		
		  }
		  else if("order".equals(page)) {
				handleOrder(request, response);
		  }
		  else if("Addtocart".equals(page)) {
				handleAddtocart(request, response);
		  }
		  else {
			  // lsdjf
		  }
	}
	
	private void handleAddtocart(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");
		
		try(PrintWriter out=response.getWriter()){
			int pid = Integer.parseInt(request.getParameter("pid"));	
			String pname = request.getParameter("pname");
			String pdesc = request.getParameter("pdesc");
			String pphoto = request.getParameter("pphoto");
			double pprice =Double.parseDouble(request.getParameter("pprice"));
			double pdiscount =Double.parseDouble(request.getParameter("pdiscount")) ;
			
			int cid = Integer.parseInt(request.getParameter("cid"));
			System.out.println("add to cart"+pid); 
			
			Addcart acart=new Addcart();
			acart.setPid(pid);
			acart.setPdesc(pdesc);
			acart.setPname(pname);
			acart.setPphoto(pphoto);
			acart.setPprice(pprice);
			acart.setPdisount(pdiscount);
			acart.setCid(cid);
			
			AddCartDao cdao=new AddCartDao(Databaseconn.getConnection());
			String message = cdao.addCart(acart);
			
			if(message.equals("success")) {
				System.out.println("card added");
			}
			else {
				System.out.println("card not added");
			}
		}
		catch(Exception e ) {
			e.printStackTrace();
		}
		
		
	}

	private void handleOrder(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");
		try(PrintWriter out=response.getWriter()){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			
			System.out.println("order++"+name);
			
			HttpSession session=request.getSession();
			
			User user =(User) session.getAttribute("userlogindata");
			System.out.println(user.getUser_id());
			// random UUID
			String randamUUID = UUID.randomUUID().toString();
			
			Order order=new Order();
			order.setoId(randamUUID);
			order.setName(name);
			order.setEmail(email);
			order.setAddress(address);
			order.setUid(user.getUser_id());
			
			
			OrderDao oDao=new OrderDao(Databaseconn.getConnection());
			Order userOrder= oDao.giveOrder(order);
			
			System.out.println(userOrder);
			
			if(userOrder != null) {
				System.out.println("Order successfully done");
				
			//	session.setAttribute("omessage","Order Successfully Complete !!");
				
				session.setAttribute("order",userOrder);
				response.sendRedirect("orderConformation.jsp");
			}
			else {
				System.out.println("order not Succesfully");
				//session.setAttribute("omessage","Order not Complete please try Again!!");
				response.sendRedirect("checkout.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	private void handleFeedback(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");
		
		try(PrintWriter out=response.getWriter()){
			String feedback = request.getParameter("textfeedback");
			int rating =Integer.parseInt(request.getParameter("rating"));
			
			System.out.println("****"+feedback);
			System.out.println("****"+rating);
			
	
			
			HttpSession session=request.getSession();
	
		    Order order = (Order) session.getAttribute("order");
		    String message1 = (String) session.getAttribute("message");
		    
		    
		    System.out.println(order);
		    System.out.println(message1);
		    
			User user =(User) session.getAttribute("userlogindata");
		
			Feedback feed=new Feedback();
			
			feed.setRating(rating);
			feed.setTextfeed(feedback);
			feed.setUid(user.getUser_id());
			
			FeedbackDao fDao=new FeedbackDao(Databaseconn.getConnection());	
			String message = fDao.addFeedback(feed);
			
			if(message.equals("success")) {
					session.setAttribute(message, "Feedback Submitted Successfully");
					response.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute(message, "Feedback not Submitted");
				response.sendRedirect("feedback.jsp");
			}
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		
	}

	private void handleAddProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
				response.setContentType("text/html");
				try(PrintWriter out=response.getWriter()){
					String proName = request.getParameter("proName");
					String proPrice = request.getParameter("proPrice");
					String proDiscount = request.getParameter("proDiscount");
					String proQuantity = request.getParameter("proQuantity");
					String proDescription = request.getParameter("proDescription");
					int proCategory =Integer.parseInt(request.getParameter("cid")) ;	
					
					System.out.println("++++++"+proCategory+"pro name"+proName);
					Part part=request.getPart("propic");
					
					CategoryDao cdao=new CategoryDao(Databaseconn.getConnection());
					Category category = cdao.getCategoryById(proCategory);
					System.out.println("++++++++++"+category);
					
					HttpSession session=request.getSession(); 
					
					
						
					
					// save the image in directory
					  String fileName = part.getSubmittedFileName();
					  
					  // use for random id
					  String randomId  = UUID.randomUUID().toString();
					  
					  String realFileName = randomId +"-"+fileName;
					  
					  String uploadFileName=".././upload/"+realFileName;
					  
					  System.out.println(realFileName);
					  
					  String appPath =  getServletContext().getRealPath("");
					   System.out.println(appPath);
					   String uploadDir = appPath + "upload";
					   
					   System.out.println(uploadDir);
					   File uploadDirectory = new File(uploadDir);
			        if (!uploadDirectory.exists()) {
			            uploadDirectory.mkdirs();
			        }
			        File file = new File(uploadDirectory, realFileName);
			        part.write(file.getAbsolutePath());
			        
			        

					Product pro=new Product();
					pro.setPname(proName);
					pro.setPprice(Double.parseDouble(proPrice));
					pro.setPdiscount(Double.parseDouble(proDiscount));
					pro.setPquantity(Integer.parseInt(proQuantity));
					pro.setPdesc(proDescription);
					pro.setCategory(category);
					
					pro.setPphoto(realFileName);
			        
			        // Save the file to the upload directory
			        ProductDao pdo=new ProductDao(Databaseconn.getConnection());
			        
			        String message = pdo.saveProduct(pro);
					if(message.equals("Success")) {
 						System.out.println("ser product reg");
						session.setAttribute("message","Product Successfull  Added !!!");
							response.sendRedirect("admin.jsp");
					}
					else if(message.equals("Failure")){
						System.out.println("ser product not reg");
						session.setAttribute("message", "Product Not Added !!!");
						response.sendRedirect("admin.jsp");
					}
					else {
						System.out.println("Data not found");
						response.sendRedirect("admin.jsp");
					}

				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
				
			}

}
