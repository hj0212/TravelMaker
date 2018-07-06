package dto;

import java.sql.Date;

public class ReviewReportDTO {
	private int report_seq;
	private int report_user;
	private Date report_date;
	private int review_seq;
	
	public ReviewReportDTO(int report_seq, int report_user, Date report_date, int review_seq) {
		this.report_seq = report_seq;
		this.report_user = report_user;
		this.report_date = report_date;
		this.review_seq = review_seq;
	}

	public ReviewReportDTO() {
		super();
	}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
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

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
}
