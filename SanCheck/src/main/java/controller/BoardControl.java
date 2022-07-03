package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dto.BoardDTO;

public class BoardControl extends HttpServlet {
	private static final long serialVersionUID = -1L;
	static final int LISTCOUNT = 10;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher rd;
		
		switch (command) {

		case "/BoardListAction.bc":
			requestBoardList(request);
			rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);
			break;
			
		case "/BoardWriteForm.bc":
			requestLoginName(request);
			rd = request.getRequestDispatcher("/board/boardWriteForm.jsp");
			rd.forward(request, response);
			break;
			
		case "/BoardWriteAction.bc":
			requestBoardWrite(request);
			rd = request.getRequestDispatcher("/BoardListAction.bc");
			rd.forward(request, response);
			break;
			
		case "/BoardViewAction.bc":
			requestBoardView(request);
			rd = request.getRequestDispatcher("/BoardView.bc");
			rd.forward(request, response);
			break;
			
		case "/BoardView.bc":
			rd = request.getRequestDispatcher("/board/boardView.jsp");
			rd.forward(request, response);
			break;
			
		case "/BoardUpdateAction.bc":
			requestBoardUpdate(request);
			rd = request.getRequestDispatcher("/BoardListAction.bc");
			rd.forward(request, response);
			break;
			
		case "/BoardDeleteAction.bc":
			requestBoardDelete(request);
			rd = request.getRequestDispatcher("/BoardListAction.bc");
			rd.forward(request, response);
			break;
		}
	}

	// 인증된 사용자 별명 가져오기
	private void requestLoginName(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		BoardDAO dao = BoardDAO.getInstance();
		String nickname = dao.getLoginNameById(user_id);
		request.setAttribute("nickname", nickname);
	}

	// 게시글 목록 가져오기
	public void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_board = dao.getBoardListCount(items, text);
		boardList = dao.getBoardList(pageNum, limit, items, text);
		
		int total_page;
		if(total_board % limit == 0) {
			total_page = total_board/limit;
		} else {
			total_page = (int) Math.floor(total_board/limit) + 1;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_board", total_board);
		request.setAttribute("boardList", boardList);
	}

	// 게시글 등록하기
	private void requestBoardWrite(HttpServletRequest request) throws IOException {
		BoardDAO dao = BoardDAO.getInstance();
		
		// 파일 저장 경로는 작업중인 폴더가 아니라 .metadata 안에 저장됨(작업중인 폴더에는 파일 업로드 되지 않고, 서비스중인 어플리케이션에 업로드 됨)
		String realPath = request.getServletContext().getRealPath("/upload");
		
		// 파일 저장경로가 없을 때 폴더 생성
		File path = new File(realPath);
		if(!path.exists()) {
			path.mkdirs();
		}
		
		String filePath = realPath;
		int fileSize = 5 * 1024 *1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, encType, new DefaultFileRenamePolicy());
		
		BoardDTO dto = new BoardDTO();
		
		dto.setBoard_no(0);
		dto.setBoard_nickname(multi.getParameter("board_nickname"));
		dto.setBoard_title(multi.getParameter("board_title"));
		dto.setBoard_content(multi.getParameter("board_content"));
		dto.setBoard_nice(0);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		dto.setBoard_photo(fileName);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String reg_date = formatter.format(new Date());
		
		dto.setBoard_reg_date(reg_date);
		dto.setBoard_ip(request.getRemoteAddr());
		
		dao.insertBoard(dto);
	}
	
	// 게시판 상세내용 보기
	private void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
	}

	// 게시글 수정하기
	private void requestBoardUpdate(HttpServletRequest request) throws IOException {
		int board_no = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
    	// 파일 저장 경로는 작업중인 폴더가 아니라 .metadata 안에 저장됨(작업중인 폴더에는 파일 업로드 되지 않고, 서비스중인 어플리케이션에 업로드 됨)
    	String realPath = request.getServletContext().getRealPath("/upload");
    	
		String filePath = realPath;
		int fileSize = 5 * 1024 *1024;
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, filePath, fileSize, encType, new DefaultFileRenamePolicy());
		
		// 이전 등록된 사진 삭제
		String old_photo = multi.getParameter("old_board_photo");
		String oldFilePath = realPath + File.separator + old_photo;
		File file = new File(oldFilePath);
    	if( file.exists() ){
    		if(file.delete()){
    			System.out.println("파일삭제 성공");
    		}else{
    			System.out.println("파일삭제 실패");
    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
		
    	// 수정된 내용 저장
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setBoard_no(board_no);
		board.setBoard_nickname(multi.getParameter("board_nickname"));
		board.setBoard_title(multi.getParameter("board_title"));
		board.setBoard_content(multi.getParameter("board_content"));

		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		board.setBoard_photo(fileName);
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String board_reg_date = formatter.format(new Date());
		
		board.setBoard_reg_date(board_reg_date);
		board.setBoard_nice(0);
		board.setBoard_ip(request.getRemoteAddr());
		
		dao.updateBoard(board);
		
		request.setAttribute("num", board_no);
		request.setAttribute("pageNum", pageNum);
	}
	
	// 게시글 삭제하기
	private void requestBoardDelete(HttpServletRequest request) throws IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		// 파일 저장 경로는 작업중인 폴더가 아니라 .metadata 안에 저장됨(작업중인 폴더에는 파일 업로드 되지 않고, 서비스중인 어플리케이션에 업로드 됨)
    	String realPath = request.getServletContext().getRealPath("/upload");
		
		// 이전 등록된 사진 삭제
		String old_photo = request.getParameter("oldphoto");
		String oldFilePath = realPath + File.separator + old_photo;
		File file = new File(oldFilePath);
    	if( file.exists() ){
    		if(file.delete()){
    			System.out.println("파일삭제 성공");
    		}else{
    			System.out.println("파일삭제 실패");
    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
    		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
		
		request.setAttribute("pageNum", pageNum);
	}
}