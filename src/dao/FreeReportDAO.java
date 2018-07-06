package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBUtils.DBConnection;

public class FreeReportDAO {
	
	public int freeReport(int reporter, int free_seq) throws Exception{
		int result = 0;
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT COUNT(*) FROM REPORT_FREE WHERE REPORT_USER = ? AND FREE_SEQ = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = null;
		pstmt.setInt(1, reporter);
		pstmt.setInt(2, free_seq);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		pstmt.close();
		
		if(result == 0) {
			sql = "INSERT INTO REPORT_FREE VALUES(report_free_seq.nextval,?,?,sysdate)";
			PreparedStatement pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, free_seq);
			pstmt2.setInt(2, reporter);
			pstmt2.executeUpdate();
			pstmt2.close();
		}
		
		rs.close();
		conn.commit();
		conn.close();
		return result;
	}
}
