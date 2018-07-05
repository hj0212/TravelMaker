package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DBUtils.DBConnection;
import dto.BudgetDTO;
import dto.LocationDTO;
import dto.PlanCommentDTO;
import dto.PlanDTO;
import dto.ScheduleDTO;

public class PlanDAO {

	private MemberDAO mdao = new MemberDAO();
	public PlanDTO getPlandata(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select plan_seq, plan_writer,to_char(plan_startdate, 'YYYY/MM/DD') plan_startdate,to_char(plan_enddate, 'YYYY/MM/DD') plan_enddate,plan_title,plan_viewcount from plan where plan_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);
		ResultSet rs = pstmt.executeQuery();
		PlanDTO dto = null;
		if(rs.next()) {
			dto = new PlanDTO();
			dto.setPlan_seq(plan_seq);
			dto.setPlan_writer(rs.getInt(2));
			dto.setPlan_writerN(mdao.getUserNickname(dto.getPlan_writer()));
			dto.setPlan_startdate(rs.getString(3));
			dto.setPlan_enddate(rs.getString(4));
			dto.setPlan_title(rs.getString(5));
			dto.setPlan_viewcount(rs.getInt(6));
		}

		rs.close();
		pstmt.close();
		con.close();
		return dto;
	}
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

	public int getPlanperiod(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select plan_enddate-plan_startdate+1 from plan where plan_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);
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
		int result = 0;
		for(BudgetDTO dto:list) {
			if(budgetcheck(dto)) {
				Connection con = DBConnection.getConnection();
				String sql = "insert into budget VALUES (?,?,budget_seq.nextval, ?, ?, ?)";
				PreparedStatement pstmt = con.prepareStatement(sql);

				pstmt.setInt(1, dto.getPlan_seq());
				pstmt.setInt(2, dto.getDay_seq());
				pstmt.setInt(3, dto.getSchedule_seq());
				pstmt.setString(4, dto.getBudget_plan());
				pstmt.setInt(5, dto.getBudget_amount());
				result = pstmt.executeUpdate();

				con.commit();

				pstmt.close();
				con.close();
			} else {
				Connection con = DBConnection.getConnection();
				String sql = "update budget set budget_plan=?, budget_amount=? where budget_seq=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getBudget_plan());
				pstmt.setInt(2, dto.getBudget_amount());
				pstmt.setInt(3, dto.getBudget_seq());
				result = pstmt.executeUpdate();

				con.commit();

				pstmt.close();
				con.close();
			}

		}
		return result;
	}

	public int modiBudget(List<BudgetDTO> list) throws Exception {
		int result = 0;
		for(BudgetDTO dto:list) {
			if(budgetseqcheck(dto)) {
				System.out.println(dto.getBudget_seq()+":"+dto.getBudget_plan()+":"+dto.getBudget_amount());
				Connection con = DBConnection.getConnection();
				String sql = "update budget set budget_plan=?, budget_amount=? where budget_seq = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getBudget_plan());
				pstmt.setInt(2, dto.getBudget_amount());
				pstmt.setInt(3, dto.getBudget_seq());
				result = pstmt.executeUpdate();

				con.commit();
				pstmt.close();
				con.close();
			}
			result = -1;
		}
		return result;
	}

	public int deleteBudget(List<BudgetDTO> list) throws Exception {
		int result = 0;
		for(BudgetDTO dto:list) {
			Connection con = DBConnection.getConnection();
			String sql ="delete from budget where budget_seq=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBudget_seq());
			result = pstmt.executeUpdate();

			con.commit();

			pstmt.close();
			con.close();
		}
		return result;
	}

	public int deleteBudget(int delseq) throws Exception {
		int result = 0;
		if(!budgetcheckseq(delseq)) {
			Connection con = DBConnection.getConnection();
			String sql ="delete from budget where schedule_seq=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, delseq);
			result = pstmt.executeUpdate();

			con.commit();

			pstmt.close();
			con.close();

			return result;

		}
		return 0;
	}



	/*public int addBudget(BudgetDTO dto) throws Exception {
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
	}*/

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
	
	public boolean budgetseqcheck(BudgetDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select * from budget where budget_seq=? and budget_plan=? and budget_amount=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getBudget_seq());
		pstmt.setString(2, dto.getBudget_plan());
		pstmt.setInt(3, dto.getBudget_amount());
		ResultSet rs = pstmt.executeQuery();
		boolean result = true;
		if(rs.next()) {
			result = false;
		}
		System.out.println("budgetseqcheck:" + result);

		rs.close();
		con.close();
		pstmt.close();
		return result;
	}

	public boolean budgetcheckseq(int delseq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select * from budget where schedule_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, delseq);
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

	public int deleteSchedule(int delseq) throws Exception {
		int result = 0;
		if(!schedulecheck(delseq)) {
			Connection con = DBConnection.getConnection();
			String sql = "delete from schedule where schedule_seq=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, delseq);
			result = pstmt.executeUpdate();

			con.commit();

			pstmt.close();
			con.close();

			return result;
		}
		return result;
	}

	public int getScheduleseq(ScheduleDTO dto) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select schedule_seq from schedule where plan_seq=? and day_seq=? and schedule_starttime=? and schedule_endtime=? and location_id=? and schedule_plan=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, dto.getPlan_seq());
		pstmt.setInt(2, dto.getDay_seq());
		pstmt.setString(3, dto.getSchedule_starttime());
		pstmt.setString(4, dto.getSchedule_endtime());
		pstmt.setInt(5, dto.getLocation_id());
		pstmt.setString(6, dto.getSchedule_plan());
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

	public boolean schedulecheck(int seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql ="select * from schedule where schedule_seq=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, seq);
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
			String sql ="insert into plan values(plan_seq.nextval,?,?,?,?,0,0,0,'n')";
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
		if(locationcheck(dto.getLocation_id())) {
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
		}
		return dto.getLocation_id();
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

//	private boolean locationcheck(LocationDTO dto) throws Exception {
//		Connection con = DBConnection.getConnection();
//		String sql = "select * from location where location_name=? and location_x=? and location_y=?";
//		PreparedStatement pstmt = con.prepareStatement(sql);
//		pstmt.setString(1, dto.getLocation_name());
//		pstmt.setInt(2, dto.getLocation_x());
//		pstmt.setInt(3, dto.getLocation_y());
//		ResultSet rs = pstmt.executeQuery();
//		boolean result = true;
//		if(rs.next()) {
//			result = false;
//		}
//
//		rs.close();
//		pstmt.close();
//		con.close();
//
//		return result;
//	}

	private boolean locationcheck(int location_id) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from location where location_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, location_id);
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
		String sql = "select plan_seq, day_seq, schedule_seq, schedule_starttime, schedule_endtime, s.location_id, l.location_name, l.location_x, l.location_y, schedule_plan, schedule_ref from schedule s, location l where l.location_id = s.location_id and plan_seq = ? and day_seq = ? order by 4";
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
			tmp.setLocation_x(rs.getInt(8));
			tmp.setLocation_y(rs.getInt(9));
			tmp.setSchedule_plan(rs.getString(10));
			tmp.setSchedule_ref(rs.getString(11));
			result.add(tmp);
		}

		rs.close();
		pstmt.close();
		con.close();
		return result;
	}

	public List<ScheduleDTO> selectSchedule(int plan, int day, List<ScheduleDTO> result) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select plan_seq, day_seq, schedule_seq, schedule_starttime, schedule_endtime, s.location_id, l.location_name, schedule_plan, schedule_ref from schedule s, location l where l.location_id = s.location_id and plan_seq = ? and day_seq = ? order by 4";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan);
		pstmt.setInt(2, day);
		ResultSet rs = pstmt.executeQuery();

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

	public List<BudgetDTO> selectBudget(int plan, int day, List<BudgetDTO> result) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from budget where plan_seq = ? and day_seq = ? order by 2";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan);
		pstmt.setInt(2, day);
		ResultSet rs = pstmt.executeQuery();

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
			sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, row_number() over(order by plan_seq desc) as num from plan where plan_check = 'y') where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
		} else {
			sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, row_number() over(order by plan_seq desc) as num from plan where plan_check = 'y' and plan_title like ?) where num between ? and ?";
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
				System.out.println("1번임");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='planboard.plan?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
				System.out.println("2번임");
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

	public List<PlanCommentDTO> getAllPlanComments (int plan_seq) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "select * from plan_comment where plan_seq =?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		ResultSet rs = pstat.executeQuery();
		List<PlanCommentDTO> result = new ArrayList<>();
		while(rs.next()) {
			PlanCommentDTO pcdto = new PlanCommentDTO();
			pcdto.setPlan_seq(plan_seq);
			pcdto.setComment_seq(rs.getInt("comment_seq"));
			pcdto.setComment_text(rs.getString("comment_text"));
			pcdto.setComment_writer(rs.getInt("comment_writer"));
			pcdto.setComment_writerN(mdao.getUserNickname(rs.getInt("comment_writer")));
			result.add(pcdto);
		}
		rs.close();
		pstat.close();
		con.close();
		return result;
	}

	public int insertPlanComment (int plan_seq, String comment_text, int comment_writer) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "insert into plan_comment (plan_seq, comment_seq, comment_text, comment_writer, comment_time) values (?,plan_comment_seq.nextval,?,?,sysdate)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		pstat.setString(2, comment_text);
		pstat.setInt(3, comment_writer);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}

	public int deletePlanComment (int comment_seq, int writer) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql = "delete plan_comment where comment_seq=? and comment_writer=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, comment_seq);
		pstat.setInt(2, writer);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}

	public int removePlan(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "delete plan where plan_seq=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}

	public List<LocationDTO> selectLocation(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select * from location l, (select location_id from schedule where plan_seq = ? and location_id != -1) s where l.location_id = s.location_id";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		ResultSet rs = pstat.executeQuery();
		List<LocationDTO> result = new ArrayList<>();
		while(rs.next()) {
			LocationDTO dto = new LocationDTO();
			dto.setLocation_id(rs.getInt(1));
			dto.setLocation_name(rs.getString(2));
			dto.setLocation_x(rs.getInt(3));
			dto.setLocation_y(rs.getInt(4));
			result.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return result;
	}

	public List<ScheduleDTO> selectTimeline(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select s.day_seq, s.location_id, l.location_name from schedule s, location l where s.location_id = l.location_id and s.plan_seq = ? and s.location_id != -1 order by schedule_seq desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		ResultSet rs = pstat.executeQuery();
		List<ScheduleDTO> result = new ArrayList<>();
		while(rs.next()) {
			ScheduleDTO dto = new ScheduleDTO();
			dto.setDay_seq(rs.getInt(1));
			dto.setLocation_id(rs.getInt(2));
			dto.setLocation_name(rs.getString(3));
			result.add(dto);
		}
		rs.close();
		pstat.close();
		con.close();
		return result;
	}

	public List<PlanDTO> getMyPlans (int seq, int startNum, int endNum, String searchTerm) throws Exception{
		Connection con = DBConnection.getConnection();
		String sql;
		PreparedStatement pstat = null;

		if(searchTerm == null || searchTerm.equals("null")) {
			sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, to_char(plan_startdate,'YYYY/MM/DD'), to_char(plan_enddate,'YYYY/MM/DD'), row_number() over(order by plan_seq desc) as num from plan where plan_writer=?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
		} else {
			sql = "select * from (select plan_seq, plan_writer, plan_title, plan_good, plan_viewcount, to_char(plan_startdate,'YYYY/MM/DD'), to_char(plan_enddate,'YYYY/MM/DD'), row_number() over(order by plan_seq desc) as num from plan where plan_writer=? and plan_title like ?) where num between ? and ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
			pstat.setString(2, "%"+searchTerm+"%");
			pstat.setInt(3, startNum);
			pstat.setInt(4, endNum);
		}
		ResultSet rs = pstat.executeQuery();
		List<PlanDTO> result = new ArrayList<>();

		while(rs.next()) {
			PlanDTO pdto = new PlanDTO();
			pdto.setPlan_seq(rs.getInt(1));
			pdto.setPlan_writerN(mdao.getUserNickname(rs.getInt(2)));
			pdto.setPlan_writer(rs.getInt(2));
			pdto.setPlan_title(rs.getString(3));
			pdto.setPlan_good(rs.getInt(4));
			pdto.setPlan_viewcount(rs.getInt(5));
			pdto.setPlan_startdate(rs.getString(6));
			pdto.setPlan_enddate(rs.getString(7));
			result.add(pdto);
		}

		con.close();
		pstat.close();
		rs.close();
		return result;
	}
	//--------------------------페이지 네비게이터	
	public String getMyPlanPageNavi(int seq, int currentPage, String searchTerm) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql;
		PreparedStatement pstat;
		ResultSet rs;

		if(searchTerm == null || searchTerm.equals("")) {
			sql = "select count(*) totalCount from plan where plan_writer=?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
		} else {
			sql = "select count(*) totalCount from plan where plan_writer=? and plan_title like ?";
			pstat = con.prepareStatement(sql);
			pstat.setInt(1, seq);
			pstat.setString(2, "%"+searchTerm+"%");
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
			sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Previous'><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			if(currentPage == i) {
				sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+i+"&search="+searchTerm+"'>"+i+"</a></li>");
			} else {
				sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+i+"&search="+searchTerm+"'> "+i+"</a></li>");
			}
		}

		if(needNext) {
			sb.append("<li class='page-item'><a class='page-link' href='mypage.do?currentPage="+(startNavi-1)+"&search="+searchTerm+"' aria-label='Next'><span aria-hidden='true'>&raquo;</span><span class='sr-only'>Next</span></a></li>");
		}

		con.close();
		pstat.close();
		rs.close();

		return sb.toString();
	}
	public int planViewCount(int plan_seq) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE plan set plan_viewcount = plan_viewcount + 1 where plan_seq = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);

		int result = pstmt.executeUpdate();

		conn.commit();
		pstmt.close();
		conn.close();
		return result;
	}

	public List<ScheduleDTO> selectAllSchedule(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select  * from schedule where plan_seq = ? order by 4";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);
		ResultSet rs = pstmt.executeQuery();

		List<ScheduleDTO> result = new ArrayList<>();
		while(rs.next()) {
			ScheduleDTO tmp = new ScheduleDTO();
			tmp.setPlan_seq(plan_seq);
			tmp.setDay_seq(rs.getInt(2));
			tmp.setSchedule_seq(rs.getInt(3));
			tmp.setSchedule_starttime(rs.getString(4));
			tmp.setSchedule_endtime(rs.getString(5));
			tmp.setLocation_id(rs.getInt(6));
			tmp.setLocation_name(rs.getString(7));
			tmp.setLocation_x(rs.getInt(8));
			tmp.setLocation_y(rs.getInt(9));
			tmp.setSchedule_plan(rs.getString(10));
			tmp.setSchedule_ref(rs.getString(11));
			result.add(tmp);
		}

		rs.close();
		pstmt.close();
		con.close();
		return result;
	}

	public int savePlan(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "update plan set plan_check = 'y' where plan_seq = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, plan_seq);
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		return result;
	}
	
	public List<PlanDTO> getMyTmpPlan (int seq) throws Exception{
		Connection con = DBConnection.getConnection();
		List<PlanDTO> result = new ArrayList<>();
		String sql = "select * from plan where plan_writer = ? and plan_check= 'n' order by 1 order by 1 desc";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, seq);
		ResultSet rs = pstat.executeQuery();

		while(rs.next()) {
				PlanDTO pdto = new PlanDTO();
				pdto.setPlan_seq(rs.getInt("plan_seq"));
				pdto.setPlan_writerN(mdao.getUserNickname(rs.getInt("plan_writer")));
				pdto.setPlan_writer(rs.getInt("plan_writer"));
				pdto.setPlan_title(rs.getString("plan_title"));
				pdto.setPlan_good(rs.getInt("plan_good"));
				pdto.setPlan_viewcount(rs.getInt("plan_viewcount"));
				pdto.setPlan_startdate(rs.getString("plan_startdate"));
				pdto.setPlan_enddate(rs.getString("plan_enddate"));
				pdto.setPlan_check(rs.getString("plan_check"));
				result.add(pdto);
			}

		
		con.close();
		pstat.close();
		rs.close();
		return result;
	}
	
	public boolean getPlanState(int plan_seq) throws Exception {
		Connection con = DBConnection.getConnection();
		String sql = "select plan_check from plan where plan_seq = ?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setInt(1, plan_seq);
		ResultSet rs = pstat.executeQuery();
		boolean result = false;
		if(rs.next()) {
			if(rs.getString(1).equals("y")) {
				result = true;
			}
		}
		
		con.close();
		pstat.close();
		rs.close();
		return result;
	}
}
