package com.stylecast.admin.model.dao;

import static com.stylecast.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.stylecast.common.model.vo.PageInfo;
import com.stylecast.daily.model.vo.Report;
import com.stylecast.member.vo.Member;
import com.stylecast.notice.model.vo.Notice;


public class AdminDao {
	
private Properties prop = new Properties();
	
	public AdminDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("/sql/admin/admin-mapper.xml").getPath()));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	public int selectListCount(Connection conn, String blackListYN) {
		// TODO Auto-generated method stub
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, blackListYN);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Member> selectList(Connection conn, PageInfo pi, String blackListYN) {
		// TODO Auto-generated method stub
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setString(1, blackListYN);
			pstmt.setInt(2,startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("mem_no"),
						rset.getString("mem_id"),
						rset.getString("mem_name"),
						rset.getString("mem_email"),
						rset.getString("black_yn"),
						rset.getInt("warning"))
						);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Report> selectReportList(Connection conn, int brCategory) {
		
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brCategory);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("rpt_no"),
						rset.getString("content"),
						rset.getDate("enr_date"),
						brCategory,
						rset.getInt("daily_no"),
						rset.getString("rpt_category"),
						rset.getInt("cm_no"),
						rset.getString("mem_id"),
						rset.getString("rmem_id"))
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		
		return list;
	}

	public int deleteReport(Connection conn, String[] rptNoArr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		//String sql = prop.getProperty("deleteReport");
		String sql = "UPDATE REPORT SET STATUS = 'Y' WHERE RPT_NO IN (";

		for(int i = 0; i<((rptNoArr.length)-1); i++) {
			sql += rptNoArr[i] + ", ";
		}
		
		sql += rptNoArr[(rptNoArr.length)-1] + ")";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int processReport(Connection conn, String[] rptNoArr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		/*
		String sql = prop.getProperty("processReport");
		
		String sql2 = "";
		for(int i = 0; i<((rptNoArr.length)-1); i++) {
			sql2 += rptNoArr[i] + ", ";
		}
		
		sql2 += rptNoArr[(rptNoArr.length)-1];
		*/
		
		String sql = "UPDATE MEMBER SET WARNING = WARNING + 1 WHERE MEM_NO IN (SELECT RMEM_NO FROM REPORT WHERE RPT_NO IN(";

		for(int i = 0; i<((rptNoArr.length)-1); i++) {
			sql += rptNoArr[i] + ", ";
		}
		
		sql += rptNoArr[(rptNoArr.length)-1] + "))";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Report> selectReportListByMemId(Connection conn, String text, int brCategory) {
		
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportListByMemId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brCategory);
			pstmt.setString(2, text);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("rpt_no"),
						rset.getString("content"),
						rset.getDate("enr_date"),
						brCategory,
						rset.getInt("daily_no"),
						rset.getString("rpt_category"),
						rset.getInt("cm_no"),
						rset.getString("mem_id"),
						rset.getString("rmem_id"))
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return list;
	}

	public ArrayList<Report> selectReportListByRmemId(Connection conn, String text, int brCategory) {
		
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportListByRmemId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brCategory);
			pstmt.setString(2, text);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("rpt_no"),
						rset.getString("content"),
						rset.getDate("enr_date"),
						brCategory,
						rset.getInt("daily_no"),
						rset.getString("rpt_category"),
						rset.getInt("cm_no"),
						rset.getString("mem_id"),
						rset.getString("rmem_id"))
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return list;
	}

	public ArrayList<Report> selectReportListByRptCategory(Connection conn, String text, int brCategory) {
		
		ArrayList<Report> list = new ArrayList<Report>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportListByRptCategory");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, brCategory);
			pstmt.setString(2, text);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Report(rset.getInt("rpt_no"),
						rset.getString("content"),
						rset.getDate("enr_date"),
						brCategory,
						rset.getInt("daily_no"),
						rset.getString("rpt_category"),
						rset.getInt("cm_no"),
						rset.getString("mem_id"),
						rset.getString("rmem_id"))
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(conn);
		}
		return list;
	}
}
