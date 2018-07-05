package dto;

import java.sql.Date;

public class FreeReportDTO {
	private int reportfree_seq;
	private int free_seq;
	private int report_user;
	private Date report_date;
	
	public FreeReportDTO(int reportfree_seq, int free_seq, int report_user, Date report_date) {
		super();
		this.reportfree_seq = reportfree_seq;
		this.free_seq = free_seq;
		this.report_user = report_user;
		this.report_date = report_date;
	}

	public FreeReportDTO() {
		super();
	}

	public int getReportfree_seq() {
		return reportfree_seq;
	}
	
	public void setReportfree_seq(int reportfree_seq) {
		this.reportfree_seq = reportfree_seq;
	}
	
	public int getFree_seq() {
		return free_seq;
	}
	
	public void setFree_seq(int free_seq) {
		this.free_seq = free_seq;
	}
	
	public int getReport_user() {
		return report_user;
	}
	
	public void setReport_user(int report_user) {
		this.report_user = report_user;
	}
	
	public Date getReport_date() {
		return report_date;
	}
	
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
}
