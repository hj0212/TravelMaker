package dao;

import java.io.BufferedReader;
import java.io.StringReader;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.MemberDTO;
import dto.ReviewCommentDTO;
import dto.ReviewDTO;

public class ReviewDAO {
	private MemberDAO mdao = new MemberDAO();
	private ReviewPhotoDAO rdao = new ReviewPhotoDAO();
	//-------------------후기 글 전부 가져오기
	public List<ReviewDTO> getAllReview() throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from reviewboard";
		PreparedStatement pstmt = con.prepareStatement(sql);		
		ResultSet rs = pstmt.executeQuery();
		List<ReviewDTO> result = new ArrayList<>();

		while(rs.next()) {
			int seq = rs.getInt("review_writer");

			ReviewDTO tmp = new ReviewDTO();
			tmp.setReview_seq(rs.getInt(1));
			tmp.setReview_title(rs.getString(2));
			tmp.setReview_contents(rs.getString(3));
			tmp.setReview_writerN(mdao.getUserNickname(rs.getInt(4)));
			tmp.setReview_writedate(rs.getString(5));
			tmp.setReview_viewcount(rs.getInt(6));
			result.add(tmp);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	private String clobToString(Clob clob) throws Exception{
		StringBuffer sb = new StringBuffer();
		BufferedReader br = new BufferedReader(clob.getCharacterStream());
		String ts = "";
		while((ts=br.readLine()) != null) {
			sb.append(ts);
		}
		
		br.close();
		return sb.toString();
	}
	
	public int insertReview(String title, String contents, int writer, String[] array) throws Exception{
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO reviewboard_c values(reviewboard_seq.nextval,?,?,?,sysdate,0)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		StringReader sr = new StringReader(contents);
		pstmt.setCharacterStream(2, sr, contents.length());
		pstmt.setInt(3, writer);
		
		int result = pstmt.executeUpdate();
		
		sql = "UPDATE REVIEW_PHOTOS SET ARTICLE_NO = reviewboard_seq.currval WHERE SYSTEM_FILE_NAME = ?";
		pstmt = conn.prepareStatement(sql);
		for(int i = 0; i < array.length; i++) {
			pstmt.setString(1, array[i]);
			pstmt.addBatch();
		}
		pstmt.executeBatch();
		
		conn.commit();
		pstmt.close();
		conn.close();
		
		return result;
	}

	//-----------------------네비에 정한 개수만큼 기록 가져오기
	public ArrayList<ReviewDTO> getSomeReview(int startNum, int endNum, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();

		String sql;
		PreparedStatement pstat = null;

		if(searchTerm == null || searchTerm.equals("")) {
			sql = "select * from (select review_seq, review_title, review_contents, review_writer, to_char(review_writedate, 'YYYY/MM/DD') review_writedate, review_viewcount, row_number() over(order by review_seq desc) as num from reviewboard_c) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
		} else {
			sql = "select * from (select review_seq, review_title, review_contents, review_writer, to_char(review_writedate, 'YYYY/MM/DD') review_writedate, review_viewcount, row_number() over(order by review_seq desc) as num from reviewboard_c where review_title like ?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, "%"+searchTerm+"%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
		}
		ResultSet rs = pstat.executeQuery();

		ArrayList<ReviewDTO> reviewResult = new ArrayList<>();

		while(rs.next()) {
			ReviewDTO tmp = new ReviewDTO();
			tmp.setReview_seq(rs.getInt(1));
			tmp.setReview_title(rs.getString(2));
			tmp.setReview_contents(rs.getString(3));
			tmp.setReview_writerN(mdao.getUserNickname(rs.getInt(4)));
			tmp.setReview_writedate(rs.getString(5));
			tmp.setReview_viewcount(rs.getInt(6));
			reviewResult.add(tmp);
		}

		con.close();
		pstat.close();
		rs.close();	
		return reviewResult;
	}

	//-------------------페이지 네비	
	public String getPageNavi(int currentPage, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();		
		String sql;
		PreparedStatement pstat;


		if(searchTerm == null || searchTerm.equals("")) {
			sql = "select count(*) totalCount from reviewboard";
			pstat = con.prepareStatement(sql);
		} else {
			sql = "select count(*) totalCount from reviewboard where review_title like ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, "%"+searchTerm+"%");
		}

		ResultSet rs= pstat.executeQuery();
		if(rs.next());
		int recordTotalCount = rs.getInt("totalCount"); 
		//System.out.println(recordTotalCount);
		int recordCountPerPage = 12;  
		int naviCountPerPage = 10;  
		int pageTotalCount = 0;  

		if(recordTotalCount % recordCountPerPage > 0 ) { 
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		//------------------------------------------------------------------------------------------	
		//int currentPage = 1;		
		if(currentPage < 1) {	
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}		
		//------------------------------------------------------------------------------------------		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;  
		int endNavi = startNavi + (naviCountPerPage - 1);  

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
			sb.append("<li class='page-item'><a class='page-link' href='reviewboard.bo?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item'><a class='page-link' href='reviewboard.bo?currentPage="+i+"&search="+searchTerm+"'>"+i+"</a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='reviewboard.bo?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='reviewboard.bo?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}

		con.close();
		pstat.close();
		rs.close();

		return sb.toString();
	}	

	public int getArticleViewCount (int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select review_viewcount from reviewboard_c where review_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt("review_viewcount");
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}


	public ReviewDTO getReviewArticle(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select review_title, review_contents, review_writer, review_writedate, review_viewcount from reviewboard_c where review_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		ReviewDTO rdto = new ReviewDTO();
		if(rs.next()) {
			rdto.setReview_title(rs.getString("review_title"));
			rdto.setReview_contents(clobToString(rs.getClob("review_contents")));
			rdto.setReview_writer(rs.getInt("review_writer"));
			rdto.setReview_writerN(mdao.getUserNickname(rs.getInt("review_writer")));
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
		}

		return rdto;
	}

	public int insertReviewComment(String comment_text, int user, int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "insert into review_comment values(review_comment_seq.nextval,?,?,sysdate,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, comment_text);
		pstmt.setInt(2, user);
		pstmt.setInt(3, review_seq);
		
		int result = pstmt.executeUpdate();
		con.commit();
		pstmt.close();
		con.close();
		return result;
	}

	public List<ReviewCommentDTO> getReviewComment(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from review_comment where review_seq=? order by comment_time desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		List<ReviewCommentDTO> result = new ArrayList<>();
		while(rs.next()) {
			ReviewCommentDTO rdto = new ReviewCommentDTO();
			rdto.setReview_seq(rs.getInt("review_seq"));
			rdto.setComment_seq(rs.getInt("comment_seq"));
			rdto.setComment_writer_seq(rs.getInt("comment_writer"));
			rdto.setComment_writer(mdao.getUserNickname(rs.getInt("comment_writer")));
			rdto.setComment_text(rs.getString("comment_text"));
			rdto.setComment_time(rs.getString("comment_time"));
			result.add(rdto);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}

	public int getReviewArticleCount(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "update reviewboard set review_viewcount=nvl(review_viewcount,0)+1 where review_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, review_seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}

	public int deleteReview(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "delete from reviewboard where review_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		int result = pstmt.executeUpdate();
		con.commit();
		pstmt.close();
		con.close();
		return result;
	}

	/*public List<ReviewDTO> getAllMyReview (int review_writer) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from reviewboard where review_writer=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_writer);
		ResultSet rs = pstmt.executeQuery();
		List<ReviewDTO> result = new ArrayList<>();
		while(rs.next()) {
			ReviewDTO rdto = new ReviewDTO();
			rdto.setReview_seq(rs.getInt("review_seq"));
			rdto.setReview_title(rs.getString("review_title"));
			rdto.setReview_contents(rs.getString("review_contents"));
			rdto.setReview_writer(rs.getInt("review_writer"));
			rdto.setReview_writerN(mdao.getUserNickname(rs.getInt("review_writer")));
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
			result.add(rdto);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}*/

	public List<ReviewDTO> getMyReview(int seq, int startNum, int endNum, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();

		String sql;
		PreparedStatement pstat = null;

		if(searchTerm == null || searchTerm.equals("null")) {
			sql = "select * from (select review_seq, review_title, review_contents, review_writer, to_char(review_writedate, 'YYYY/MM/DD') review_writedate, review_viewcount, row_number() over(order by review_seq desc) as num from reviewboard where review_writer=?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1,seq);
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
		} else {
			sql = "select * from (select review_seq, review_title, review_contents, review_writer, to_char(review_writedate, 'YYYY/MM/DD') review_writedate, review_viewcount, row_number() over(order by review_seq desc) as num from reviewboard where review_writer=? and review_title || review_contents like ?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1,seq);
			pstat.setString(2, "%"+searchTerm+"%");
			pstat.setInt(3, startNum);
			pstat.setInt(4, endNum);
		}
		ResultSet rs = pstat.executeQuery();

		List<ReviewDTO> myReviewResult = new ArrayList<>();

		while(rs.next()) {
			ReviewDTO rdto = new ReviewDTO();
			rdto.setReview_seq(rs.getInt(1));
			rdto.setReview_title(rs.getString(2));
			rdto.setReview_contents(rs.getString(3));
			rdto.setReview_writerN(mdao.getUserNickname(rs.getInt(4)));
			rdto.setReview_writedate(rs.getString(5));
			rdto.setReview_viewcount(rs.getInt(6));
			myReviewResult.add(rdto);
		}

		con.close();
		pstat.close();
		rs.close();	
		return myReviewResult;
	}

	public String getMyReviewPageNavi(int seq, int currentPage, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();		
		String sql;
		PreparedStatement pstat;
		ResultSet rs;

		if(searchTerm == null || searchTerm.equals("")) {
			sql = "select count(*) totalCount from reviewboard where review_writer=?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
		} else {
			sql = "select count(*) totalCount from reviewboard where review_writer=? and review_title || review_contents like ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
			pstat.setString(2, "%"+searchTerm+"%");
		
		}

		rs = pstat.executeQuery();
		rs.next();

		int recordTotalCount = rs.getInt("totalCount"); 
		//System.out.println(recordTotalCount);
		int recordCountPerPage = 12;  
		int naviCountPerPage = 10;  
		int pageTotalCount = 0;  

		if(recordTotalCount % recordCountPerPage > 0 ) { 
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		//------------------------------------------------------------------------------------------	
		//int currentPage = 1;		
		if(currentPage < 1) {	
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}		
		//------------------------------------------------------------------------------------------		
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;  
		int endNavi = startNavi + (naviCountPerPage - 1);  

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
			sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+i+"&search="+searchTerm+"'>"+i+"</a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}

		con.close();
		pstat.close();
		rs.close();

		return sb.toString();
	}

	public int deleteReviewComment (int comment_seq, int comment_writer_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "delete from review_comment where comment_seq=? and comment_writer=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, comment_seq);
		pstat.setInt(2, comment_writer_seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		System.out.println(result);
		return result;
	}
	public int reViewCount(int review_seq) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE reviewboard set review_viewcount = review_viewcount + 1 where review_seq = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		conn.close();
		return result;
	}

}
