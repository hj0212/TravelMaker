package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
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
			rdto.setReview_writer("reviewWriter");
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
		}
		rs.close();
		pstmt.close();
		con.close();
		return rdto;
		
	}
}
