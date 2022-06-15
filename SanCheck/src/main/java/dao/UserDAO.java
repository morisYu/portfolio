package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbconnect.DBConnection;
import dto.UserDTO;

public class UserDAO {
	private UserDAO instance;
	
	private UserDAO() {
		
	}
	
	public UserDAO getInstance() {
		if(instance == null) {
			instance = new UserDAO();
		}
		return instance;
	}
	
	// 전체 사용자 정보 가져오기(관리자 전용)
	public List<UserDTO> getUserList() throws ClassNotFoundException, SQLException{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM user_tbl";
		
		conn = DBConnection.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		List<UserDTO> userList = new ArrayList<UserDTO>();
		
		while(rs.next()) {
			UserDTO user = new UserDTO();
			user.setUser_no(rs.getInt("user_no"));
			user.setUser_id(rs.getString("user_id"));
			user.setUser_password(rs.getString("user_password"));
			user.setUser_name(rs.getString("user_name"));
			user.setUser_nickname(rs.getString("user_nickname"));
			user.setUser_mobile(rs.getString("user_mobile"));
			user.setUser_region(rs.getString("user_region"));
			user.setUser_region(rs.getString("user_email"));
			user.setUser_grade(rs.getString("user_grade"));
			user.setUser_join_date(rs.getString("user_join_date"));
			
			userList.add(user);
		}
		
		if(rs != null) {
			rs.close();
		}
		if(stmt != null) {
			stmt.close();
		}
		if(conn != null) {
			conn.close();
		}
		
		return userList;
	}
	
	// 사용자 정보 수정(사용자 전용)
	public void updateUserInfo(UserDTO user) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE user_tbl SET user_password = ?, user_name = ?, user_nickname = ?, "
				+ " user_mobile = ?, user_region = ?, user_email = ? WHERE user_id = ?";
		
		conn = DBConnection.getConnection();
		conn.setAutoCommit(false);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUser_password());
		pstmt.setString(2, user.getUser_name());
		pstmt.setString(3, user.getUser_nickname());
		pstmt.setString(4, user.getUser_mobile());
		pstmt.setString(5, user.getUser_region());
		pstmt.setString(6, user.getUser_email());
		pstmt.setString(7, user.getUser_id());
		
		pstmt.executeUpdate();
		conn.commit();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
	// 사용자 정보 삭제
	public void deleteUser(String user_id) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM user_tbl WHERE user_id = ?";
		
		conn = DBConnection.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);
		
		pstmt.executeUpdate();
		
		if(pstmt != null) {
			pstmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
}