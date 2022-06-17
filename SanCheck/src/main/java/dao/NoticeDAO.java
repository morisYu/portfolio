package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dbconnect.DBConnection;
import dto.NoticeDTO;

public class NoticeDAO {
	
	private static NoticeDAO instance;

	private NoticeDAO() {
		
	}
	
	public static NoticeDAO getInstance() {
		if(instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	// 검색된 공지사항 갯수 확인
	public int getListCount() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql = "SELECT count(*) FROM notice_tbl";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getListCount() 에러: " + e);
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
			} catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return x;
	}

	// 공지사항 목록 가져오기
	public List<NoticeDTO> getNoticeList(int pageNum, int limit) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount();
		int start = (pageNum - 1) * limit;
		int index = start + 1;
		
		String sql = "SELECT * FROM notice_tbl ORDER BY notice_no DESC";
		
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_no(rs.getInt("notice_no"));
				notice.setNotice_nickname(rs.getString("notice_nickname"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_reg_date(rs.getString("notice_reg_date"));
				list.add(notice);
				
				if(index < (start + limit) && index <= total_record) {
					index++;
				} else {
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("getNoticeList() 에러 : " + e );
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
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return list;
	}
	
	// 글 번호로 공지사항 항목 가져오기
	public NoticeDTO getNoticeListByNum(int num, int pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeDTO notice = null;
		
		String sql = "SELECT * FROM notice_tbl WHERE notice_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				notice = new NoticeDTO();
				notice.setNotice_no(rs.getInt("notice_no"));
				notice.setNotice_nickname(rs.getString("notice_nickname"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_reg_date(rs.getString("notice_reg_date"));
			}
		} catch (Exception e) {
			System.out.println("getNoticeListByNUm() 에러 : " + e);
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
				
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		
		return notice;
	}

	public String getLoginNameById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertNotice(NoticeDTO notice) {
		// TODO Auto-generated method stub
		
	}

	

	public void deleteNotice(int num) {
		// TODO Auto-generated method stub
		
	}

	public void updateNotice(NoticeDTO notice) {
		// TODO Auto-generated method stub
		
	}

}
