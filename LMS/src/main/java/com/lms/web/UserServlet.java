package com.lms.web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.beans.Book;
import com.lms.beans.User;
import com.lms.dao.UserDAO;

@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDAO userDAO;

	public UserServlet() {
		super();
		this.userDAO = new UserDAO();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/register":
			try {
				registerUser(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/login":
			try {
				loginUser(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
	case "/addBook":
		try {
			addBook(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	case "/deleteBook":
		try {
			deleteBook(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	case "/allBooks":
		try {
			allBooks(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	case "/searchBookByName":
		try {
			searchBookByName(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	case "/reserveBook":
		try {
			reserveBook(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	case "/logout":
		try {
			logout(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		break;
	}
}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	//Register User
	public void registerUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String name = request.getParameter("name").trim();
		String rollNumber = request.getParameter("idNumber").trim();
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		String mobile = request.getParameter("mobile").trim();
		String address = request.getParameter("address").trim();
		String role = request.getParameter("role");
		
		User user = new User(name, rollNumber, email, password, mobile, address, role);
		userDAO.insertUser(user);
		request.setAttribute("status", "success");
		response.sendRedirect("register.jsp");
	}
	
	//Login Validation 
	public void loginUser (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String idNumber = request.getParameter("idNumber").toLowerCase().trim();
		String password = request.getParameter("password").trim();
		String role = request.getParameter("role");
		
		boolean isValidUser = userDAO.validateUser(idNumber, password, role);
		HttpSession session = request.getSession();
		
		if (isValidUser && "Librarian".equals(role)) {
			request.setAttribute("status", "success");
			session.setAttribute("idNumber", idNumber);
			request.getRequestDispatcher("homeLibrarian.jsp").forward(request, response);
		}
		else if (isValidUser && "Student".equals(role)) {
			request.setAttribute("status", "success");
			session.setAttribute("idNumber", idNumber);
			request.getRequestDispatcher("homeStudent.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "failure");
			response.sendRedirect("login.jsp");
		}
	}
	
	//Add Book
	public void addBook (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname");
		String author = request.getParameter("author");
		int price = Integer.parseInt(request.getParameter("price"));
		String publisher = request.getParameter("publisher");
		int publishingYear = Integer.parseInt(request.getParameter("publishingYear"));
		int quantityAvailable = Integer.parseInt(request.getParameter("quantityAvailable"));
		
		Book book = new Book(bname, author, price, publisher, publishingYear, quantityAvailable);
		userDAO.insertBook(book);
		request.getRequestDispatcher("homeLibrarian.jsp").forward(request, response);
	}
	
	//Delete User
	public void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();
		
		userDAO.deleteBook(bname);
		request.getRequestDispatcher("homeLibrarian.jsp").forward(request, response);
	}
	
	//All Books
	public void allBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		List<Book> bookList = userDAO.selectAllBooks();
		
		request.setAttribute("allBooks", bookList);
		request.getRequestDispatcher("allBooks.jsp").forward(request, response);
	}
	
	//Search Book By Name
	public void searchBookByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();
		
		Book book = userDAO.selectBook(bname);
		request.setAttribute("searchedBook", book);
		request.getRequestDispatcher("searchBookByName.jsp").forward(request, response);
		
	}
	
	//Reserve Book
	public void reserveBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();
		
		HttpSession session = request.getSession();
		int idNumber = (int) session.getAttribute("idNumber");
		
		Date localDate = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
		String date = dateFormat.format(localDate);
		
		boolean reserveFlag = userDAO.reserveBook(idNumber, bname, date);
		
		if (reserveFlag) {
			
		}
		
		
		
		
		
		
	}
	
	//Logout
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
}
