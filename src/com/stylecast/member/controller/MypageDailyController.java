package com.stylecast.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stylecast.common.model.vo.PageInfo;
import com.stylecast.daily.model.service.DailyService;
import com.stylecast.daily.model.vo.Daily;
import com.stylecast.member.service.MemberService;
import com.stylecast.member.vo.Member;

/**
 * Servlet implementation class MyPageUpdate
 */
@WebServlet("/myPage.me")
public class MypageDailyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageDailyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// 로그인한 회원의 요청인지 확인
		if(session.getAttribute("loginUser") == null) { // 로그인 전
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
		}else { // 로그인 후
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int memNo = loginUser.getMemNo();
			
			// 데일리글 전체 조회
			ArrayList<Daily> list = new DailyService().selectMyDailyList(memNo);
	
			int[] likeCount = new DailyService().selectLikedCountList(memNo);
			int[] bookmarkCount = new DailyService().selectBookmarkCountList(memNo);
			int[] commentCount = new DailyService().selectCommentCountList(memNo);
			
			int i = 0;
			
			for(Daily d : list) {
				d.setLikeCount(likeCount[i]);
				d.setBookmarkCount(bookmarkCount[i]);
				d.setCommentCount(commentCount[i]);
				i++;
			}
			
			ArrayList<Daily> bList = new MemberService().selectMyBookmarkList(memNo);
			ArrayList<Daily> lList = new MemberService().selectMyLikeList(memNo);
			
			request.setAttribute("list", list);
			request.setAttribute("bList", bList);
			request.setAttribute("lList", lList);
			
			request.getRequestDispatcher("views/mypage/mypageDaily.jsp").forward(request, response);
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
