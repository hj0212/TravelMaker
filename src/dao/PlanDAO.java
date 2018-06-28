package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.ScheduleDTO;

public class PlanDAO {
	public int addSchedule(List<ScheduleDTO> list) throws Exception {
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
	
	public List<ScheduleDTO> selectSchedule(int day_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from day where day_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<ScheduleDTO> result = new ArrayList<>();
		while(rs.next()) {
			ScheduleDTO tmp = new ScheduleDTO();
			tmp.setSchedule_seq(rs.getInt(1));
			tmp.setSchedule_starttime(rs.getString(2));
			tmp.setSchedule_endtime(rs.getString(3));
			tmp.setLocation_id(rs.getString(4));
			tmp.setSchedule_plan(rs.getString(5));
			tmp.setSchedule_ref(rs.getString(6));
			result.add(tmp);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
}
