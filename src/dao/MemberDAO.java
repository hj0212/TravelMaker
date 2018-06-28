package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBUtils.DBConnection;
import dto.MemberDTO;

public class MemberDAO {

	public boolean loginMember(MemberDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
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
		if(!check(dto.getUserid())) {
			System.out.println("여기");
			Connection con = DBConnection.getConnection();
			String sql = "insert into users (seq, userid, password, nickname, email) VALUES (users_seq.nextval, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getNickname());
			pstmt.setString(4, dto.getEmail());
			int result = pstmt.executeUpdate();
			
			con.commit();
			con.close();
			pstmt.close();

			return result;
		}
		
		return -1;
	}

	public int addNaverMember(MemberDTO dto) throws Exception {
		if(!navercheck(dto.getNaver_id())) {
			Connection con = DBConnection.getConnection();
			String sql = "insert into users (seq, naver_id, naver_nickname, naver_email, part) VALUES (users_seq.nextval, ?, ?, ?, 'naver')";
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
	
	public int addKakaoMember(MemberDTO dto) throws Exception {
		if(!kakaocheck(dto.getKakao_id())) {
			Connection con = DBConnection.getConnection();
			String sql = "insert into users (seq, kakao_id, kakao_nickname, kakao_email, part) VALUES (users_seq.nextval, ?, ?, ?, 'kakao')";
			PreparedStatement pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getKakao_id());
			pstmt.setString(2, dto.getKakao_nickname());
			pstmt.setString(3, dto.getKakao_email());

			int result = pstmt.executeUpdate();		
			con.commit();
			pstmt.close();
			con.close();
			return result;	
		}

		return 0;
	}
	
	private boolean check(String id) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from users where userid=?";
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

	private boolean navercheck(String id) throws Exception {
		Connection con = DBConnection.getConnection();
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
	
	private boolean kakaocheck(String id) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from users where kakao_id=?";
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

	public static String getUserNickname(int seq)throws Exception{
	      Connection con = DBConnection.getConnection();
	      String sql = "select part from users where seq=?";
	      PreparedStatement pstmt = con.prepareStatement(sql);
	      pstmt.setInt(1, seq);
	      ResultSet rs = pstmt.executeQuery();
	      rs.next();
	      String part = rs.getString(1);
	      System.out.println(part);
	      String nickname = "";
	         if(part.equals("home")) {
	            sql = "select nickname from users where seq=?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, seq);      
	            rs = pstmt.executeQuery();
	            rs.next();
	            nickname = rs.getString(1);
	         }else if (part.equals("naver")) {
	            sql = "select naver_nickname from users where seq =?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, seq);
	            rs = pstmt.executeQuery();
	            rs.next();
	            nickname = rs.getString(1);
	         }
	         else if (part.equals("kakao")) {
	            sql = "select kakao_nickname from users where seq = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, seq);
	            rs = pstmt.executeQuery();
	            rs.next();
	            nickname = rs.getString(1);
	         }
	         pstmt.close();
	         rs.close();
	         con.close();
	         return nickname;   
	   }
	
	public boolean isHomeMemberPW (String id, String pw) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from users where userid=? and password= ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
	}
	
	public MemberDTO getHomeMemberInfo(String id, String part) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from users where USERID=?";
		PreparedStatement pstmt= con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs= pstmt.executeQuery();
		if(part.equals("home")) {
			MemberDTO dto = new MemberDTO();
			if(rs.next()) {
				dto.setUserid(rs.getString("userid"));
				dto.setPassword(rs.getString("password"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
			}
			return dto;
		}else {
			return null;
		}
	}
	
	
	public int updateHomeMemberInfo(String id, String pw, String email, String nickname) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "update users set password=?, nickname=?, email=? where userid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, nickname);
		pstmt.setString(3, email);
		pstmt.setString(4, id);
		int result = pstmt.executeUpdate();
		con.commit();
		pstmt.close();
		con.close();
		return result;
	}
	
	public int updateEmail (String id, String part, String email) throws Exception{
		Connection con = DBConnection.getConnection();
		PreparedStatement pstmt=null;
		if(part.equals("home")) {
			String sql = "update users set email=? where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
		}else if(part.equals("naver")) {
			String sql = "upadate users set naver_email=? where naver_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
		}else if(part.equals("kakao")) {
			String sql = "update users set kakao_email=? where kakao_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, id);
		}
		int result = pstmt.executeUpdate();
		con.commit();
		pstmt.close();
		con.close();
		return result;
	}
	
	public int updatePw (String id, String pw) throws Exception{
	Connection con = DBConnection.getConnection();
	String sql = "update users set password =? where userid = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, pw);
	pstmt.setString(2, id);
	int result = pstmt.executeUpdate();
	con.commit();
	pstmt.close();
	con.close();
	return result;
	}
}