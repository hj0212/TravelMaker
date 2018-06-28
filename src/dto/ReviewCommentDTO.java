package dto;

public class ReviewCommentDTO {

	private int review_seq;
	private int comment_seq;
	private String comment_text;
	private int comment_writer_seq;
	private String comment_writer;
	private String comment_time;
	
	public ReviewCommentDTO() {
		super();
	}

	public ReviewCommentDTO(int review_seq, int comment_seq, String comment_text, int comment_writer_seq, String comment_writer,
			String comment_time) {
		super();
		this.review_seq = review_seq;
		this.comment_seq = comment_seq;
		this.comment_text = comment_text;
		this.comment_writer_seq = comment_writer_seq;
		this.comment_writer = comment_writer;
		this.comment_time = comment_time;
	}

	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
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
	
	

	public int getComment_writer_seq() {
		return comment_writer_seq;
	}

	public void setComment_writer_seq(int comment_writer_seq) {
		this.comment_writer_seq = comment_writer_seq;
	}

	public String getComment_writer() {
		return comment_writer;
	}

	public void setComment_writer(String comment_writer) {
		this.comment_writer = comment_writer;
	}

	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}
	
	
}
