package dto;


public class FreeCommentDTO {
	private int free_seq;
	private int comment_seq;
	private String comment_text;
	private int comment_writer;
	private String comment_time;
	
	public FreeCommentDTO(int free_seq, int comment_seq, String comment_text, int comment_writer, String comment_time) {
		super();
		this.free_seq = free_seq;
		this.comment_seq = comment_seq;
		this.comment_text = comment_text;
		this.comment_writer = comment_writer;
		this.comment_time = comment_time;
	}
	
	public FreeCommentDTO() {
		super();
	}

	public int getFree_seq() {
		return free_seq;
	}

	public void setFree_seq(int free_seq) {
		this.free_seq = free_seq;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public int getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(int comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
}
