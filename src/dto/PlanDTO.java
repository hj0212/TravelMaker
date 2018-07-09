package dto;

/**
 * @author Kwon
 *
 */
public class PlanDTO {
	private int plan_seq;
	private int plan_writer;
	private String plan_writerN;
	private String plan_startdate;
	private String plan_enddate;
	private String plan_title;
	private int plan_good;
	private int plan_bad;
	private int plan_viewcount;
	private int plan_reportcount;
	private String plan_check;
	private String file_name;
	private String part;

	public PlanDTO() {	}
	public PlanDTO(int plan_seq, int plan_writer, String plan_writerN, String plan_startdate, String plan_enddate,
			String plan_title, int plan_good, int plan_bad, int plan_viewcount, int plan_reportcount, String plan_check) {
		super();
		this.plan_seq = plan_seq;
		this.plan_writer = plan_writer;
		this.plan_writerN = plan_writerN;
		this.plan_startdate = plan_startdate;
		this.plan_enddate = plan_enddate;
		this.plan_title = plan_title;
		this.plan_good = plan_good;
		this.plan_bad = plan_bad;
		this.plan_viewcount = plan_viewcount;
		this.plan_reportcount = plan_reportcount;
		this.plan_check = plan_check;
	}


	
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getPlan_seq() {
		return plan_seq;
	}
	public void setPlan_seq(int plan_seq) {
		this.plan_seq = plan_seq;
	}

	public int getPlan_writer() {
		return plan_writer;
	}

	public void setPlan_writer(int plan_writer) {
		this.plan_writer = plan_writer;
	}

	public String getPlan_writerN() {
		return plan_writerN;
	}

	public void setPlan_writerN(String plan_writerN) {
		this.plan_writerN = plan_writerN;
	}

	public String getPlan_startdate() {
		return plan_startdate;
	}
	public void setPlan_startdate(String plan_startdate) {
		this.plan_startdate = plan_startdate;
	}
	public String getPlan_enddate() {
		return plan_enddate;
	}
	public void setPlan_enddate(String plan_enddate) {
		this.plan_enddate = plan_enddate;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public int getPlan_good() {
		return plan_good;
	}
	public void setPlan_good(int plan_good) {
		this.plan_good = plan_good;
	}
	public int getPlan_bad() {
		return plan_bad;
	}
	public void setPlan_bad(int plan_bad) {
		this.plan_bad = plan_bad;
	}
	public int getPlan_viewcount() {
		return plan_viewcount;
	}
	public void setPlan_viewcount(int plan_viewcount) {
		this.plan_viewcount = plan_viewcount;
	}
	public int getPlan_reportcount() {
		return plan_reportcount;
	}
	public void setPlan_reportcount(int plan_reportcount) {
		this.plan_reportcount = plan_reportcount;
	}
	public String getPlan_check() {
		return plan_check;
	}
	public void setPlan_check(String plan_check) {
		this.plan_check = plan_check;
	}

	

}
