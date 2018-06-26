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

	public MemberDTO getProfileInfo(String part, String id)throws Exception{
		Connection con = DBConnection.getConnection();
		MemberDTO dto = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
			if(part.equals("home")) {
				String sql = "select nickname, email, part from users where userid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);		
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setNickname(rs.getString("nickname"));
					dto.setEmail(rs.getString("email"));
					dto.setPart(rs.getString("part"));
				}
			}else if (part.equals("naver")) {
				String sql = "select naver_nickname, naver_email, part from users where naver_id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setNaver_nickname(rs.getString("naver_nickname"));
					dto.setNaver_email(rs.getString("naver_email"));
					dto.setPart(rs.getString("part"));
				}
			}
			else if (part.equals("kakao")) {
				String sql = "select kakao_nickname, kakao_email, part from users where kakao_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setKakao_nickname(rs.getString("KAKAO_NICKNAME"));
					dto.setKakao_email(rs.getString("kakao_email"));
					dto.setPart(rs.getString("part"));
				}
			}
			
			pstmt.close();
			rs.close();
			con.close();
			return dto;
		

		
	}
}