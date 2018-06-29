package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.BudgetDTO;
import dto.PlanDTO;
import dto.ScheduleDTO;

public class PlanDAO {
	public String getPlantitle(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select plan_title from plan where plan_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);
		ResultSet rs = pstmt.executeQuery();
		String result = "";
		if(rs.next()) {
			result = rs.getString(1);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	public int getScheduleseq() throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select max(schedule_seq) from schedule";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	public int addBudget(BudgetDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "insert into budget (plan_seq,day_seq,budget_seq,schedule_seq,budget_plan,budget_amount) VALUES (?,?,budget_seq.nextval, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setInt(3, dto.getSchedule_seq());
		pstmt.setString(4, dto.getBudget_plan());
		pstmt.setInt(5, dto.getBudget_amount());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.commit();
		con.close();

		return result;
	}

	public int addSchedule(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "insert into schedule VALUES (?,?,schedule_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setString(3, dto.getSchedule_starttime());
		pstmt.setString(4, dto.getSchedule_endtime());
		pstmt.setString(5, dto.getLocation_id());
		pstmt.setString(6, dto.getSchedule_plan());
		pstmt.setString(7, dto.getSchedule_ref());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.commit();
		con.close();

		return result;
	}
	
	public int updateSchedule(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "update schedule set schedule_starttime=?, schedule_endtime=?, location_id=?,schedule_plan=?,schedule_ref=? where schedule_seq=? ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getSchedule_starttime());
		pstmt.setString(2, dto.getSchedule_endtime());
		pstmt.setString(3, dto.getLocation_id());
		pstmt.setString(4, dto.getSchedule_plan());
		pstmt.setString(5, dto.getSchedule_ref());
		pstmt.setInt(6, dto.getSchedule_seq());
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.commit();
		con.close();

		return result;
	}

	public List<ScheduleDTO> selectSchedule(int plan, int day) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from schedule where plan_seq = ? and day_seq = ? order by 4";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan);
		pstmt.setInt(2, day);
		
		ResultSet rs = pstmt.executeQuery();

		List<ScheduleDTO> result = new ArrayList<>();
		while(rs.next()) {
			ScheduleDTO tmp = new ScheduleDTO();
			tmp.setPlan_seq(rs.getInt(1));
			tmp.setDay_seq(rs.getInt(2));
			tmp.setSchedule_seq(rs.getInt(3));
			tmp.setSchedule_starttime(rs.getString(4));
			tmp.setSchedule_endtime(rs.getString(5));
			tmp.setLocation_id(rs.getString(6));
			tmp.setSchedule_plan(rs.getString(7));
			tmp.setSchedule_ref(rs.getString(8));
			result.add(tmp);
		}

		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	public List<BudgetDTO> selectBudget(int plan, int day) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from budget where plan_seq = ? and day_seq = ? order by 2";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan);
		pstmt.setInt(2, day);
		System.out.println(plan + ":" + day);
		ResultSet rs = pstmt.executeQuery();

		List<BudgetDTO> result = new ArrayList<>();
		while(rs.next()) {
			BudgetDTO tmp = new BudgetDTO();
			tmp.setPlan_seq(plan);
			tmp.setDay_seq(day);
			tmp.setBudget_seq(rs.getInt(3));
			tmp.setSchedule_seq(rs.getInt(4));
			tmp.setBudget_plan(rs.getString(5));
			tmp.setBudget_amount(rs.getInt(6));
			System.out.println(tmp.getBudget_amount());
			result.add(tmp);
		}

		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	public int startPlanInsertData(PlanDTO dto)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql ="insert into plan values(plan_seq.nextval,?,?,?,?,0,0,0,0)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_writer());
		pstmt.setString(2,dto.getPlan_startdate());
		pstmt.setString(3, dto.getPlan_enddate());
		pstmt.setString(4, dto.getPlan_title());
		int result = pstmt.executeUpdate();
		
		con.commit();
		con.close();
		pstmt.close();
		return result;
	}
	
	public int getSchedule_seq() throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select max(schedule_Seq) from schedule";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int seq = 0;
		if(rs.next()) {
			seq = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return seq;
	}
	
	public int getPlan_seq() throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select max(plan_seq) from plan";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		int seq = 0;
		if(rs.next()) {
			seq = rs.getInt(1);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return seq;
	}
}
