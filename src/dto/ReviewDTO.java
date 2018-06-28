package dto;

public class ReviewDTO {

	private int review_seq;
	private String review_title;
	private String review_contents;
	private String review_writer;
	private String review_writedate;
	private int review_viewcount;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int review_seq, String review_title, String review_contents, String review_writer,
			String review_writedate, int review_viewcount) {
		super();
		this.review_seq = review_seq;
		this.review_title = review_title;
		this.review_contents = review_contents;
		this.review_writer = review_writer;
		this.review_writedate = review_writedate;
		this.review_viewcount = review_viewcount;
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

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
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
