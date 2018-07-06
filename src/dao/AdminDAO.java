package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.FreeboardDTO;
import dto.MemberDTO;
import dto.ReportFreeDTO;

public class AdminDAO {
//--------------------------------------------------자유게시판 관리
	
//----------------------------------신고 글 전부 보기
	public List<ReportFreeDTO> getAllReport_f() throws Exception{
		Connection conn = DBConnection.getConnection();
		List<ReportFreeDTO> list = new ArrayList<>();
		String sql = "select r.reportfree_seq, r.free_seq, f.free_title, f.free_writer, r.report_user, to_char(r.report_date,'yy/MM/dd') report_date from freeboard_c f, report_free r where r.free_seq = f.free_seq order by reportfree_seq desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReportFreeDTO tmp = new ReportFreeDTO();
			tmp.setReportfree_seq(rs.getInt("reportfree_seq"));
			tmp.setFree_seq(rs.getInt("free_seq"));
			tmp.setFree_title(rs.getString("free_title"));
			MemberDAO mdao = new MemberDAO();		
			tmp.setFree_writer(mdao.getUserNickname(rs.getInt("free_writer")));
			tmp.setReport_user(mdao.getUserNickname(rs.getInt("report_user")));
			tmp.setReport_date(rs.getString("report_date"));
			list.add(tmp);
		}
	/*	System.out.println(list.size());*/
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	//----------------------------------신고 글 별로 개수 확인(정렬)
		public List<ReportFreeDTO> getReportAlign_f() throws Exception{
			Connection conn = DBConnection.getConnection();
			List<ReportFreeDTO> list = new ArrayList<>();
			String sql = "select f.free_seq, f.free_title,f.free_writer,f.free_writedate, f.free_viewcount,c.fcount from freeboard_c f,(select free_seq, count(*) fcount from report_free group by free_seq order by fcount desc)c where f.free_seq = c.free_seq";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReportFreeDTO tmp = new ReportFreeDTO();
				tmp.setFree_seq(rs.getInt("free_seq"));
				tmp.setFree_title(rs.getString("free_title"));
				MemberDAO mdao = new MemberDAO();		
				tmp.setFree_writer(mdao.getUserNickname(rs.getInt("free_writer")));
				tmp.setFree_writedate(rs.getString("free_writedate"));
				tmp.setReport_count(rs.getInt("fcount"));
				list.add(tmp);
			}
		/*	System.out.println(list.size());*/
			rs.close();
			pstmt.close();
			conn.close();
			return list;
		}
	

	//-------------------------------------------------계획 공유게시판 관리
	//----------------------------------신고 글 전부 보기	
	public List<ReportFreeDTO> getAllReport_p() throws Exception{
		Connection conn = DBConnection.getConnection();
		List<ReportFreeDTO> list = new ArrayList<>();
		String sql = "select r.reportfree_seq, r.free_seq, f.free_title, f.free_writer, r.report_user, to_char(r.report_date,'yy/MM/dd') report_date from freeboard_c f, report_free r where r.free_seq = f.free_seq order by reportfree_seq desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReportFreeDTO tmp = new ReportFreeDTO();
			tmp.setReportfree_seq(rs.getInt("reportfree_seq"));
			tmp.setFree_seq(rs.getInt("free_seq"));
			tmp.setFree_title(rs.getString("free_title"));
			MemberDAO mdao = new MemberDAO();		
			tmp.setFree_writer(mdao.getUserNickname(rs.getInt("free_writer")));
			tmp.setReport_user(mdao.getUserNickname(rs.getInt("report_user")));
			tmp.setReport_date(rs.getString("report_date"));
			list.add(tmp);
		}
	/*	System.out.println(list.size());*/
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	
	
	
	
	
	
	//--------------------------------------------------회원관리	
	//-----------------------------모든 회원정보 가져오기
	
	public List<MemberDTO> getAllMembers() throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select seq, userid,email,nickname,naver_nickname,naver_email,kakao_nickname,kakao_email,to_char(create_date,'YY/MM/DD') create_date,part,block from users where userid!='admin' order by seq desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<MemberDTO> result = new ArrayList<>();
		while(rs.next()) {
			MemberDTO mdto = new MemberDTO();
			mdto.setSeq(rs.getInt("seq"));
			mdto.setUserid(rs.getString("userId"));
			mdto.setEmail(rs.getString("email"));
			mdto.setNickname(rs.getString("nickname"));
			mdto.setNaver_nickname(rs.getString("naver_nickname"));
			mdto.setNaver_email(rs.getString("naver_email"));
			mdto.setKakao_nickname(rs.getString("kakao_nickname"));
			mdto.setKakao_email(rs.getString("kakao_email"));
			mdto.setPart(rs.getString("part"));
			mdto.setCreate_date(rs.getString("create_date"));
			mdto.setBlock(rs.getString("block"));
			result.add(mdto);		
		}	
		rs.close();
		pstmt.close();
		con.close();	
		return result;		
	}
	
 //------------------------------------회원 block 걸기/해제
	public int changeBlock(int seq, String isBlocked)throws Exception{
		Connection con = DBConnection.getConnection();
		PreparedStatement pstmt=null;
		int result=0;
		
		if(isBlocked.equals("n")) {
				String sql2 = "update users set block =? where seq=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, "y");
				pstmt.setInt(2, seq);
				result = pstmt.executeUpdate();
		}else if(isBlocked.equals("y")) {
				String sql2 = "update users set block =? where seq=?";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1, "n");
				pstmt.setInt(2, seq);
				result = pstmt.executeUpdate();
		}		
		con.commit();
		con.close();		
		pstmt.close();
		return result;
	}
//-----------------------------------------회원 block여부확인	
	public String checkBlock(int seq)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql1 = "select block from users where seq=?";
		String isBlocked="";
		PreparedStatement pstmt=con.prepareStatement(sql1);	
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			isBlocked = rs.getString("block");
		}	
		con.close();
		rs.close();
		pstmt.close();
		return isBlocked;
	}
	
	//-----------------------------------------페이지 네비	
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
		
		int recordTotalCount = rs.getInt("totalCount"); // �쟾泥� 湲�(�젅肄붾뱶)�쓽 媛쒖닔瑜� ���옣�븯�뒗 蹂��닔
		int recordCountPerPage = 10;  // �븳 �럹�씠吏��뿉 寃뚯떆湲��씠 紐뉕컻 蹂댁씪嫄댁�
		int naviCountPerPage = 10;  // �븳 �럹�씠吏��뿉�꽌 �꽕鍮꾧쾶�씠�꽣媛� 紐뉕컻�뵫 蹂댁씪嫄댁�
		int pageTotalCount = 0;  // �쟾泥닿� 紐뉙럹�씠吏�濡� 援ъ꽦�맆寃껋씤吏�
		
		if(recordTotalCount % recordCountPerPage > 0 ) { // �젙�솗�엳 10�쑝濡� �굹�늻�뼱 �뼥�뼱吏�吏� �븡�쓬
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		//------------------------------------------------------------------------------------------
		
		//int currentPage = 1;
		
		if(currentPage < 1) {	// �쁽�옱 �럹�씠吏�媛� 鍮꾩젙�긽�씤吏� 寃�利앺븯�뒗 肄붾뱶
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		//------------------------------------------------------------------------------------------
		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;  // �꽕鍮꾧쾶�씠�꽣 �떆�옉 媛�. currentPage�뿉�꽌 �떗�쓽�옄由щ�� 媛��졇�삤怨� + 1;
		int endNavi = startNavi + (naviCountPerPage - 1);  // �꽕鍮꾧쾶�씠�꽣 �걹 媛�	
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		
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
