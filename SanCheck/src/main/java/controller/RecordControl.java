package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import dao.RecordDAO;
import dto.RecordDTO;

public class RecordControl extends HttpServlet {

	private static final long serialVersionUID = -3L;
	static final int LISTCOUNT = 10;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher rd;

		switch (command) {

		case "/RecordList.rc":
			requestRecordList(request);
			rd = request.getRequestDispatcher("/record/recordList.jsp");
			rd.forward(request, response);
			break;

		}
	}

	// 메인 화면을 위한 목록(전체, 사용자) 가지고오기
	private void requestRecordList(HttpServletRequest request) {
		List<RecordDTO> recordListAll = new ArrayList<RecordDTO>();
		List<RecordDTO> recordListByNickname = new ArrayList<RecordDTO>();
		RecordDAO dao = RecordDAO.getInstance();

		HttpSession session = request.getSession();

		String user_id = (String) session.getAttribute("sessionId");
		if (user_id != null && !user_id.equals("")) {
			String record_nickname = dao.getNicknameById(user_id);
			recordListByNickname = dao.getRecordListByNickname(record_nickname);
		}
		recordListAll = dao.getRecordListAll();
		request.setAttribute("recordListAll", recordListAll);
		request.setAttribute("recordListByNickname", recordListByNickname);
	}

}

















