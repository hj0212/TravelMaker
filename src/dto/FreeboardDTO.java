package dto;

public class FreeboardDTO {
	private int free_seq;
	private String free_title;
	private String free_contents;
	private String free_writer;
	private String free_writedate;
	private int free_viewcount;
	
	public FreeboardDTO() {
		super();
	}
	
	public int getFree_seq() {
		return free_seq;
	}
	
	public void setFree_seq(int free_seq) {
		this.free_seq = free_seq;
	}
	
	public String getFree_title() {
		return free_title;
	}
	
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	
	public String getFree_contents() {
		return free_contents;
	}
	
	public void setFree_contents(String free_contents) {
		this.free_contents = free_contents;
	}
	
	public String getFree_writer() {
		return free_writer;
	}
	
	public void setFree_writer(String free_writer) {
		this.free_writer = free_writer;
	}
	
	public String getFree_writedate() {
		return free_writedate;
	}
	
	public void setFree_writedate(String free_writedate) {
		this.free_writedate = free_writedate;
	}
	
	public int getFree_viewcount() {
		return free_viewcount;
	}
	
	public void setFree_viewcount(int free_viewcount) {
		this.free_viewcount = free_viewcount;
	}
}
