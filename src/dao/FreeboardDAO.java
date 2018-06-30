package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.FreeboardDTO;

public class FreeboardDAO {
	
	public List<FreeboardDTO> viewFreeList() throws Exception{
		Connection conn = DBConnection.getConnection();
		List<FreeboardDTO> tmpList = new ArrayList<>();
		String sql = "SELECT * FROM freeboard ORDER BY free_seq DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			FreeboardDTO tmp = new FreeboardDTO();
			tmp.setFree_seq(rs.getInt(1));
			tmp.setFree_title(rs.getString(2));
			tmp.setFree_contents(rs.getString(3));
			tmp.setFree_writer(rs.getString(4));
			tmp.setFree_writedate(rs.getString(5));
			tmp.setFree_viewcount(rs.getInt(6));
			tmpList.add(tmp);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return tmpList;
	}
	
	public ArrayList<FreeboardDTO> selectBoard(int startNum, int endNum, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();
		
		String sql;
		PreparedStatement pstat = null;
		
		if(searchTerm == null || searchTerm.equals("null")) {
		sql = "select * from (select free_seq, free_title, free_contents, free_writer, to_char(free_writedate, 'YYYY/MM/DD') free_writedate, free_viewcount, row_number() over(order by free_seq desc) as num from freeboard) where num between ? and ?";
		pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		} else {
			sql = "select * from (select free_seq, free_title, free_contents, free_writer, to_char(free_writedate, 'YYYY/MM/DD') free_writedate, free_viewcount, row_number() over(order by free_seq desc) as num from freeboard where free_title like ?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, "%"+searchTerm+"%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
		}
		ResultSet rs = pstat.executeQuery();

		ArrayList<FreeboardDTO> result = new ArrayList<>();

		while(rs.next()) {
			FreeboardDTO tmp = new FreeboardDTO();
			tmp.setFree_seq(rs.getInt(1));
			tmp.setFree_title(rs.getString(2));
			tmp.setFree_contents(rs.getString(3));
			tmp.setFree_writer(rs.getString(4));
			tmp.setFree_writedate(rs.getString(5));
			tmp.setFree_viewcount(rs.getInt(6));
			result.add(tmp);
		}
		
		con.close();
		pstat.close();
		rs.close();
		
		return result;
	}
	
	public String getPageNavi(int currentPage, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();
		
		
		String sql;
		PreparedStatement pstat;
		ResultSet rs;
		
		if(searchTerm == null || searchTerm.equals("null")) {
			sql = "select count(*) totalCount from freeboard";
			pstat = con.prepareStatement(sql);
		} else {
			sql = "select count(*) totalCount from freeboard where free_title = ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, searchTerm);
		}
		
		rs = pstat.executeQuery();
		rs.next();
		
		int recordTotalCount = rs.getInt("totalCount"); // 전체 글(레코드)의 개수를 저장하는 변수
		int recordCountPerPage = 10;  // 한 페이지에 게시글이 몇개 보일건지
		int naviCountPerPage = 10;  // 한 페이지에서 네비게이터가 몇개씩 보일건지
		int pageTotalCount = 0;  // 전체가 몇페이지로 구성될것인지
		
		if(recordTotalCount % recordCountPerPage > 0 ) { // 정확히 10으로 나누어 떨어지지 않음
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		//------------------------------------------------------------------------------------------
		
		//int currentPage = 1;
		
		if(currentPage < 1) {	// 현재 페이지가 비정상인지 검증하는 코드
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		//------------------------------------------------------------------------------------------
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;  // 네비게이터 시작 값. currentPage에서 십의자리를 가져오고 + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);  // 네비게이터 끝 값	
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
//		System.out.println("현재 페이지 : " + currentPage);
//		System.out.println("네비게이터 시작: " + startNavi);
//		System.out.println("네비게이터 끝: " + endNavi);
		
		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		} 
		
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) {
			sb.append("<li class='page-item'><a class='page-link' href='freeboard.bo?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
		}
		
		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item'><a class='page-link' href='freeboard.bo?currentPage="+i+"&search="+searchTerm+"'>"+i+"</a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='freeboard.bo?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
			}
		}
		
		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='freeboard.bo?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}
		
		con.close();
		pstat.close();
		rs.close();
		
		return sb.toString();
	}	
}
