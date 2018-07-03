package dto;

public class ScheduleDTO {
	private int plan_seq;
	private int day_seq;
	private int schedule_seq;
	private String schedule_starttime;
	private String schedule_endtime;
	private int location_id;
	private String location_name;
	private int location_x;
	private int location_y;
	private String schedule_place;
	private String schedule_plan;
	private String schedule_budget;
	private String schedule_ref;
	
	
	public int getLocation_x() {
		return location_x;
	}
	public void setLocation_x(int location_x) {
		this.location_x = location_x;
	}
	public int getLocation_y() {
		return location_y;
	}
	public void setLocation_y(int location_y) {
		this.location_y = location_y;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public int getSchedule_seq() {
		return schedule_seq;
	}
	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}
	public String getSchedule_starttime() {
		return schedule_starttime;
	}
	public void setSchedule_starttime(String schedule_starttime) {
		this.schedule_starttime = schedule_starttime;
	}
	public String getSchedule_endtime() {
		return schedule_endtime;
	}
	public void setSchedule_endtime(String schedule_endtime) {
		this.schedule_endtime = schedule_endtime;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getSchedule_plan() {
		return schedule_plan;
	}
	public void setSchedule_plan(String schedule_plan) {
		this.schedule_plan = schedule_plan;
	}
	public String getSchedule_budget() {
		return schedule_budget;
	}
	public void setSchedule_budget(String schedule_budget) {
		this.schedule_budget = schedule_budget;
	}
	public String getSchedule_ref() {
		return schedule_ref;
	}
	public void setSchedule_ref(String schedule_ref) {
		this.schedule_ref = schedule_ref;
	}
	public int getPlan_seq() {
		return plan_seq;
	}
	public void setPlan_seq(int plan_seq) {
		this.plan_seq = plan_seq;
	}
	public int getDay_seq() {
		return day_seq;
	}
	public void setDay_seq(int day_seq) {
		this.day_seq = day_seq;
	}
	public String getSchedule_place() {
		return schedule_place;
	}
	public void setSchedule_place(String schedule_place) {
		this.schedule_place = schedule_place;
	}
	
}
