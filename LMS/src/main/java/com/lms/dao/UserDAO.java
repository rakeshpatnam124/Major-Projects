package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lms.beans.Book;
import com.lms.beans.IssuedBook;
import com.lms.beans.User;
import com.lms.jdbc.Factory;

public class UserDAO {
	private static final String insertUser = "insert into register(name, email, password, mobile, address, role) values(?, ?, ?, ?, ?, ?);";
	private static final String insertBook = "insert into book(bname, author, price, publisher, publishingYear, quantityAvailable, idNumber) values(?, ?, ?, ?, ?, ?, ?);";
	private static final String validateUser = "select * from register where idNumber = ? and password = ? and role = ?;";
	private static final String deleteBook = "delete from book where bname = ?;";
	private static final String selectAllBooks = "select * from book;";
	private static final String selectBook = "select * from book where bname = ?;";
	private static final String selectReservedBook = "select bid, bname, reservedDate from book where bname = ?;";
	private static final String selectBookById = "select * from book where bid = ?;";
	private static final String reserveBook = "insert into book_issued(bid, bname, rid, reservedDate) values(?, ?, ?, ?);";
	private static final String unreserveBook = "delete from book_issued where rid = ? and bid = ?;";
	private static final String updateBookCountDecrement = "update book set quantityAvailable = quantityAvailable - 1 where quantityAvailable > 0 and bid = ?;";
	private static final String updateBookCountIncrement = "update book set quantityAvailable = quantityAvailable + 1 where quantityAvailable >= 0 and bid = ?;";
	private static final String selectReservedRecords = "select bid from book_issued where rid = ?;";
	private static final String selectAllUsers = "select rid, name, idNumber, email, mobile, address, role from register;";
	private static final String selectAllStudents = "select rid, name, idNumber, email, mobile, address from register where role = 'Student';";
	private static final String selectAllLibrarians = "select rid, name, idNumber, email, mobile, address from register where role = 'Librarian';";
	private static final String userBookList = "select bid from book_issued where rid = ?;";
	private static final String userBookListWithDates = "select bid, bname, reservedDate from book_issued where rid = ?;";
	private static final String getRid = "select rid from register where idNumber = ?;";
	Connection connection;
	PreparedStatement ps;

	public UserDAO() {
		this.connection = Factory.getConnection();
	}

	// Insert User
	public void insertUser(User user) {
		try {
			ps = connection.prepareStatement(insertUser);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getMobile());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getRole());
			ps.setString(7, user.getIdNumber());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Insert Book
	public void insertBook(Book book) {
		try {
			ps = connection.prepareStatement(insertBook);
			ps.setString(1, book.getBname());
			ps.setString(2, book.getAuthor());
			ps.setInt(3, book.getPrice());
			ps.setString(4, book.getPublisher());
			ps.setInt(5, book.getPublishingYear());
			ps.setInt(6, book.getQuantityAvailable());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Validate User
	public boolean validateUser(String idNumber, String password, String role) {
		boolean exist = false;
		try {
			ps = connection.prepareStatement(validateUser);
			ps.setString(1, idNumber);
			ps.setString(2, password);
			ps.setString(3, role);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				exist = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exist;
	}

	// Delete User
	public boolean deleteBook(String bname) {
		boolean rowsDeleted = false;
		try {
			ps = connection.prepareStatement(deleteBook);
			ps.setString(1, bname);
			rowsDeleted = ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowsDeleted;
	}

	// Select All Books
	public List<Book> selectAllBooks() {
		List<Book> bookList = new ArrayList<Book>();
		try {
			ps = connection.prepareStatement(selectAllBooks);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bid");
				String bname = rs.getString("bname");
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				int publishingYear = rs.getInt("publishingYear");
				int quantityAvailable = rs.getInt("quantityAvailable");
				bookList.add(new Book(bid, bname, author, price, publisher, publishingYear, quantityAvailable));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}

	// Select Book
	public Book selectBook(String bookName) {
		Book book = null;
		try {
			ps = connection.prepareStatement(selectBook);
			ps.setString(1, bookName);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bid");
				String bname = rs.getString("bname");
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				int publishingYear = rs.getInt("publishingYear");
				int quantityAvailable = rs.getInt("quantityAvailable");
				book = new Book(bid, bname, author, price, publisher, publishingYear, quantityAvailable);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	// Select Reserved Book
	public Book selectReservedBook(String bookName) {
		Book book = null;
		try {
			ps = connection.prepareStatement(selectReservedBook);
			ps.setString(1, bookName);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bid");
				String bname = rs.getString("bname");
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				int publishingYear = rs.getInt("publishingYear");
				int quantityAvailable = rs.getInt("quantityAvailable");
				book = new Book(bid, bname, author, price, publisher, publishingYear, quantityAvailable);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	// Select Book by Id
	public Book selectBookById(int bid) {
		Book book = null;
		try {
			ps = connection.prepareStatement(selectBookById);
			ps.setInt(1, bid);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int bookId = rs.getInt("bid");
				String bname = rs.getString("bname");
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				int publishingYear = rs.getInt("publishingYear");
				int quantityAvailable = rs.getInt("quantityAvailable");
				book = new Book(bookId, bname, author, price, publisher, publishingYear, quantityAvailable);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	// Reserve Book
	public boolean reserveBook(int rid, int bid, String date) {
		boolean flag = false;
		try {
			List<Integer> reservedBookIDs = new ArrayList<>();
			ps = connection.prepareStatement(selectReservedRecords);
			ps.setInt(1, rid);
			ResultSet rs = ps.executeQuery();

			Book book = selectBookById(bid);
			if (book.getQuantityAvailable() > 0) {
				while (rs.next()) {
					int bookId = rs.getInt("bid");
					reservedBookIDs.add(bookId);
				}

				if (reservedBookIDs.contains(bid)) {
					flag = false;
					return flag;
				}

				PreparedStatement ps1 = connection.prepareStatement(reserveBook);
				
				ps1.setInt(1, bid);
				ps1.setString(2, book.getBname());
				ps1.setInt(3, rid);
				ps1.setString(4, date);
				flag = ps1.executeUpdate() > 0;

				PreparedStatement ps2 = connection.prepareStatement(updateBookCountDecrement);
				ps2.setInt(1, bid);
				ps2.executeUpdate();
			}
			else {
				flag = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// UnReserve Book
	public boolean unreserveBook(int rid, int bid) {
		boolean flag = false;
		try {
			ps = connection.prepareStatement(unreserveBook);
			ps.setInt(1, rid);
			ps.setInt(2, bid);
			flag = ps.executeUpdate() > 0;
			
			PreparedStatement ps1 = connection.prepareStatement(updateBookCountIncrement);
			ps1.setInt(1, bid);
			ps1.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// User Book List
	public List<Integer> userBookList(int rid) {
		List<Integer> bookList = new ArrayList<>();
		try {
			ps = connection.prepareStatement(userBookList);
			ps.setInt(1, rid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bid");
				bookList.add(bid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}

	// User Book List with Reserved Dates
	public List<IssuedBook> userBookListWithDates(int rid) {
		List<IssuedBook> bookList = new ArrayList<>();
		try {
			ps = connection.prepareStatement(userBookListWithDates);
			ps.setInt(1, rid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int bid = rs.getInt("bid");
				String bname = rs.getString("bname");
				String date = rs.getString("reservedDate");
				bookList.add(new IssuedBook(bid, bname, date));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}

	// Show All Users
	public List<User> selectAllUsers() {
		List<User> userList = new ArrayList<User>();
		try {
			ps = connection.prepareStatement(selectAllUsers);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int sno = rs.getInt("rid");
				String name = rs.getString("name").trim();
				String id = rs.getString("idNumber").trim();
				String email = rs.getString("email").trim();
				String mobile = rs.getString("mobile").trim();
				String address = rs.getString("address").trim();
				String role = rs.getString("role").trim();
				userList.add(new User(sno, name, id, email, mobile, address, role));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userList;
	}

	// Show All Students
	public List<User> selectAllStudents() {
		List<User> studentList = new ArrayList<User>();
		try {
			ps = connection.prepareStatement(selectAllStudents);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int sno = rs.getInt("rid");
				String name = rs.getString("name");
				String id = rs.getString("idNumber");
				String email = rs.getString("email");
				String mobile = rs.getString("mobile");
				String address = rs.getString("address");
				studentList.add(new User(sno, name, id, email, mobile, address));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentList;
	}

	// Show ALL Librarians
	public List<User> selectAllLibrarians() {
		List<User> librarianList = new ArrayList<User>();
		try {
			ps = connection.prepareStatement(selectAllLibrarians);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int sno = rs.getInt("rid");
				String name = rs.getString("name");
				String id = rs.getString("idNumber");
				String email = rs.getString("email");
				String mobile = rs.getString("mobile");
				String address = rs.getString("address");
				librarianList.add(new User(sno, name, id, email, mobile, address));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return librarianList;
	}

	// Get Rid
	public int getRid(String idNumber) {
		int rid = 0;
		try {
			ps = connection.prepareStatement(getRid);
			ps.setString(1, idNumber);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				rid = rs.getInt("rid");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return rid;
	}
}
