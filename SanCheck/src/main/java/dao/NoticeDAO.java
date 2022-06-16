package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT count(*) FROM notice_tbl";
		} else {
			sql = "SELECT count(*) FROM notice_tbl WHERE ? LIKE '%?%'";
		}
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, items);
			pstmt.setString(2, text);
			rs = pstmt.executeQuery();
			
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
				if(pstmt != null) {
					pstmt.close();
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
	public List<NoticeDTO> getNoticeList(int pageNum, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(items, text);
		int start = (pageNum - 1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(items == null && text == null) {
			sql = "SELECT * FROM notice_tbl ORDER BY notice_no DESC";
		} else {
			sql = "SELECT * FROM notice_tbl WHERE ? LIKE '%?%' ORDER BY notice_no DESC";
		}
		
		ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, items);
			pstmt.setString(2, text);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_no(0);
				notice.setNotice_nickname(rs.getString("notice_nickname"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("content"));
			}
		} catch (Exception e) {
			
		}
		
		
		
		
		
		
		
		
		return null;
	}

	public String getLoginNameById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void insertNotice(NoticeDTO notice) {
		// TODO Auto-generated method stub
		
	}

	public NoticeDTO getNoticeListByNum(int num, int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public void deleteNotice(int num) {
		// TODO Auto-generated method stub
		
	}

	public void updateNotice(NoticeDTO notice) {
		// TODO Auto-generated method stub
		
	}

}
