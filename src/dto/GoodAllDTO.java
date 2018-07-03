package dto;

public class GoodAllDTO {
	private int count;
	private int article_no;
	public GoodAllDTO(int count, int article_no) {
		super();
		this.count = count;
		this.article_no = article_no;
	}
	public GoodAllDTO() {
		
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	
}
