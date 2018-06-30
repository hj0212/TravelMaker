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
					dst = "login.bo";
				}else {
					int writer = dto.getSeq();
					String title = request.getParameter("title");
					String contents = request.getParameter("contents");
			
					int result = fbdao.insertArticle(writer, title, contents);
					dst = "freeboard.bo";
				}
			} else if(command.equals("/viewArticle.bo")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
				
				if(dto == null) {
					isForward = false;
					dst = "login.bo";
				}else {
					FreeboardDTO boardDTO = fbdao.readFreeArticle(seq);
					int writerNumber = Integer.parseInt(boardDTO.getFree_writer());
					String nickname = mdao.getUserNickname(writerNumber);
					
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
	             rdao.getArticleViewCount(review_seq);
	             
	             ReviewDTO result1 = rdao.getReviewArticle(review_seq);
	             request.setAttribute("review_seq", review_seq);
	             request.setAttribute("review_title", result1.getReview_title());
	             request.setAttribute("review_contents", result1.getReview_contents());
	             request.setAttribute("review_writedate", result1.getReview_writedate());
	             request.setAttribute("review_writer", result1.getReview_writer());
	             request.setAttribute("review_writerN", result1.getReview_writerN());
	             request.setAttribute("review_viewcount", result1.getReview_viewcount());

	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	             request.setAttribute("user", dto.getSeq());
	             
	             System.out.println( result1.getReview_writer()+"*"+ dto.getSeq());
        
	             List<ReviewCommentDTO> result2 = rdao.getReviewComment(review_seq);	             
	             request.setAttribute("commentResult", result2);
	             
	             
	             isForward = true;            
	             dst = "reviewArticle.jsp";
	          }else if(command.equals("/addReviewComment.bo")) {
	             String comment_text = request.getParameter("comment_text");
	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             int user = dto.getSeq();
	             int result = rdao.insertReviewComment(comment_text,user,review_seq);
	             request.setAttribute("result", result);
	             request.setAttribute("review_seq", review_seq);

	             System.out.println("댓글 내용:"+comment_text+"유저 시퀀스: "+dto.getSeq()+"리뷰 시퀀스 :"+ review_seq);
	             
	  
	             isForward = true;
	             dst= "reviewCommentView.jsp";
	          }else if(command.equals("/deleteArticle.bo")) {
	        	  int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	        	  int result = rdao.deleteReview(review_seq);
	        	  
	        	  request.setAttribute("result", result);
	        	  request.setAttribute("review_seq", review_seq);
	        	  isForward = true;
	        	  dst="deleteReviewView.jsp";
	          }else if(command.equals("/deleteCheck.bo")) {
//	        	  int seq = Integer.parseInt(request.getParameter("articlenum"));
	        	  request.setAttribute("articlenum", request.getParameter("articlenum"));
	        	  dst = "freeboard/deleteCheck.jsp";
	          }else if(command.equals("/deleteArticle.bo")) {
	        	  int seq = Integer.parseInt(request.getParameter("seq"));
	        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        	  
	        	  if(user.getSeq() == fbdao.writerCheck(seq)) {
	        		  fbdao.deleteArticle(seq);
	        	  }
	        	  
	        	  isForward = false;
	          }
	        	  dst = "freeboard.bo";
			if(isForward) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect("error.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
