package com.stylecast.theme.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stylecast.theme.model.service.ThemeService;
import com.stylecast.theme.model.vo.Theme;
import com.stylecast.theme.model.vo.ThemePost;

/**
 * Servlet implementation class ThemeListController
 */
@WebServlet("/list.to")
public class ThemeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemeListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tno = Integer.parseInt(request.getParameter("tpage"));
	
		Theme t = new ThemeService().selectThemeOthers(tno);
		ArrayList<ThemePost> plist = new ThemeService().selectThemePost(tno);
		ArrayList<Theme> tlist = new ThemeService().selectThemeListOthers(tno); 
		
		request.setAttribute("t", t);
		request.setAttribute("plist", plist);
		request.setAttribute("tlist", tlist);
		request.getRequestDispatcher("views/trending/trendingListView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
