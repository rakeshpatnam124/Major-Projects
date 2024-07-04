package com.lms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.lms.beans.Book;
import com.lms.beans.User;
import com.lms.jdbc.Factory;

public class UserDAO {
	private static final String insertUser = "insert into register(name, email, password, mobile, address, role) values(?, ?, ?, ?, ?, ?);";
	private static final String insertBook = "insert into book(bname, author, price, publisher, publishingYear, quantityAvailable, idNumber) values(?, ?, ?, ?, ?, ?, ?);";
	private static final String validateUser = "select * from register where idNumber = ? and password = ? and role = ?;";
	private static final String deleteBook = "delete from book where bname = ?;";
	private static final String selectAllBooks = "select * from book;";
	private static final String selectBook = "select * from book where bname = ?;";
	private static final String reserveBook = "insert into book_issued(bid, bname, rid, reservedDate) values(?, ?, ?, ?);";
	private static final String updatebookCount = "update book set quantityAvailable = quantityAvailable - 1 where quantityAvailable > 0 and bname = ?;";
	private static final String selectReservedRecords = "select bname from book_issued where rid = ?;";
	
	Connection connection;
	PreparedStatement ps;
	
	public UserDAO() {
		this.connection = Factory.getConnection();
	}
	
	//Insert User
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
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//Insert Book
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
	
	//Validate User
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
		}catch(Exception e) {
			e.printStackTrace();
		}
		return exist;
	}
	
	//Delete User
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
	
	//Select All Books
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
	
	//Select Book
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
	
	//Reserve Book
	public boolean reserveBook(int rid, String bname, String date) {
		boolean flag = false;
		try {
			List<String> reservedBookNames = new ArrayList<>();
			ps = connection.prepareStatement(selectReservedRecords);
			ps.setInt(1, rid);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				String bookName = rs.getString("bname");
				reservedBookNames.add(bookName);
			}
			
			if (reservedBookNames.contains(bname)) {
				flag = false;
			}
			else {
				ps = connection.prepareStatement(reserveBook);
				Book book = selectBook(bname);
			
				ps.setInt(1, book.getBid());
				ps.setString(2, bname);
				ps.setInt(3, rid);
				ps.setString(4, date);
				flag = ps.executeUpdate() > 0;
				
				ps = connection.prepareStatement(updatebookCount);
				ps.setString(1, bname);
				ps.executeUpdate();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
