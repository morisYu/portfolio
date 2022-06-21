package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PlaceDAO;
import dto.PlaceDTO;

public class PlaceControl extends HttpServlet {
	private static final long serialVersionUID = -2L;
	private static final int LIMITCOUNT = 4;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPlace(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPlace(request, response);
	}

	protected void doPlace(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher rd;

		switch (command) {

		case "/PlaceListAction.pc":
			requestPlaceList(request);
			rd = request.getRequestDispatcher("/place/placeList.jsp");
			rd.forward(request, response);
			break;
			
		case "/PlaceViewAction.pc":
			requestPlaceView(request);
			rd = request.getRequestDispatcher("/place/placeView.jsp");
			rd.forward(request, response);
			break;
		}

	}

	// 장소정보 상세내용 가져오기
	private void requestPlaceView(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		PlaceDAO dao = PlaceDAO.getInstance();
		PlaceDTO place = dao.getPlaceByNum(num);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("place", place);
	}

	// 페이지별 장소정보 목록 가져오기
	private void requestPlaceList(HttpServletRequest request) {
		int pageNum = 1;
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}

		String items = request.getParameter("items");
		String text = request.getParameter("text");

		PlaceDAO dao = PlaceDAO.getInstance();
		List<PlaceDTO> totalPlaceList = new ArrayList<PlaceDTO>();
		List<PlaceDTO> placeList = new ArrayList<PlaceDTO>();

		int total_count = dao.getPlaceCount(items, text);
		totalPlaceList = dao.getPlaceList(items, text);

		int total_page = 1;
		int limit = LIMITCOUNT;
		
		if (total_count >= limit) {
			if (total_count % limit == 0) {
				total_page = total_count / limit;
			} else {
				total_page = (int) Math.floor(total_count / limit) + 1;
			}
		}
		
		int start = (pageNum - 1) * limit;
		int end = start + limit - 1;
		
		for(int i = 0; i < totalPlaceList.size(); i++) {
			if(i >= start && i <= end) {
				placeList.add(totalPlaceList.get(i));
			}
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_count", total_count);
		request.setAttribute("total_page", total_page);
		request.setAttribute("placeList", placeList);
	}
}
