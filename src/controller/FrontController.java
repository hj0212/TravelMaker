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
import dao.MemberDAO;
import dao.ReviewDAO;
import dto.FreeboardDTO;
import dto.MemberDTO;
import dto.ReviewCommentDTO;
import dto.ReviewDTO;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.bo")
public class FrontController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			MemberDAO mdao = new MemberDAO();
			FreeboardDAO fbdao = new FreeboardDAO();
			ReviewDAO rdao = new ReviewDAO();
		

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
				dst="freeboard/freeBoardList.jsp";

			} else if(command.equals("/freewrite.bo")) {
				isForward = true;
				dst = "freeboard/freeArticleWrite.jsp";
			} else if(command.equals("/writeArticlefree.bo")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
				
				if(dto == null) {
					isForward = false;
				}else {
					int writer = dto.getSeq();
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
			
					int result = fbdao.insertArticle(writer, title, contents);
				}
				
				dst = "freeboard.bo";
			} else if(command.equals("/viewArticle.bo")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
				
				if(dto == null) {
					System.out.println("아이디가 업습니다...");
					isForward = false;
					dst = "login.bo";
				}else {
					String nickname = mdao.getUserNickname(dto.getSeq());
					
					FreeboardDTO boardDTO = fbdao.readFreeArticle(seq);
					
					request.setAttribute("article", boardDTO);
					request.setAttribute("writer", nickname);
					dst = "freeboard/freeArticleView.jsp";
				}
			} else if(command.equals("/login.bo")) {
				dst = "freeboard/needLogin.jsp";
			} else if(command.equals("/reviewboard.bo")) {
	            int currentPage = 0;
	            String currentPageString = request.getParameter("currentPage");
	            
	            if(currentPageString == null) {
	               currentPage = 1;
	            } else {
	               currentPage = Integer.parseInt(currentPageString);
	            }
	            
	            String searchTerm = request.getParameter("search");
	            List<ReviewDTO> reviewList = new ArrayList<>();
	            reviewList = rdao.getSomeReview(currentPage*12-11, currentPage*12, searchTerm);
	            request.setAttribute("reviewList", reviewList);
	         
	            String pageNavi = rdao.getPageNavi(currentPage, searchTerm);
	            request.setAttribute("pageNavi", pageNavi);
	            
	            isForward = true;
	            dst="share_review.jsp";
	         }else if(command.equals("/reviewArticle.bo")) {
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             
	             ReviewDTO result1 = rdao.getReviewArticle(review_seq);
	             request.setAttribute("review_seq", review_seq);
	             request.setAttribute("review_title", result1.getReview_title());
	             request.setAttribute("review_contents", result1.getReview_contents());
	             request.setAttribute("review_writedate", result1.getReview_writedate());
	             request.setAttribute("review_writer", result1.getReview_writer());
	             request.setAttribute("review_viewcount", result1.getReview_viewcount());
	             
	             
	             List<ReviewCommentDTO> result2 = rdao.getReviewComment(review_seq);
	             for(ReviewCommentDTO tmp: result2) {
	             request.setAttribute("comment_writer", tmp.getComment_writer());
	             request.setAttribute("comment_text", tmp.getComment_text());
	             request.setAttribute("comment_time", tmp.getComment_time());
	             }
	             
	             isForward = true;            
	             dst = "reviewArticle.jsp";
	          }else if(command.equals("/addReviewComment.bo")) {
	             String comment_text = request.getParameter("comment_text");
	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             int result = rdao.insertReviewComment(comment_text, dto.getSeq(), review_seq);
	             request.setAttribute("result", result);
	             request.setAttribute("review_seq", review_seq);
	             

	             isForward = true;
	             dst= "reviewCommentView.bo";
	          }

			if(isForward) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
			}
		}catch(Exception e) {e.printStackTrace();}		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
