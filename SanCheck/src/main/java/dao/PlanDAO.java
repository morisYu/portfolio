package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbconnect.DBConnection;
import dto.PlanDTO;

public class PlanDAO {
	private static PlanDAO instance;
	
	private PlanDAO() {
		
	}
	
	public static PlanDAO getInstance() {
		if(instance == null) {
			instance = new PlanDAO();
		}
		return instance;
	}
	
	// 일정 등록하기
	public void setPlan(PlanDTO plan) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO plan_tbl (plan_no, plan_id, plan_kind, plan_color, plan_content, plan_reg_date) "
					+ " VALUES (?, ?, ?, ?, ?, ?)";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, plan.getPlan_no());
			pstmt.setString(2, plan.getPlan_id());
			pstmt.setString(3, plan.getPlan_kind());
			pstmt.setString(4, plan.getPlan_color());
			pstmt.setString(5, plan.getPlan_content());
			pstmt.setString(6, plan.getPlan_reg_date());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("setPlan() 에러: " + e);
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



















