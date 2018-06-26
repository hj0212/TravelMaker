package article.boardlist;

import java.util.List;

import dao.FreeboardDAO;
import dto.FreeboardDTO;

public class ListArticleService {
	private FreeboardDAO fbdao = new FreeboardDAO();
	private int size = 15;
	
	public ArticlePage getArticlePage(int pageNum) throws Exception {
		int total = fbdao.selectCount();
		List<FreeboardDTO> content = fbdao.select((pageNum-1) * size + 1, (pageNum-1) * size + size);
		return new ArticlePage(total,pageNum,size,content);
	}
}
