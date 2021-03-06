package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.FreeCommentDTO;

public class FreeCommentDAO {
	public int insertComment(int articleseq, String comment, int writer) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO free_comment values(free_comment_seq.nextval,?,?,sysdate,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comment);
		pstmt.setInt(2, writer);
		pstmt.setInt(3, articleseq);
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		conn.close();
		return articleseq;
	}
	
	public List<FreeCommentDTO> viewCommentList(int seq) throws Exception{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM FREE_COMMENT WHERE FREE_SEQ = ? ORDER BY COMMENT_SEQ ASC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<FreeCommentDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			FreeCommentDTO dto = new FreeCommentDTO();
			dto.setComment_seq(rs.getInt(1));
			dto.setComment_text(rs.getString(2));
			dto.setComment_writer(rs.getInt(3));
			dto.setComment_time(rs.getString(4));
			dto.setFree_seq(rs.getInt(5));
			list.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
	
	public int deleteComment(int articleseq, int commentseq) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "DELETE FROM FREE_COMMENT WHERE FREE_SEQ = ? AND COMMENT_SEQ = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, articleseq);
		pstmt.setInt(2, commentseq);
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		conn.close();
		return result;
	}
}
