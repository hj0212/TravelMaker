package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBUtils.DBConnection;

public class ReviewReportDAO {
	
	public int reviewReport(int reporter, int review_seq) throws Exception {
		int result = 0;
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT COUNT(*) FROM REPORT WHERE REPORT_USER = ? AND REVIEW_SEQ = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		pstmt.setInt(1, reporter);
		pstmt.setInt(2, review_seq);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		pstmt.close();
		
		if(result == 0) {
			sql = "INSERT INTO REPORT VALUES(report_seq.nextval,?,sysdate,?)";
			PreparedStatement pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, reporter);
			pstmt2.setInt(2, review_seq);
			pstmt2.executeUpdate();
			pstmt2.close();
		}
		
		rs.close();
		conn.commit();
		conn.close();
		return result;
	}
}
