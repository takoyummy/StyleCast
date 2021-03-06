package com.stylecast.daily.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stylecast.daily.model.service.DailyService;
import com.stylecast.daily.model.vo.Daily;
import com.stylecast.daily.model.vo.Item;


/**
 * Servlet implementation class DailyUpdateFormController
 */
@WebServlet("/updateForm.da")
public class DailyUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int dailyNo = Integer.parseInt(request.getParameter("dno"));
		
		Daily d = new DailyService().selectDailyDetail(dailyNo);
		
		ArrayList<Item> list = new DailyService().selectDailyItem(dailyNo);
		
		System.out.println(d);
		System.out.println(list);
		
		request.setAttribute("d", d);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/daily/dailyUpdate.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
