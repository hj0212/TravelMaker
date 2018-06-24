package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDTO;

public class MemberDAO {
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String dbURL = "jdbc:oracle:thin:@59.10.249.73:1521:XE";
		String dbId = "kh";
		String dbPw = "kh";
		return DriverManager.getConnection(dbURL,dbId,dbPw);
	}
	
	public int addNaverMember(MemberDTO dto) throws Exception{
		if(!check(dto.getNaver_id())) {
			Connection conn = this.getConnection();
			String sql = "insert into users (seq, naver_id, naver_nickname, naver_email) VALUES (users_seq.nextval, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, dto.getNaver_id());
			pstmt.setString(2, dto.getNaver_nickname());
			pstmt.setString(3, dto.getNaver_email());
			
			int result = pstmt.executeUpdate();		
			conn.commit();
			pstmt.close();
			conn.close();
			return result;	
		}
		
		return 0;
	}
	
	private boolean check(String id) throws Exception {
		Connection conn = this.getConnection();
		String sql = "select * from users where naver_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		boolean result;
		if(rs.next()) {
			result = true;
		} else {
			result = false;
		}
		
		rs.close();
		conn.close();
		pstmt.close();
		
		return result;
	}
	
}