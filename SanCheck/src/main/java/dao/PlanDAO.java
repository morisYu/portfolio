package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	
	// 일정 목록 가지고오기
	public List<PlanDTO> getPlanList(String plan_id, String year_month){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		if(plan_id != null) {
			sql = "SELECT * FROM plan_tbl WHERE plan_id IN('admin','" + plan_id + "') AND plan_reg_date LIKE '%" + year_month + "%'";
		} else {
			sql = "SELECT * FROM plan_tbl WHERE plan_id='admin' AND plan_reg_date LIKE '%" + year_month + "%'";
		}
		
		List<PlanDTO> planList = new ArrayList<PlanDTO>();
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				PlanDTO plan = new PlanDTO();
				
				plan.setPlan_no(rs.getInt("plan_no"));
				plan.setPlan_id(rs.getString("plan_id"));
				plan.setPlan_kind(rs.getString("plan_kind"));
				plan.setPlan_content(rs.getString("plan_content"));
				plan.setPlan_color(rs.getString("plan_color"));
				plan.setPlan_reg_date(rs.getString("plan_reg_date"));
				
				planList.add(plan);
			}
			
		} catch (Exception e) {
			System.out.println("getPlanList() 에러: " + e.getMessage());
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(rs != null) {
					rs.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return planList;
	}
	
	// 선택한 일정 가지고오기
	public PlanDTO getPlan(int plan_no) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PlanDTO plan = new PlanDTO();
		String sql = "SELECT * FROM plan_tbl WHERE plan_no=" + plan_no;
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				plan.setPlan_no(rs.getInt("plan_no"));
				plan.setPlan_id(rs.getString("plan_id"));
				plan.setPlan_kind(rs.getString("plan_kind"));
				plan.setPlan_content(rs.getString("plan_content"));
				plan.setPlan_color(rs.getString("plan_color"));
				plan.setPlan_reg_date(rs.getString("plan_reg_date"));
			}
			
		} catch (Exception e) {
			System.out.println("getPlan() 에러: " + e.getMessage());
		} finally {
			try {
				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return plan;
	}
	
	// 일정 수정하기
	public void updatePlan(PlanDTO plan) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE plan_tbl SET plan_kind=?, plan_color=?, plan_content=?, plan_reg_date=? "
					+ " WHERE plan_no=?";
		
		try {
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, plan.getPlan_kind());
			pstmt.setString(2, plan.getPlan_color());
			pstmt.setString(3, plan.getPlan_content());
			pstmt.setString(4, plan.getPlan_reg_date());
			pstmt.setInt(5, plan.getPlan_no());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updatePlan()에러: " + e);
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
	
	// 일정 삭제하기
	public void deletePlan(int plan_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM plan_tbl WHERE plan_no=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, plan_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deletePlan()에러: " + e);
		} finally {
			try {
				
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
}



















