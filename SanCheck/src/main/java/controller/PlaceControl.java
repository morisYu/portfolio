package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.PlaceDAO;
import dto.PlaceDTO;

@MultipartConfig(
	location="/tmp",
	fileSizeThreshold=1024*1024,
	maxFileSize=1024*1024*5,
	maxRequestSize=1024*1024*5*5
)

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
			
		case "/PlaceWriteForm.pc":
			rd = request.getRequestDispatcher("/place/placeWriteForm.jsp");
			rd.forward(request, response);
			break;
			
		case "/PlaceWriteAction.pc":
			requestPlaceWrite(request);
			rd = request.getRequestDispatcher("/PlaceListAction.pc");
			rd.forward(request, response);
		}

	}

	// 장소정보 작성내용 저장하기
	private void requestPlaceWrite(HttpServletRequest request) throws IOException, ServletException {
		
		PlaceDAO dao = PlaceDAO.getInstance();
		PlaceDTO place = new PlaceDTO();
		
		Collection<Part> parts = request.getParts();
		StringBuilder sb = new StringBuilder();
		
		for(Part p : parts) {
			if(!p.getName().equals("place_photo")) {
				continue;
			}
			
			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			sb.append(fileName);
			sb.append(",");
			
			InputStream fis = filePart.getInputStream();
			
			String realPath = "D:/upload";
			String filePath = realPath + File.separator + fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fis.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
			
			fos.close();
			fis.close();
		}
		
		if(sb.length() > 0) {
			sb.delete(sb.length()-1, sb.length());
		}
		
		place.setPlace_no(0);
		place.setPlace_write_id(request.getParameter("place_write_id"));
		place.setPlace_name(request.getParameter("place_name"));
		place.setPlace_addr(request.getParameter("place_addr"));
		place.setPlace_tel(request.getParameter("place_tel"));
		place.setPlace_business_hours(request.getParameter("place_business_hours"));
		place.setPlace_other(request.getParameter("place_other"));
		place.setPlace_photo(sb.toString());
		
		dao.addPlace(place);
		
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
