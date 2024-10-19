package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.cj.Query;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

//   method to insert user to database
	public boolean SaveUser(User user) {
		boolean flag = false;
		try {
			String q = "insert into user(name,mail,password,gender,about) values (?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, user.getName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getGender());
			stmt.setString(5, user.getAbout());

			stmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean UpdateUser(User user) {
		boolean flag = false;
		try {
			String q = "Update user SET name=?, mail=?,password=? ,gender=?,about=? ,profile=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());

			pstmt.executeUpdate();
			flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;

	}

	public User GetUser(String mail, String password) {

		User u = null;
		try {
			String q = "select * from user  where mail=? and password=?";
			PreparedStatement stmt = con.prepareStatement(q);
			stmt.setString(1, mail);
			stmt.setString(2, password);

//			give the result in form of table 
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				u = new User();

				String name = rs.getString("Name");
				u.setName(name);

				u.setEmail(rs.getString("mail"));
				u.setPassword(rs.getString("password"));
				u.setGender(rs.getString("gender"));
				u.setAbout(rs.getString("about"));
				u.setId(rs.getInt("Id"));
				u.setRtime(rs.getTimestamp("rdate"));
				u.setProfile(rs.getString("profile"));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return u;
	}
	
	public User GetUserById(int user_id) {
		User user=null;
		try {
			String q="select * from user where Id=? ";
			PreparedStatement pstmt=con.prepareStatement(q);
			pstmt.setInt(1, user_id);
		    ResultSet set=pstmt.executeQuery();
		    user=new User();
		    while(set.next()) {

				String name = set.getString("Name");
				user.setName(name);

				user.setEmail(set.getString("mail"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setId(set.getInt("Id"));
				user.setRtime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	

}
