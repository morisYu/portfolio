package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dto.NoticeDTO;

public class Control extends HttpServlet {

	private static final long serialVersionUID = -1L;
	static final int LISTCOUNT = 6;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher rd;

		switch (command) {
		
		case "/NoticeListAction.do":
			requestNoticeList(request);
			rd = request.getRequestDispatcher("/notice/noticeList.jsp");
			rd.forward(request, response);
			break;
			
		case "/NoticeWriteForm.do":
			requestLoginName(request);
			rd = request.getRequestDispatcher("/notice/noticeWriteForm.jsp");
			rd.forward(request, response);
			break;
			
		case "/NoticeWriteAction.do":
			requestNoticeWrite(request);
			rd = request.getRequestDispatcher("/NoticeListAction.do");
			rd.forward(request, response);
			break;
		
		case "/NoticeViewAction.do":
			requestNoticeView(request);
			rd = request.getRequestDispatcher("NoticeView.do");
			rd.forward(request, response);
			break;
			
		case "/NoticeView.do":
			rd = request.getRequestDispatcher("/notice/noticeView.jsp");
			rd.forward(request, response);
			break;
			
		case "/NoticeUpdateAction.do":
			requestNoticeUpdate(request);
			rd = request.getRequestDispatcher("/NoticeListAction.do");
			rd.forward(request, response);
			break;
			
		case "/NoticeDeleteAction.do":
			requestNoticeDelete(request);
			rd = request.getRequestDispatcher("/NoticeListAction.do");
			rd.forward(request, response);
			break;
		}
	}

	// 공지사항 목록 가져오기
	private void requestNoticeList(HttpServletRequest request) {
		NoticeDAO dao = NoticeDAO.getInstance();
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		
		int pageNum = 1;
		int limit = LISTCOUNT;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int total_record = dao.getListCount();
		noticeList = dao.getNoticeList(pageNum, limit);
		
		int total_page;
		
		if(total_record % limit == 0) {
			total_page = total_record/limit;
			Math.floor(total_page);
		} else {
			total_page = total_record/limit;
			Math.floor(total_page);
			total_page += 1;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("noticeList", noticeList);
	}

	// 로그인 이름 가져오기
	private void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		NoticeDAO dao = NoticeDAO.getInstance();
		String nickname = dao.getLoginNameById(id);
		request.setAttribute("nickname", nickname);
	}
	
	// 공지사항 작성하기
	private void requestNoticeWrite(HttpServletRequest request) {
		NoticeDAO dao = NoticeDAO.getInstance();
		
		NoticeDTO notice = new NoticeDTO();
		notice.setNotice_nickname(request.getParameter("nickname"));
		notice.setNotice_title(request.getParameter("title"));
		notice.setNotice_content(request.getParameter("content"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String reg_date = formatter.format(new java.util.Date());
		notice.setNotice_reg_date(reg_date);
		
		dao.insertNotice(notice);
	}
	
	// 공지사항 내용 보기
	private void requestNoticeView(HttpServletRequest request) {
		NoticeDAO dao = NoticeDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		NoticeDTO notice = new NoticeDTO();
		notice = dao.getNoticeListByNum(num, pageNum);
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("notice", notice);
	}
	
	// 공지사항 내용 수정
	private void requestNoticeUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		NoticeDTO notice = new NoticeDTO();
		notice.setNotice_no(num);
		notice.setNotice_nickname(request.getParameter("name"));
		notice.setNotice_title(request.getParameter("title"));
		notice.setNotice_content(request.getParameter("content"));
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String reg_date = formatter.format(new Date());
		
		notice.setNotice_reg_date(reg_date);
		
		dao.updateNotice(notice);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
	}
	
	// 공지사항 삭제하기
	private void requestNoticeDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		dao.deleteNotice(num);
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
	}
}