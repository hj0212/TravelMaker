package dto;

public class ReviewPhotoMainDTO {
	private int rownum;
	private int review_photo_seq;
	private int article_no;
	private String original_file_name;
	private String system_file_name;
	private String review_title;
	private String review_writer;
	private String review_writedate;
	
	
	public ReviewPhotoMainDTO() {}
	public ReviewPhotoMainDTO(int rownum, int review_photo_seq, int article_no, String original_file_name,
			String system_file_name, String review_title, String review_writer, String review_writedate) {
		super();
		this.rownum = rownum;
		this.review_photo_seq = review_photo_seq;
		this.article_no = article_no;
		this.original_file_name = original_file_name;
		this.system_file_name = system_file_name;
		this.review_title = review_title;
		this.review_writer = review_writer;
		this.review_writedate = review_writedate;
	}

	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getReview_photo_seq() {
		return review_photo_seq;
	}


	public void setReview_photo_seq(int review_photo_seq) {
		this.review_photo_seq = review_photo_seq;
	}


	public int getArticle_no() {
		return article_no;
	}


	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}


	public String getOriginal_file_name() {
		return original_file_name;
	}


	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}


	public String getSystem_file_name() {
		return system_file_name;
	}


	public void setSystem_file_name(String system_file_name) {
		this.system_file_name = system_file_name;
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


	public String getReview_writedate() {
		return review_writedate;
	}


	public void setReview_writedate(String review_writedate) {
		this.review_writedate = review_writedate;
	}
	
	
	
	
}
