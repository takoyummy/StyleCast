package com.stylecast.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stylecast.admin.model.service.AdminService;
import com.stylecast.admin.model.vo.Codi;
import com.stylecast.common.model.vo.PageInfo;

/**
 * Servlet implementation class CodiSearchController
 */
@WebServlet("/searchCodi.ad")
public class CodiSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodiSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		// 여기서 작업
		//사용자가 선택한 카테고리
		String gender = request.getParameter("gender");
		String weather = request.getParameter("weather_select");
		
//		System.out.println(gender);
//		System.out.println(weather);
		
		// 총 게시글 갯수
		listCount = new AdminService().selectCodiListCount(gender,weather);
		
		//System.out.println(listCount);
		
		// 사용자가 요청한 페이지 ( 현재 페이지)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		
		// pageLimit : 하단에 보여질 페이징바의 페이지 최대 갯수(페이지 목록들 몇개)
		pageLimit = 10;
		
		// boardLimit : 한 페이지 내에 보여질 게시글 최대 갯수
		boardLimit = 6;
		
		//maxPage : 제일 마지막 페이지수 ( 총 페이지 수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Codi> list = new AdminService().selectSearchCodiList(pi,gender,weather);
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("weather", weather);
		request.setAttribute("gender", gender);
		request.getRequestDispatcher("views/admin/adminCodiSearch.jsp").forward(request,response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
