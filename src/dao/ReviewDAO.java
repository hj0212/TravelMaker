package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.ReviewCommentDTO;
import dto.ReviewDTO;

public class ReviewDAO {

	public List<ReviewDTO> getAllArticles (int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from reviewboard where review_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		List<ReviewDTO> result = new ArrayList<>();
		while(rs.next()) {
			ReviewDTO rdto = new ReviewDTO();
			rdto.setReview_seq(rs.getInt("review_seq"));
			rdto.setReview_title(rs.getString("review_title"));
			rdto.setReview_writer("review_writer");
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
			result.add(rdto);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ReviewDTO getReviewArticle(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from reviewboard where review_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		ReviewDTO rdto = new ReviewDTO();
		if(rs.next()) {
			rdto.setReview_seq(rs.getInt("reviw_seq"));
			rdto.setReview_title(rs.getString("review_title"));
			rdto.setReview_contents(rs.getString("reviw_contents"));
			rdto.setReview_writer(rs.getString(MemberDAO.getUserNickname(rs.getInt("review_writer"))));
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return rdto;
		
	}
	
	public int insertReviewComment(String comment_text, int comment_writer_seq, int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "insert into review_comment values(comment_seq.nextval,?,?,sysdate) select comment_text, comment_writer from review_comment where review_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, comment_text);
		pstmt.setInt(2, comment_writer_seq);
		pstmt.setInt(3, review_seq);
		int result = pstmt.executeUpdate();
		con.commit();
		pstmt.close();
		con.close();
		return result;
	}
	
	public List<ReviewCommentDTO> getReviewComment(int review_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from review_comment where review_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, review_seq);
		ResultSet rs = pstmt.executeQuery();
		List<ReviewCommentDTO> result = new ArrayList<>();
		while(rs.next()) {
			ReviewCommentDTO rdto = new ReviewCommentDTO();
			rdto.setComment_writer(MemberDAO.getUserNickname(rs.getInt("comment_writer_seq")));
			rdto.setComment_text(rs.getString("comment_text"));
			rdto.setComment_time(rs.getString("comment_time"));
			result.add(rdto);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
}
