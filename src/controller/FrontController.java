package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FreeboardDAO;
import dao.ReviewDAO;
import dto.FreeboardDTO;
import dto.ReviewCommentDTO;
import dto.ReviewDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.bo")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			ReviewDAO rdao = new ReviewDAO();
			//MemberDAO mdao = new MemberDAO();
			FreeboardDAO fbdao = new FreeboardDAO();

			boolean isForward = true;
			String dst = null;

			if(command.equals("/freeboard.bo")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				
				if(currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}
				
				String searchTerm = request.getParameter("search");
				
				ArrayList<FreeboardDTO> list = fbdao.selectBoard(currentPage*10-9, currentPage*10, searchTerm);
				request.setAttribute("freeboardlist", list);
				
				//------------------------------------------------------
				
			
				String pageNavi = fbdao.getPageNavi(currentPage, searchTerm);
				request.setAttribute("pageNavi", pageNavi);
				
				isForward = true;
				dst="freeboard.jsp";

//--------------------------------------------------------�ı� ���� �Խ��� ����
			} else if(command.equals("/reviewboard.bo")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				
				if(currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}
				
				String searchTerm = request.getParameter("search");
				ArrayList<ReviewDTO> list = fbdao.selectBoard(currentPage*10-9, currentPage*10, searchTerm);
				request.setAttribute("reviewList", list);
			
				String pageNavi = fbdao.getPageNavi(currentPage, searchTerm);
				request.setAttribute("pageNavi", pageNavi);
								
				isForward = true;
				dst="share_review.jsp";
			}

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			if(command.equals("/reviewArticel.bo")) {
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				
				ReviewDTO result1 = rdao.getReviewArticle(review_seq);
				request.setAttribute("result1", result1);
				
				List<ReviewCommentDTO> result2 = rdao.getReviewComment(review_seq);
				request.setAttribute("result2", result2);
				
				isForward = true;
				dst = "reviewArticle.bo?reveiw_seq="+ review_seq;
			}if(command.equals("/addReviewComment.bo")) {
				String comment_text = request.getParameter("comment_text");
				int comment_writer_seq = Integer.parseInt(request.getParameter("comment_writer_seq"));
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				int result3 = rdao.insertReviewComment(comment_text, comment_writer_seq, review_seq);
				request.setAttribute("result3", result3);
				
				List<ReviewCommentDTO> result4 = rdao.getReviewComment(review_seq);
				request.setAttribute("result4", result4);

				isForward = true;
				dst= "reviewArticle.bo?reveiw_seq="+ review_seq;
			}
			
			if(isForward) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect("error.jsp");
			}
		}catch(Exception e) {e.printStackTrace();}		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
