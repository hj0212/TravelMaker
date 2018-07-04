package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.GoodAllDTO;
import dto.MemberDTO;
import dto.PlanDTO;

public class GoodBadDAO {
	private MemberDAO mdao = new MemberDAO();
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
		//내가 좋아요한 plan 게시물 아티클 번호들 
		public List<PlanDTO> favoriteData(int goodId)throws Exception {
			Connection con = DBConnection.getConnection();
			String sql ="select * from plan, (select article_no from good_plan, users where seq=user_seq and seq = ? order by good_plan_seq desc) where plan_seq = article_no ";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,goodId);
			ResultSet rs = pstmt.executeQuery();
			List<PlanDTO> result = new ArrayList<>(); 
			while(rs.next()) {
				PlanDTO pdto = new PlanDTO();
				pdto.setPlan_title(rs.getString("PLAN_TITLE"));
				pdto.setPlan_seq(rs.getInt("PLAN_SEQ"));
				pdto.setPlan_writerN(mdao.getUserNickname(rs.getInt("PLAN_WRITER")));
				pdto.setPlan_viewcount(rs.getInt("plan_viewcount"));
				pdto.setPlan_good(rs.getInt("plan_good"));
				result.add(pdto);
			}
			con.close();
			rs.close();
			pstmt.close();
			return result;			
		}
		//좋아요수가 많은 게시물 뿌리기
		public List<PlanDTO> bestPlanData()throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from plan p, (select article_no, count from (select article_no,count(*) count from good_plan group by article_no order by count desc) where rownum <= 4) s where p.plan_seq = s.article_no order by plan_good desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			List<PlanDTO> result = new ArrayList<>();
			while(rs.next()) {
				PlanDTO pdto = new PlanDTO();
				pdto.setPlan_title(rs.getString("plan_title"));
				pdto.setPlan_writerN(mdao.getUserNickname(rs.getInt("PLAN_WRITER")));
				pdto.setPlan_good(rs.getInt("plan_good"));
				pdto.setPlan_seq(rs.getInt("plan_seq"));
				pdto.setPlan_viewcount(rs.getInt("plan_viewcount"));
				result.add(pdto);
			}
			con.close();
			rs.close();
			pstmt.close();
			return result;	
		}
		//plan good에 좋아요 업데이트
		public int plangoodUpdate(int article_no)throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="update plan set plan_good = plan_good+1 where plan_seq = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article_no);
			int planup = pstmt.executeUpdate();
			
			con.commit();
			con.close();
			pstmt.close();
			
			return planup;
		
		}
	
		
}
















