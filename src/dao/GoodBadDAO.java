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
	//review醫뗭븘�슂 �벑濡�
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
	//review醫뗭븘�슂 移댁슫�듃 
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
	//review醫뗭븘�슂 泥댄겕
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
	//review�떕�뼱�슂 �엯�젰
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
	//review�떕�뼱�슂 移댁슫�듃
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
	//review�떕�뼱�슂 以묐났 泥댄겕
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
	
	//free醫뗭븘�슂 �벑濡�
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
		//free醫뗭븘�슂 移댁슫�듃 
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
		//free醫뗭븘�슂 泥댄겕
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
		//free�떕�뼱�슂 �엯�젰
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
		//free�떕�뼱�슂 移댁슫�듃
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
		//free�떕�뼱�슂 以묐났 泥댄겕
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
		
		
		//plan醫뗭븘�슂 �벑濡�
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
		//plan醫뗭븘�슂 移댁슫�듃 
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
		//plan醫뗭븘�슂 泥댄겕
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
		//plan�떕�뼱�슂 �엯�젰
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
		//plan�떕�뼱�슂 移댁슫�듃
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
		//plan�떕�뼱�슂 以묐났 泥댄겕
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
		//�궡媛� 醫뗭븘�슂�븳 plan 寃뚯떆臾� �븘�떚�겢 踰덊샇�뱾 
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
		//醫뗭븘�슂�닔媛� 留롮� 寃뚯떆臾� 肉뚮━湲�
		public List<PlanDTO> bestPlanData()throws Exception{
			Connection con = DBConnection.getConnection();
			String sql ="select * from plan p, (select article_no, count from (select article_no,count(*) count from good_plan group by article_no order by count desc)) s where p.plan_seq = s.article_no and rownum <= 4 order by plan_good desc";
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
		//plan good�뿉 醫뗭븘�슂 �뾽�뜲�씠�듃
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
















