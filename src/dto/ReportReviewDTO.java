package dto;

public class ReportReviewDTO {

	private int report_seq;
	private String report_user;
	private String report_date;
	private int review_seq;
	
	private String review_title;
	private String review_writer;
	private String review_link;
	
	private int report_count;
	private String review_writedate;
	private int review_viewcount;
	
	public ReportReviewDTO() {}

	public ReportReviewDTO(int report_seq, String report_user, String report_date, int review_seq, String review_title,
			String review_writer, String review_link, int report_count, String review_writedate, int review_viewcount) {
		super();
		this.report_seq = report_seq;
		this.report_user = report_user;
		this.report_date = report_date;
		this.review_seq = review_seq;
		this.review_title = review_title;
		this.review_writer = review_writer;
		this.review_link = review_link;
		this.report_count = report_count;
		this.review_writedate = review_writedate;
		this.review_viewcount = review_viewcount;
	}


	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public String getReport_user() {
		return report_user;
	}

	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public String getReview_link() {
		return review_link;
	}

	public void setReview_link(String review_link) {
		this.review_link = review_link;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getReview_writedate() {
		return review_writedate;
	}

	public void setReview_writedate(String review_writedate) {
		this.review_writedate = review_writedate;
	}

	public int getReview_viewcount() {
		return review_viewcount;
	}

	public void setReview_viewcount(int review_viewcount) {
		this.review_viewcount = review_viewcount;
	}
	

	
}
