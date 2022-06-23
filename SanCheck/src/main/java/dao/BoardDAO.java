package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dbconnect.DBConnection;
import dto.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	
	private BoardDAO () {
		
	}
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	// 검색된 게시판 갯수
	public int getBoardListCount(String items, String text) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		String sql;
		
		if(items != null && text != null) {
			sql = "SELECT count(*) FROM board_tbl WHERE " + items + " LIKE '%" + text +"%'";
		} else {
			sql = "SELECT count(*) FROM board_tbl";
		}
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getBoardListCount() 에러 : " + e);
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
	
	// 페이지 별 검색된 게시판 항목 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_board = getBoardListCount(items, text);
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(items != null && text != null) {
			sql = "SELECT * FROM board_tbl WHERE " + items + " LIKE '%" + text + "%' ORDER BY board_no DESC";
		} else {
			sql = "SELECT * FROM board_tbl ORDER BY board_no DESC";
		}
		
		ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = pstmt.executeQuery();
			
			while(rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_nickname(rs.getString("board_nickname"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_nice(rs.getInt("board_nice"));
				board.setBoard_photo(rs.getString("board_photo"));
				board.setBoard_reg_date(rs.getString("board_reg_date"));
				board.setBoard_ip(rs.getString("board_ip"));
				boardList.add(board);
				
				if(index < (start + limit) && index <= total_board) {
					index++;
				} else {
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("getBoardList() 에러 : " + e);
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
		return boardList;
	}
	
	// 게시판 작성하기
	public void insertBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "INSERT INTO board_tbl VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getBoard_no());
			pstmt.setString(2, board.getBoard_nickname());
			pstmt.setString(3, board.getBoard_title());
			pstmt.setString(4, board.getBoard_content());
			pstmt.setInt(5, board.getBoard_nice());
			pstmt.setString(6, board.getBoard_photo());
			pstmt.setString(7, board.getBoard_reg_date());
			pstmt.setString(8, board.getBoard_ip());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertBoard() 에러 : " + e);
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
	
	// 선택된 게시글의 조회수 증가하기
	public void updateNice(int board_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int nice = 0;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM board_tbl WHERE board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				nice = rs.getInt("board_nice") + 1;
			}
			
			sql = "UPDATE board_tbl SET board_nice = ? WHERE board_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nice);
			pstmt.setInt(2, board_no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateNice() 에러 : " + e);
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
	}
	
	// 선택된 게시글의 상세 내용 가져오기
	public BoardDTO getBoardByNum(int board_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		updateNice(board_no);
		String sql = "SELECT * FROM board_tbl WHERE board_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_nickname(rs.getString("board_nickname"));
				board.setBoard_title(rs.getString("board_title"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_photo(rs.getString("board_photo"));
				board.setBoard_nice(rs.getInt("board_nice"));
				board.setBoard_reg_date(rs.getString("board_reg_date"));
				board.setBoard_ip(rs.getString("board_ip"));
			}
		} catch(Exception e) {
			System.out.println("getBoardByNum() 에러 : " + e);
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
		return board;
	}
	
	// 선택된 게시글 내용 수정하기
	public void updateBoard(BoardDTO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE board_tbl SET board_title = ?, board_content = ?, board_photo = ? WHERE board_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, board.getBoard_title());
			pstmt.setString(2, board.getBoard_content());
			pstmt.setString(3, board.getBoard_photo());
			pstmt.setInt(4, board.getBoard_no());
			
			pstmt.executeUpdate();
			conn.commit();
			
		} catch (Exception e) {
			System.out.println("updateBoard() 에러 : " + e);
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
	
	// 선택된 게시글 삭제하기
	public void deleteBoard(int board_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM board_tbl WHERE board_no = ?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteBoard() 에러 : " + e);
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
	
	// user_tbl 에서 인증된 id 의 별명 가져오기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String nickname = null;
		String sql = "SELECT * FROM user_tbl WHERE user_id = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				nickname = rs.getString("user_nickname");
			}
		} catch (Exception e) {
			System.out.println("getLoginNameById() 에러 : " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return nickname;
	}
}
