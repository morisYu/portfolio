package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbconnect.DBConnection;
import dto.PlaceDTO;

public class PlaceDAO {
	private static PlaceDAO instance;
	
	private PlaceDAO() {
		
	}
	
	public static PlaceDAO getInstance() {
		if(instance == null) {
			instance = new PlaceDAO();
		}
		return instance;
	}
	
	// 검색된 장소정보 목록 갯수
	public int getPlaceCount(String items, String text) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		
		String sql = null;
		
		if(items != null && text != null) {
			sql = "SELECT count(*) FROM place_tbl WHERE " + items + " LIKE '%" + text + "%'";
		} else {
			sql = "SELECT count(*) FROM place_tbl";
		}
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getPlaceCount() 에러 : " + e.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return count;
	}
	
	// 장소정보 번호로 항목 가져오기
	public PlaceDTO getPlaceByNum(int num) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		PlaceDTO place = new PlaceDTO();
		
		String sql = "SELECT * FROM place_tbl WHERE place_no = " + num;
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			place.setPlace_no(rs.getInt("place_no"));
			place.setPlace_name(rs.getString("place_name"));
			place.setPlace_addr(rs.getString("place_addr"));
			place.setPlace_tel(rs.getString("place_tel"));
			place.setPlace_business_hours(rs.getString("place_business_hours"));
			place.setPlace_other(rs.getString("place_other"));
			place.setPlace_photo(rs.getString("place_photo"));
			
		} catch (Exception e) {
			System.out.println("getPlaceByNum() 에러 : " + e.getMessage());
		} finally {
			try {
				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return place;
	}
	
	// 장소정보 목록 가져오기
	public List<PlaceDTO> getPlaceList(String items, String text){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = null;
		
		if(items != null && text != null) {
			sql = "SELECT * FROM place_tbl WHERE " + items + " LIKE '%" + text + "%'";
		} else {
			sql = "SELECT * FROM place_tbl";
		}
		
		List<PlaceDTO> placeList = new ArrayList<PlaceDTO>();
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				PlaceDTO place = new PlaceDTO();
				
				place.setPlace_no(rs.getInt("place_no"));
				place.setPlace_name(rs.getString("place_name"));
				place.setPlace_addr(rs.getString("place_addr"));
				place.setPlace_tel(rs.getString("place_tel"));
				place.setPlace_business_hours(rs.getString("place_business_hours"));
				place.setPlace_other(rs.getString("place_other"));
				place.setPlace_photo(rs.getString("place_photo"));
				
				placeList.add(place);
			}
			
		} catch(Exception e) {
			System.out.println("getPlaceList() 에러 : " + e.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return placeList;
	}
	
	// 장소정보 등록하기
	public void addPlace(PlaceDTO place) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO place_tbl (place_no, place_write_id, place_name, place_addr, place_tel, place_business_hours, place_other, place_photo) "
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, place.getPlace_write_id());
			pstmt.setString(3, place.getPlace_name());
			pstmt.setString(4, place.getPlace_addr());
			pstmt.setString(5, place.getPlace_tel());
			pstmt.setString(6, place.getPlace_business_hours());
			pstmt.setString(7, place.getPlace_other());
			pstmt.setString(8, place.getPlace_photo());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("addPlace() 에러 : " + e.getMessage());
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	// 장소정보 수정하기
	public void updatePlace(PlaceDTO place) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE place_tbl SET place_name = ?, place_addr = ?, place_tel = ?, "
					+ " place_business_hours = ?, place_other = ?, place_photo = ? WHERE place_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, place.getPlace_name());
			pstmt.setString(2, place.getPlace_addr());
			pstmt.setString(3, place.getPlace_tel());
			pstmt.setString(4, place.getPlace_business_hours());
			pstmt.setString(5, place.getPlace_other());
			pstmt.setString(6, place.getPlace_photo());
			pstmt.setInt(7, place.getPlace_no());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updatePlace() 에러 : " + e.getMessage());
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	// 장소정보 삭제하기
	public void deletePlace(int place_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM place_tbl WHERE place_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, place_no);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deletePlace() 에러 : " + e.getMessage());
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	
	// id 로 별명 가져오기
	public String getNicknameById(String user_id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String nickname = null;
					  
		String sql = "SELECT user_nickname FROM user_tbl WHERE user_id = '" + user_id + "'";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				nickname = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("getNicknameById() 에러: " + e.getMessage());
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return nickname;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
