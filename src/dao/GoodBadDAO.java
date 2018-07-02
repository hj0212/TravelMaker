package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBUtils.DBConnection;

public class GoodBadDAO {
	//review좋아요 등록
	public int reviewGoodInsertData(int article,int user_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "insert into good_review values(good_review_seq.nextval,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,article);
		pstmt.setInt(2, user_seq);
		
		int result = pstmt.executeUpdate();
		con.commit();
		con.close();
		pstmt.close();
		return result;
	}
	//review좋아요 카운트 
	public int reviewGoodSelectData(int article)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql ="select count(*) from good_review where article_no = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, article);
		ResultSet rs = pstmt.executeQuery();
	  	rs.next();
	  	int count = rs.getInt(1);
	  	con.close();
	  	pstmt.close();
	  	rs.close();
	  	
	  	return count;	
	}
	//review좋아요 체크
	public boolean reviewGoodBtnCheck(int article,int user_seq)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql ="select * from good_review where article_no=? and user_seq =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, article);
		pstmt.setInt(2, user_seq);
		ResultSet rs = pstmt.executeQuery();
		boolean check =  rs.next();
		con.close();
		rs.close();
		pstmt.close();
		
		return check;
		
	}
	//review싫어요 입력
	public int reviewBadInsertData(int article, int user_seq)throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="insert into hate_review values(hate_review_seq.nextval,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, article);
		pstmt.setInt(2, user_seq);
		int result = pstmt.executeUpdate();
		con.commit();
		con.close();
		pstmt.close();
		return result;
			
	}
	//review싫어요 카운트
	public int reviewBadSelectData(int article)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql="select count(*) from hate_review where article_no=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, article);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		con.close();
		rs.close();
		pstmt.close();
		
		return count;	
	}
	//review싫어요 중복 체크
	public boolean reviewBadCheck(int article,int user_seq)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql ="select * from hate_review where article_no =? and user_seq =?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, article);
		pstmt.setInt(2, user_seq);
		ResultSet rs = pstmt.executeQuery();
		boolean check = rs.next();
		con.close();
		rs.close();
		pstmt.close();
		
		return check;		
	}
	
	//free좋아요 등록
		public int freeGoodInsertData(int article,int user_seq) throws Exception{
			Connection con = DBConnection.getConnection();
			String sql = "insert into good_free values(good_free_seq.nextval,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,article);
			pstmt.setInt(2, user_seq);
			
			int result = pstmt.executeUpdate();
			con.commit();
			con.close();
			pstmt.close();
			return result;
		}
		//free좋아요 카운트 
		public int freeGoodSelectData(int article)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select count(*) from good_free where article_no = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			ResultSet rs = pstmt.executeQuery();
		  	rs.next();
		  	int count = rs.getInt(1);
		  	con.close();
		  	pstmt.close();
		  	rs.close();
		  	
		  	return count;	
		}
		//free좋아요 체크
		public boolean freeGoodBtnCheck(int article,int user_seq)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from good_free where article_no=? and user_seq =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			ResultSet rs = pstmt.executeQuery();
			boolean check =  rs.next();
			con.close();
			rs.close();
			pstmt.close();
			
			return check;
			
		}
		//free싫어요 입력
		public int freeBadInsertData(int article, int user_seq)throws Exception {
			Connection con = DBConnection.getConnection();
			String sql ="insert into hate_free values(hate_free_seq.nextval,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			int result = pstmt.executeUpdate();
			con.commit();
			con.close();
			pstmt.close();
			return result;
				
		}
		//free싫어요 카운트
		public int freeBadSelectData(int article)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql="select count(*) from hate_free where article_no=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			con.close();
			rs.close();
			pstmt.close();
			
			return count;	
		}
		//free싫어요 중복 체크
		public boolean freeBadCheck(int article,int user_seq)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from hate_free where article_no =? and user_seq =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			ResultSet rs = pstmt.executeQuery();
			boolean check = rs.next();
			con.close();
			rs.close();
			pstmt.close();
			
			return check;		
		}
		
		
		//plan좋아요 등록
		public int planGoodInsertData(int article,int user_seq) throws Exception{
			Connection con = DBConnection.getConnection();
			String sql = "insert into good_plan values(good_plan_seq.nextval,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,article);
			pstmt.setInt(2, user_seq);
			
			int result = pstmt.executeUpdate();
			con.commit();
			con.close();
			pstmt.close();
			return result;
		}
		//plan좋아요 카운트 
		public int planGoodSelectData(int article)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select count(*) from good_plan where article_no = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			ResultSet rs = pstmt.executeQuery();
		  	rs.next();
		  	int count = rs.getInt(1);
		  	con.close();
		  	pstmt.close();
		  	rs.close();
		  	
		  	return count;	
		}
		//plan좋아요 체크
		public boolean planGoodBtnCheck(int article,int user_seq)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from good_plan where article_no=? and user_seq =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			ResultSet rs = pstmt.executeQuery();
			boolean check =  rs.next();
			con.close();
			rs.close();
			pstmt.close();
			
			return check;
			
		}
		//plan싫어요 입력
		public int planBadInsertData(int article, int user_seq)throws Exception {
			Connection con = DBConnection.getConnection();
			String sql ="insert into hate_plan values(hate_plan_seq.nextval,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			int result = pstmt.executeUpdate();
			con.commit();
			con.close();
			pstmt.close();
			return result;
				
		}
		//plan싫어요 카운트
		public int planBadSelectData(int article)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql="select count(*) from hate_plan where article_no=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			con.close();
			rs.close();
			pstmt.close();
			
			return count;	
		}
		//plan싫어요 중복 체크
		public boolean planBadCheck(int article,int user_seq)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from hate_plan where article_no =? and user_seq =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article);
			pstmt.setInt(2, user_seq);
			ResultSet rs = pstmt.executeQuery();
			boolean check = rs.next();
			con.close();
			rs.close();
			pstmt.close();
			
			return check;		
		}
}
