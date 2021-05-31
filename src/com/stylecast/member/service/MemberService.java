package com.stylecast.member.service;

import static com.stylecast.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.stylecast.daily.model.vo.Daily;
import com.stylecast.member.dao.MemberDao;
import com.stylecast.member.vo.Member;

public class MemberService {

	public Member loginMember(String memId, String memPwd) {
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, memId, memPwd);
		close(conn);
		return m;
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		if(result>0) {
			commit(conn);
			
			// 갱신된 회원 객체 다시 조회
			updateMem = new MemberDao().selectMember(conn, m.getMemId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}

	public String checkMember(String memId) {
		
		Connection conn = getConnection();
		
		String memPwd = new MemberDao().checkMember(conn, memId);
		close(conn);
		
		return memPwd;
	}

	public int insertBookmark(int memNo, int dailyNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertBookmark(conn, memNo, dailyNo);
		close(conn);
		
		return result;
	}

	public int deleteBookmark(int memNo, int dailyNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteBookmark(conn, memNo, dailyNo);
		close(conn);
		
		return result;
	}

	public ArrayList<Daily> selectMyBookmarkList(int memNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Daily> list = new MemberDao().selectMyBookmarkList(conn, memNo);
		close(conn);
		
		return list;
	}
	
}
