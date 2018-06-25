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
	
	public boolean loginMember(MemberDTO dto) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from users where userid = ? and password = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getUserid());
		pstmt.setString(2, dto.getPassword());
		ResultSet rs = pstmt.executeQuery();
		boolean result;
		if(rs.next()) {
			result = true;
		} else {
			result = false;
		}
		
		con.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	public int addMember(MemberDTO dto) throws Exception {
		Connection con = this.getConnection();
		String sql = "insert into users (seq, userid, password, nickname, email) VALUES (users_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getUserid());
		pstmt.setString(2, dto.getPassword());
		pstmt.setString(3, dto.getNickname());
		pstmt.setString(4, dto.getEmail());
		int result = pstmt.executeUpdate();
		
		con.close();
		pstmt.close();
		
		return result;
	}
	
	public int addNaverMember(MemberDTO dto) throws Exception {
		if(!check(dto.getNaver_id())) {
			Connection con = this.getConnection();
			String sql = "insert into users (seq, naver_id, naver_nickname, naver_email) VALUES (users_seq.nextval, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
	
			pstmt.setString(1, dto.getNaver_id());
			pstmt.setString(2, dto.getNaver_nickname());
			pstmt.setString(3, dto.getNaver_email());
			
			int result = pstmt.executeUpdate();		
			con.commit();
			pstmt.close();
			con.close();
			return result;	
		}
		
		return 0;
	}
	
	private boolean check(String id) throws Exception {
		Connection con = this.getConnection();
		String sql = "select * from users where naver_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		boolean result;
		if(rs.next()) {
			result = true;
		} else {
			result = false;
		}
		
		rs.close();
		con.close();
		pstmt.close();
		
		return result;
	}
	
}