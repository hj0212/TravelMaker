package dto;

public class ReportFreeDTO {
	
	private int reportfree_seq;
	private int free_seq;
	private String free_writer;
	private String report_user;
	
	public ReportFreeDTO(){}
	
	public ReportFreeDTO(int reportfree_seq, int free_seq, String free_writer, String report_user) {
		super();
		this.reportfree_seq = reportfree_seq;
		this.free_seq = free_seq;
		this.free_writer = free_writer;
		this.report_user = report_user;
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
	public String getFree_writer() {
		return free_writer;
	}
	public void setFree_writer(String free_writer) {
		this.free_writer = free_writer;
	}
	public String getReport_user() {
		return report_user;
	}
	public void setReport_user(String report_user) {
		this.report_user = report_user;
	}

	
}
