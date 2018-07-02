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
		String sql = "INSERT INTO free_comment values(?,free_comment_seq.nextval,?,?,sysdate)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, articleseq);
		pstmt.setString(2, comment);
		pstmt.setInt(3, writer);
		
		int result = pstmt.executeUpdate();
		
		conn.commit();
		pstmt.close();
		conn.close();
		return articleseq;
	}
	
	public List<FreeCommentDTO> viewCommentList(int seq) throws Exception{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM FREE_COMMENT WHERE FREE_SEQ = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<FreeCommentDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			FreeCommentDTO dto = new FreeCommentDTO();
			dto.setFree_seq(rs.getInt(1));
			dto.setComment_seq(rs.getInt(2));
			dto.setComment_text(rs.getString(3));
			dto.setComment_writer(rs.getInt(4));
			dto.setComment_time(rs.getString(5));
			list.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		return list;
	}
}
