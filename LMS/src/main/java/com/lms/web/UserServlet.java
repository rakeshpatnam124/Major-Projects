package com.lms.web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
import com.lms.beans.IssuedBook;
import com.lms.beans.User;
import com.lms.beans.UserBooks;
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
		case "/searchReservedBook":
			try {
				searchReservedBook(request, response);
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
			
		case "/unreserveBook":
			try {
				unreserveBook(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/reserveBookReservedBooksPage":
			try {
				reserveBookReservedBooksPage(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/unreserveBookReservedBooksPage":
			try {
				unreserveBookReservedBooksPage(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/reservedBooks":
			try {
				reservedBooks(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			break;
		case "/showUsers":
			try {
				showUsers(request, response);
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

	// Register User
	public void registerUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
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

	// Login Validation
	public void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String idNumber = request.getParameter("idNumber").toLowerCase().trim();
		String password = request.getParameter("password").trim();
		String role = request.getParameter("role");

		boolean isValidUser = userDAO.validateUser(idNumber, password, role);
		HttpSession session = request.getSession();

		if (isValidUser && "Librarian".equals(role)) {
			request.setAttribute("status", "success");
			session.setAttribute("idNumber", idNumber);
			session.setAttribute("role", 0);
			request.getRequestDispatcher("homeLibrarian.jsp").forward(request, response);
		} else if (isValidUser && "Student".equals(role)) {
			request.setAttribute("status", "success");
			session.setAttribute("idNumber", idNumber);
			session.setAttribute("role", 1);
			request.getRequestDispatcher("homeStudent.jsp").forward(request, response);
		} else {
			request.setAttribute("status", "failure");
			response.sendRedirect("login.jsp");
		}
	}

	// Add Book
	public void addBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
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

	// Delete User
	public void deleteBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();

		userDAO.deleteBook(bname);
		request.getRequestDispatcher("homeLibrarian.jsp").forward(request, response);
	}

	// All Books
	public void allBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<Book> bookList = userDAO.selectAllBooks();

		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");

		int rid = userDAO.getRid(idNumber.trim());
		List<Integer> userBookList = userDAO.userBookList(rid);
		UserBooks userBooks = new UserBooks(rid, userBookList);

		request.setAttribute("userBookList", userBooks);
		request.setAttribute("allBooks", bookList);
		request.getRequestDispatcher("allBooks.jsp").forward(request, response);
	}

	// Search Book By Name
	public void searchBookByName(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();
		Book book = userDAO.selectBook(bname);

		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");

		int rid = userDAO.getRid(idNumber.trim());
		List<Integer> userBookList = userDAO.userBookList(rid);
		UserBooks userBooks = new UserBooks(rid, userBookList);

		request.setAttribute("userBooks", userBooks);
		request.setAttribute("searchedBook", book);
		request.getRequestDispatcher("searchBookByName.jsp").forward(request, response);
	}

	// Search Reserved Book
	public void searchReservedBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String bname = request.getParameter("bname").trim();

		Book book = userDAO.selectBook(bname);
		request.setAttribute("searchedBook", book);
		request.getRequestDispatcher("searchBookByName.jsp").forward(request, response);
	}

	// Reserve Book
	public void reserveBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int bid = Integer.parseInt(request.getParameter("bid"));

		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");

		LocalDate localDate = LocalDate.now();
		String date = localDate.toString();
		System.out.println(date);
		
		int rid = userDAO.getRid(idNumber.trim());

		boolean reserveFlag = userDAO.reserveBook(rid, bid, date);

		if (reserveFlag) {
			response.sendRedirect("allBooks");
		} else {
			response.sendRedirect("allbooks");
		}
	}
	
	// Reserve Book Return to Reserved Books Page
	public void reserveBookReservedBooksPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");
		
		Date localDate = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");
		String date = dateFormat.format(localDate);
		
		
		int rid = userDAO.getRid(idNumber.trim());
		
		boolean reserveFlag = userDAO.reserveBook(rid, bid, date);
		
		if (reserveFlag) {
			response.sendRedirect("reservedBooks");
		} else {
			response.sendRedirect("reservedBooks");
		}
	}

	// UnReserve Book
	public void unreserveBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int bid = Integer.parseInt(request.getParameter("bid"));

		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");

		int rid = userDAO.getRid(idNumber.trim());

		boolean unreserveFlag = userDAO.unreserveBook(rid, bid);

		if (unreserveFlag) {
			response.sendRedirect("allBooks");
		} else {
			response.sendRedirect("allBooks");
		}
	}
	
	// UnReserve Book Return to Reserved Books Page
	public void unreserveBookReservedBooksPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");
		
		int rid = userDAO.getRid(idNumber.trim());
		
		boolean unreserveFlag = userDAO.unreserveBook(rid, bid);
		
		if (unreserveFlag) {
			response.sendRedirect("reservedBooks");
		} else {
			response.sendRedirect("reservedBooks");
		}
	}

	// Show Reserved Books
	public void reservedBooks(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		String idNumber = (String) session.getAttribute("idNumber");

		int rid = userDAO.getRid(idNumber.trim());
		List<IssuedBook> userReservedBooks = userDAO.userBookListWithDates(rid);
		
		List<Integer> userBookList = userDAO.userBookList(rid);
		UserBooks userBooks = new UserBooks(rid, userBookList);

		request.setAttribute("userBookList", userBooks);
		request.setAttribute("userReservedBooks", userReservedBooks);
		request.getRequestDispatcher("reservedBooks.jsp").forward(request, response);
	}

	// Show Users
	public void showUsers(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<User> userList = userDAO.selectAllUsers();

		request.setAttribute("userList", userList);
		request.getRequestDispatcher("members.jsp").forward(request, response);
	}

	// Logout
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
}
