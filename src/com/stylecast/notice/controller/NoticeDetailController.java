package com.stylecast.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stylecast.common.model.vo.BoardImage;
import com.stylecast.notice.model.service.NoticeService;
import com.stylecast.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		NoticeService nService = new NoticeService();
		
		int result = nService.increaseCount(noticeNo);
		
		if(result > 0) {
			Notice n = nService.selectNotice(noticeNo);

			ArrayList<BoardImage> imgList = new NoticeService().selectBoardImageList(noticeNo);
			
			request.setAttribute("n", n);
			request.setAttribute("imgList", imgList);
			request.getRequestDispatcher("views/notice/noticeDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "공지 리스트 조회에 실패했습니다.");
			request.getRequestDispatcher("view/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
