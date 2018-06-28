package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.ReviewDTO;

public class ReviewDAO {
	private MemberDAO mdao = new MemberDAO();
	
	public List<ReviewDTO> getAllReview() throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from reviewboard";
		PreparedStatement pstmt = con.prepareStatement(sql);		
		ResultSet rs = pstmt.executeQuery();
		List<ReviewDTO> result = new ArrayList<>();
		
		while(rs.next()) {
			int seq = rs.getInt("review_writer");
			
			ReviewDTO rdto = new ReviewDTO();
			rdto.setReview_seq(rs.getInt("review_seq"));
			rdto.setReview_title(rs.getString("review_title"));
			rdto.setReview_contents(rs.getString("review_contents"));
			rdto.setReview_writer(mdao.getUserNickname(seq));
			rdto.setReview_writedate(rs.getString("review_writedate"));
			rdto.setReview_viewcount(rs.getInt("review_viewcount"));
			result.add(rdto);
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
}
