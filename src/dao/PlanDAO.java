package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBUtils.DBConnection;
import dto.BudgetDTO;
import dto.LocationDTO;
import dto.PlanDTO;
import dto.ScheduleDTO;

public class PlanDAO {
	
	private MemberDAO mdao = new MemberDAO();
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
	
	public int getTotalBudget(int plan, int day) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select sum(budget_amount) from budget where plan_seq = ? and day_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan);
		pstmt.setInt(2, day);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		con.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	public int addBudget(List<BudgetDTO> list) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "insert into budget VALUES (?,?,budget_seq.nextval, ?, ?, ?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		int result = 0;
		for(BudgetDTO dto:list) {
			pstmt.setInt(1, dto.getPlan_seq());
			pstmt.setInt(2, dto.getDay_seq());
			pstmt.setInt(3, dto.getSchedule_seq());
			pstmt.setString(4, dto.getBudget_plan());
			pstmt.setInt(5, dto.getBudget_amount());
			result = pstmt.executeUpdate();
		}
		
		con.commit();
		pstmt.close();
		con.close();

		return result;
	}
	
	
	
	public int addBudget(BudgetDTO dto) throws Exception {
		if(budgetcheck(dto)) {
			Connection con = DBConnection.getConnection();
			String sql = "insert into budget VALUES (?,?,budget_seq.nextval, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPlan_seq());
			pstmt.setInt(2, dto.getDay_seq());
			pstmt.setInt(3, dto.getSchedule_seq());
			pstmt.setString(4, dto.getBudget_plan());
			pstmt.setInt(5, dto.getBudget_amount());
			pstmt.executeUpdate();
			con.commit();
			
			int budget_seq = getBudgetseq(dto);
			
			pstmt.close();
			con.close();

			return budget_seq;
		}
		return -1;
	}
	
	public int getBudgetseq(BudgetDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select budget_seq from budget where plan_seq=? and day_seq=? and schedule_seq=? and budget_plan=? and budget_amount=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setInt(3, dto.getSchedule_seq());
		pstmt.setString(4, dto.getBudget_plan());
		pstmt.setInt(5, dto.getBudget_amount());
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	public boolean budgetcheck(BudgetDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select budget_seq from budget where plan_seq=? and day_seq=? and schedule_seq=? and budget_plan=? and budget_amount=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setInt(3, dto.getSchedule_seq());
		pstmt.setString(4, dto.getBudget_plan());
		pstmt.setInt(5, dto.getBudget_amount());
		ResultSet rs = pstmt.executeQuery();
		boolean result = true;
		if(rs.next()) {
			result = false;
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	public int addSchedule(ScheduleDTO dto) throws Exception {
		if(schedulecheck(dto)) {
			Connection con = DBConnection.getConnection();
			String sql = "insert into schedule VALUES (?,?,schedule_seq.nextval, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPlan_seq());
			pstmt.setInt(2, dto.getDay_seq());
			pstmt.setString(3, dto.getSchedule_starttime());
			pstmt.setString(4, dto.getSchedule_endtime());
			pstmt.setInt(5, dto.getLocation_id());
			pstmt.setString(6, dto.getSchedule_plan());
			pstmt.setString(7, dto.getSchedule_ref());
			pstmt.executeUpdate();
			con.commit();
			
			int schedule_seq = getScheduleseq(dto);
			
			pstmt.close();
			con.close();

			return schedule_seq;
		}
		return -1;
	}
	
	public int getScheduleseq(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select schedule_seq from schedule where plan_seq=? and day_seq=? and schedule_starttime=? and schedule_endtime=? and location_id=? and schedule_plan=? and schedule_ref=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setString(3, dto.getSchedule_starttime());
		pstmt.setString(4, dto.getSchedule_endtime());
		pstmt.setInt(5, dto.getLocation_id());
		pstmt.setString(6, dto.getSchedule_plan());
		pstmt.setString(7, dto.getSchedule_ref());
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	public boolean schedulecheck(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select schedule_seq from schedule where plan_seq=? and day_seq=? and schedule_starttime=? and schedule_endtime=? and location_id=? and schedule_plan=? and schedule_ref=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setString(3, dto.getSchedule_starttime());
		pstmt.setString(4, dto.getSchedule_endtime());
		pstmt.setInt(5, dto.getLocation_id());
		pstmt.setString(6, dto.getSchedule_plan());
		pstmt.setString(7, dto.getSchedule_ref());
		ResultSet rs = pstmt.executeQuery();
		boolean result = true;
		if(rs.next()) {
			result = false;
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	public int startPlanInsertData(PlanDTO dto)throws Exception{
		if(plancheck(dto)) {
			Connection con = DBConnection.getConnection();
			String sql ="insert into plan values(plan_seq.nextval,?,?,?,?,0,0,0,0)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPlan_writer());
			pstmt.setString(2,dto.getPlan_startdate());
			pstmt.setString(3, dto.getPlan_enddate());
			pstmt.setString(4, dto.getPlan_title());
			pstmt.executeUpdate();
			con.commit();
			
			int plan_seq = getPlanseq(dto);
			con.close();
			pstmt.close();
			return plan_seq;
		}
		return -1;
	}
	
	public int getPlanseq(PlanDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select plan_seq from plan where plan_writer=? and plan_startdate=? and plan_enddate=? and plan_title=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_writer());
		pstmt.setString(2,dto.getPlan_startdate());
		pstmt.setString(3, dto.getPlan_enddate());
		pstmt.setString(4, dto.getPlan_title());
		ResultSet rs = pstmt.executeQuery();
		int result = 0;
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	private boolean plancheck(PlanDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select plan_seq from plan where plan_writer=? and plan_startdate=? and plan_enddate=? and plan_title=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_writer());
		pstmt.setString(2,dto.getPlan_startdate());
		pstmt.setString(3, dto.getPlan_enddate());
		pstmt.setString(4, dto.getPlan_title());
		ResultSet rs = pstmt.executeQuery();
		boolean result = true;
		if(rs.next()) {
			result = false;
		}
		
		rs.close();
		con.close();
		pstmt.close();
		return result;
	}
	
	public int addLocation(LocationDTO dto) throws Exception {
		if(locationcheck(dto)) {
			Connection con = DBConnection.getConnection();
			String sql = "insert into location VALUES (location_seq.nextval, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getLocation_name());
			pstmt.setInt(2, dto.getLocation_x());
			pstmt.setInt(3, dto.getLocation_y());
			pstmt.executeUpdate();
			con.commit();
			
			int location_id = getLocationid(dto);
			
			pstmt.close();
			con.commit();
			con.close();

			return location_id;
		} else {
			return getLocationid(dto);
		}
	}
	
	private int getLocationid(LocationDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select location_id from location where location_name=? and location_x=? and location_y=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getLocation_name());
		pstmt.setInt(2, dto.getLocation_x());
		pstmt.setInt(3, dto.getLocation_y());
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
	
	private boolean locationcheck(LocationDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select location_id from location where location_name=? and location_x=? and location_y=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getLocation_name());
		pstmt.setInt(2, dto.getLocation_x());
		pstmt.setInt(3, dto.getLocation_y());
		ResultSet rs = pstmt.executeQuery();
		boolean result = true;
		if(rs.next()) {
			result = false;
		}
		
		rs.close();
		pstmt.close();
		con.close();

		return result;
	}
	
	public int updateSchedule(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "update schedule set schedule_starttime=?, schedule_endtime=?, location_id=?,schedule_plan=?,schedule_ref=? where schedule_seq=? ";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getSchedule_starttime());
		pstmt.setString(2, dto.getSchedule_endtime());
		pstmt.setInt(3, dto.getLocation_id());
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
		String sql = "select plan_seq, day_seq, schedule_seq, schedule_starttime, schedule_endtime, s.location_id, l.location_name, schedule_plan, schedule_ref from schedule s, location l where l.location_id = s.location_id and plan_seq = ? and day_seq = ? order by 4";
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
			tmp.setLocation_id(rs.getInt(6));
			tmp.setLocation_name(rs.getString(7));
			tmp.setSchedule_plan(rs.getString(8));
			tmp.setSchedule_ref(rs.getString(9));
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
			result.add(tmp);
		}

		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	
	public List<PlanDTO> getSomePlan(int startNum, int endNum, String searchTerm)throws Exception{
		Connection con = DBConnection.getConnection();
		String sql;
		PreparedStatement pstat = null;
		
		if(searchTerm == null || searchTerm.equals("null")) {
		sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, row_number() over(order by plan_seq desc) as num from plan) where num between ? and ?";
		pstat = con.prepareStatement(sql);
		pstat.setInt(1, startNum);
		pstat.setInt(2, endNum);
		} else {
			sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, row_number() over(order by plan_seq desc) as num from plan where plan_title like ?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, "%"+searchTerm+"%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
		}
		ResultSet rs = pstat.executeQuery();
		ArrayList<PlanDTO> result = new ArrayList<>();

		while(rs.next()) {
			PlanDTO tmp = new PlanDTO();
			tmp.setPlan_seq(rs.getInt(1));
			tmp.setPlan_writerN(mdao.getUserNickname(rs.getInt(2)));
			tmp.setPlan_title(rs.getString(3));
			tmp.setPlan_good(rs.getInt(4));
			tmp.setPlan_viewcount(rs.getInt(5));
			
			result.add(tmp);
		}
		
		con.close();
		pstat.close();
		rs.close();
		return result;
	}
//--------------------------페이지 네비게이터	
	public String getPageNavi(int currentPage, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql;
		PreparedStatement pstat;
		ResultSet rs;
		
		if(searchTerm == null || searchTerm.equals("null")) {
			sql = "select count(*) totalCount from plan";
			pstat = con.prepareStatement(sql);
		} else {
			sql = "select count(*) totalCount from plan where plan_title like ?";
			pstat = con.prepareStatement(sql);
			pstat.setString(1, "%"+searchTerm+"%");
		}
		
		rs = pstat.executeQuery();
		rs.next();
		
		int recordTotalCount = rs.getInt("totalCount"); // �쟾泥� 湲�(�젅肄붾뱶)�쓽 媛쒖닔瑜� ���옣�븯�뒗 蹂��닔
		int recordCountPerPage = 12;  // �븳 �럹�씠吏��뿉 寃뚯떆湲��씠 紐뉕컻 蹂댁씪嫄댁�
		int naviCountPerPage = 10;  // �븳 �럹�씠吏��뿉�꽌 �꽕鍮꾧쾶�씠�꽣媛� 紐뉕컻�뵫 蹂댁씪嫄댁�
		int pageTotalCount = 0;  // �쟾泥닿� 紐뉙럹�씠吏�濡� 援ъ꽦�맆寃껋씤吏�
		
		if(recordTotalCount % recordCountPerPage > 0 ) { 
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}
		
		//------------------------------------------------------------------------------------------
	
		if(currentPage < 1) {	
			currentPage = 1;
		} else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
			
		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;  
		int endNavi = startNavi + (naviCountPerPage - 1);  
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev = false;
		} 
		
		if(endNavi == pageTotalCount) {
			needNext = false;
		}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) {
			sb.append("<li class='page-item'><a class='page-link' href='planboard.plan?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
		}
		
		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item'><a class='page-link' href='planboard.plan?currentPage="+i+"&search="+searchTerm+"'>"+i+"</a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='planboard.plan?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
			}
		}
		
		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='planboard.plan?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}
		
		con.close();
		pstat.close();
		rs.close();
		
		return sb.toString();
	}	
	
}
