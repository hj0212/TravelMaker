package dto;

public class BudgetDTO {
	private int plan_seq;
	private int day_seq;
	private int budget_seq;
	private int schedule_seq;
	private String budget_plan;
	private int budget_amount;
	
	
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
	public int getBudget_seq() {
		return budget_seq;
	}
	public void setBudget_seq(int budget_seq) {
		this.budget_seq = budget_seq;
	}
	public int getSchedule_seq() {
		return schedule_seq;
	}
	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}
	public String getBudget_plan() {
		return budget_plan;
	}
	public void setBudget_plan(String budget_plan) {
		this.budget_plan = budget_plan;
	}
	public int getBudget_amount() {
		return budget_amount;
	}
	public void setBudget_amount(int budget_amount) {
		this.budget_amount = budget_amount;
	}
	
	
}
