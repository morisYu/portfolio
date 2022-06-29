package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbconnect.DBConnection;
import dto.RecordDTO;

public class RecordDAO {
	private static RecordDAO instance;
	
	private RecordDAO() {
		
	}
	
	public static RecordDAO getInstance() {
		if(instance == null) {
			instance = new RecordDAO();
		}
		return instance;
	}
	
	// 사용자 아이디로 별명 가지고오기
	public String getNicknameById(String user_id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String record_nickname = null;
		
		String sql = "SELECT user_nickname FROM user_tbl WHERE user_id='" + user_id + "'";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				record_nickname = rs.getString(1);
			}
			
		} catch (Exception e) {
			System.out.println("getNicknameById() 에러: " + e);
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
		return record_nickname;
	}
	
	// 공개설정된 산책기록 전체 목록 가져오기
	public List<RecordDTO> getRecordListAll(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM record_tbl WHERE record_open = '1'";
		
		List<RecordDTO> recordList = new ArrayList<RecordDTO>();
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				RecordDTO record = new RecordDTO();
				record.setRecord_no(rs.getInt("record_no"));
				record.setRecord_nickname(rs.getString("record_nickname"));
				record.setRecord_title(rs.getString("record_title"));
				record.setRecord_content(rs.getString("record_content"));
				record.setRecord_ip(rs.getString("record_ip"));
				record.setRecord_nice(rs.getInt("record_nice"));
				record.setRecord_open(rs.getInt("record_open"));
				record.setRecord_photo(rs.getString("record_photo"));
				record.setRecord_reg_date(rs.getString("record_reg_date"));
				
				recordList.add(record);
			}
			
		} catch (Exception e) {
			System.out.println("getRecordListAll() 예외: " + e);
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
		return recordList;
	}
	
	// 사용자의 산책기록 목록 가져오기
	public List<RecordDTO> getRecordListByNickname(String record_nickname){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM record_tbl WHERE record_nickname=?";
		
		List<RecordDTO> recordList = new ArrayList<RecordDTO>();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, record_nickname);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RecordDTO record = new RecordDTO();
				
				record.setRecord_no(rs.getInt("record_no"));
				record.setRecord_nickname(rs.getString("record_nickname"));
				record.setRecord_title(rs.getString("record_title"));
				record.setRecord_content(rs.getString("record_content"));
				record.setRecord_ip(rs.getString("record_ip"));
				record.setRecord_nice(rs.getInt("record_nice"));
				record.setRecord_open(rs.getInt("record_open"));
				record.setRecord_photo(rs.getString("record_photo"));
				record.setRecord_reg_date(rs.getString("record_reg_date"));
				
				recordList.add(record);
			}
		} catch (Exception e) {
			System.out.println("getRecordListByNickname() 에러: " + e);
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
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
		return recordList;
	}
	
	// 선택된 산책기록 가져오기
	public RecordDTO getRecord(int record_no) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		RecordDTO record = new RecordDTO();
		String sql = "SELECT * FROM record_tbl WHERE record_no=" + record_no;
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				record.setRecord_content(rs.getString("record_content"));
				record.setRecord_ip(rs.getString("record_ip"));
				record.setRecord_nice(rs.getInt("record_nice"));
				record.setRecord_nickname(rs.getString("record_nickname"));
				record.setRecord_no(rs.getInt("record_no"));
				record.setRecord_open(rs.getInt("record_open"));
				record.setRecord_photo(rs.getString("record_photo"));
				record.setRecord_reg_date(rs.getString("record_reg_date"));
				record.setRecord_title(rs.getString("record_title"));
			}
		} catch (Exception e) {
			System.out.println("getRecord() 에러: " + e);
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
		return record;
	}
	
	// 산책기록 작성하기
	public void setRecord(RecordDTO record) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO record_tbl VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, record.getRecord_no());
			pstmt.setString(2, record.getRecord_nickname());
			pstmt.setString(3, record.getRecord_title());
			pstmt.setString(4, record.getRecord_content());
			pstmt.setString(5, record.getRecord_photo());
			pstmt.setInt(6, record.getRecord_nice());
			pstmt.setString(7, record.getRecord_reg_date());
			pstmt.setInt(8, record.getRecord_open());
			pstmt.setString(9, record.getRecord_ip());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("setRecord() 에러: " + e);
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
	
	// 산책기록 수정하기
	public void updateRecord(RecordDTO record) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE INTO record_tbl SET record_title=?, record_content=?, record_photo=?, record_nice=?, record_reg_date=?, "
					+ " record_open=?, record_ip=? WHERE record_no=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, record.getRecord_title());
			pstmt.setString(2, record.getRecord_content());
			pstmt.setString(3, record.getRecord_photo());
			pstmt.setInt(4, record.getRecord_nice());
			pstmt.setString(5, record.getRecord_reg_date());
			pstmt.setInt(6, record.getRecord_open());
			pstmt.setString(7, record.getRecord_ip());
			pstmt.setInt(8, record.getRecord_no());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateRecord() 에러: " + e);
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
	
	// 산책기록 삭제하기
	public void deleteRecord(int record_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM record_tbl WHERE record_no=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, record_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteRecord() 에러: " + e);
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
}























