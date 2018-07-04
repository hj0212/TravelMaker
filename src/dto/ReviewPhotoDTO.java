package dto;

public class ReviewPhotoDTO {
	private int review_photo_seq;
	private int article_no;
	private String original_file_name;
	private String system_file_name;
	
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
}
