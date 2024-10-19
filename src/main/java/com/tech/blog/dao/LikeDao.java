package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean InsertLikeByUser(int PostId, int UserId) {
		boolean flag = false;
		try {
			String q = "Insert into Likes(PId,UId) values (?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, PostId);
			pstmt.setInt(2, UserId);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	public int CountLikeOnPost(int PostId) {

		int cnt = 0;

		try {
			String q = "Select Count(*) from Likes where PId=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, PostId);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				int val = set.getInt("Count(*)");
				cnt = val;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public boolean DeleteLike(int PostId, int UserId) {
		boolean flag = false;

		try {
			String q = "Delete from Likes where PId=? AND UId=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, PostId);
			pstmt.setInt(2, UserId);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	public boolean IsLikedByUser(int PostId, int UserId) {
		boolean flag = false;

		try {

			String q = "Select Count(*) from Likes where PId=? AND UId=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, PostId);
			pstmt.setInt(2, UserId);

			ResultSet rs = pstmt.executeQuery();

			int cnt = 0;
			if (rs.next()) {
				cnt = rs.getInt("Count(*)");
			}
			if (cnt > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}
}
