package com.usermanagement.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.usermanagement.jdbc.Factory;
import com.usermanagement.model.User;

public class UserDAO {
	private static final String insertQuery = "insert into users(name, email, country) values(?, ?, ?);";
	private static final String updateQuery = "update users set name = ?, email = ?, country = ? where id = ?;";
	private static final String deleteQuery = "delete from users where id = ?;";
	private static final String selectQuery = "select * from users where id = ?;";
	private static final String selectAllQuery = "select * from users;";
	
	Connection connection;
	
	public UserDAO() {
		this.connection = Factory.getConnection();
	}
	
	//Insert User
	public void insertUser(User user) {
		try {
			PreparedStatement ps = connection.prepareStatement(insertQuery);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getCountry());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Update User
	public boolean updateUser(User user) {
		boolean rowsUpdated = false;
		try {
			PreparedStatement ps = connection.prepareStatement(updateQuery);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getCountry());
			ps.setInt(4, user.getId());
			rowsUpdated = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowsUpdated;
	}
	
	//Delete User
	public boolean deleteUser(int id) {
		boolean rowsDeleted = false;
		try {
			PreparedStatement ps = connection.prepareStatement(deleteQuery);
			ps.setInt(1, id);
			rowsDeleted = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rowsDeleted;
	}
	
	//Select User
	public User selectUser(int id) {
		User user = null;
		try {
			PreparedStatement ps = connection.prepareStatement(selectQuery);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				user = new User(name, email, country);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	//Select All Users
	public List<User> selectAllUsers(){
		List<User> userList = new ArrayList<>();
		try {
			PreparedStatement ps = connection.prepareStatement(selectAllQuery);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				userList.add(new User(id, name, email, country));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
}
