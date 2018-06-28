package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
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
	
	public int addScheduleList(List<ScheduleDTO> list) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "insert into schedule VALUES (schedule_seq.nextval, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		for(int i = 0; i < list.size(); i++) {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, list.get(i).getSchedule_starttime());
			pstmt.setString(2, list.get(i).getSchedule_endtime());
			pstmt.setString(3, list.get(i).getLocation_id());
			pstmt.setString(4, list.get(i).getSchedule_plan());
			pstmt.setString(5, list.get(i).getSchedule_budget());
			pstmt.setString(6, list.get(i).getSchedule_ref());
			result = pstmt.executeUpdate();
			pstmt.close();
		}

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
	
	private int getSchedule_seq() throws Exception {
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
}
