package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	public Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> GetCategory() {
		ArrayList<Category> ls = new ArrayList<Category>();
		try {
			String q = "select * from category";
			Statement stmt = this.con.createStatement();
			ResultSet set = stmt.executeQuery(q);
			while (set.next()) {
//				System.out.println("hi");
				Category c = new Category();
				int id = set.getInt("cId");
				String name = set.getString("cName");
				String desc = set.getString("cDescription");
				c.setCId(id);
				c.setCName(name);
				c.setCDescription(desc);
				ls.add(c);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		/*
		 * System.out.println("we are in postdao"); System.out.println(ls.size());
		 * for(Category c:ls) { System.out.println(c); }
		 */

		return ls;
	}

	public boolean SavePost(Post p) {

		boolean flag = false;
		try {
			String pTitle = p.getpTitle();
			String pContent = p.getpContent();
			String pCode = p.getpCode();
			String pPic = p.getpPic();
			int catId = p.getCatId();
			int userId = p.getUserId();
			String q = "Insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setString(1, pTitle);
			pstmt.setString(2, pContent);
			pstmt.setString(3, pCode);
			pstmt.setString(4, pPic);
			pstmt.setInt(5, catId);
			pstmt.setInt(6, userId);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	public ArrayList<Post> GetAllPost() {
		ArrayList<Post> ls = new ArrayList<Post>();
		try {
			String q = "select * from post order by pDate DESC";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int pCatId = rs.getInt("catId");
				int UserId = rs.getInt("UserId");

				Post p1 = new Post();
				p1.setCatId(pCatId);
				p1.setpCode(pCode);
				p1.setpTitle(pTitle);
				p1.setUserId(UserId);
				p1.setpPic(pPic);
				p1.setpId(pId);
				p1.setpContent(pContent);
				p1.setpDate(pDate);

				ls.add(p1);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ls;
	}

	public ArrayList<Post> GetPostById(int cId) {
		ArrayList<Post> ls = new ArrayList<Post>();
		try {
			String q = "select * from post where catId=? order by pDate DESC";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, cId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int pCatId = rs.getInt("catId");
				int UserId = rs.getInt("UserId");

				Post p1 = new Post();
				p1.setCatId(pCatId);
				p1.setpCode(pCode);
				p1.setpTitle(pTitle);
				p1.setUserId(UserId);
				p1.setpPic(pPic);
				p1.setpId(pId);
				p1.setpContent(pContent);
				p1.setpDate(pDate);

				ls.add(p1);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return ls;
	}

	public Post GetPostByPostId(int pId) {
		Post p = null;
		try {
			String q = "select * from post where pId=?";
			System.out.println(pId);
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, pId);
			ResultSet set = pstmt.executeQuery();
			while (set.next()) {
				int id = set.getInt("pId");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int pCatId = set.getInt("catId");
				int UserId = set.getInt("UserId");
				p=new Post(id, pTitle, pContent, pCode, pPic, pDate, pCatId, UserId);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return p;
	}
}
