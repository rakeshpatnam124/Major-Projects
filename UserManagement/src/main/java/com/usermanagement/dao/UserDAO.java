package com.usermanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.usermanagement.model.User;

public class UserDAO {
	private static String url = "jdbc:mysql://localhost:3306/usermanagement";
	private static String userName = "root";
	private static String password = "root";
	
	private static final String insertUser = "INSERT INTO users" + "(name, email, country) VALUES" + "(?, ?, ?);";
	private static final String selectUser = "SELECT id, name, email, country FROM users WHERE id = ?;";
	private static final String selectAllUsers = "SELECT * FROM users;";
	private static final String deleteUser = "DELETE FROM users WHERE id = ?;";
	private static final String updateUser = "UPDATE users SET name = ?, email = ?, country = ? WHERE id = ?;";
	
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, userName, password);			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	//Insert User
	public void insertUser (User user) throws SQLException {
		try (Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(insertUser)){
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getCountry());
			ps.executeUpdate();	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//Update User
	public boolean updateUser (User user) throws SQLException {
		boolean updateFlag;
		try (Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(updateUser)){
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getCountry());
			ps.setInt(4,  user.getId());
			updateFlag = ps.executeUpdate() > 0;
			
		}
		return updateFlag;
	}
	
	//Select User
	public User selectUser (int id) {
		User user = null;
		try (Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(selectUser)) {
			ps.setInt(1,  id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				user = new User(id, name, email, country);
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//Select All Users
	public List<User> selectAllUsers() {
		List<User> users = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(selectAllUsers)) {
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				users.add(new User(id, name, email, country));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	//Delete Users
	public boolean deleteUser (int id) throws SQLException {
		boolean deleteFlag;
		try (Connection connection = getConnection();
				PreparedStatement ps = connection.prepareStatement(deleteUser)) {
			ps.setInt(1, id);
			deleteFlag = ps.executeUpdate() > 0;
		}
		return deleteFlag;
	}
}
