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

import dao.FreeCommentDAO;
import dao.FreeboardDAO;
import dao.GoodBadDAO;
import dao.MemberDAO;
import dao.ReviewDAO;
import dto.FreeCommentDTO;
import dto.FreeboardDTO;
import dto.GoodAllDTO;
import dto.MemberDTO;
import dto.PlanDTO;
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
			FreeCommentDAO fcdao = new FreeCommentDAO();
			GoodBadDAO gbdao = new GoodBadDAO();
			
			boolean isForward = true;
			String dst = null;
			
			if(command.equals("/freeboard.bo")) {
				try {
					int currentPage = 0;
					String currentPageString = request.getParameter("currentPage");
					
					if(currentPageString == null) {
						currentPage = 1;
					} else {
						currentPage = Integer.parseInt(currentPageString);
					}
					
					String searchTerm = request.getParameter("search");
					
					ArrayList<FreeboardDTO> list = fbdao.selectBoard(currentPage*10-9, currentPage*10, searchTerm);
					
//					String[] nickname = new String[list.size()];
//					for(int i = 0; i < list.size(); i++) {
//						int writerNumber = Integer.parseInt(list.get(i).getFree_writer());
//						String writer = mdao.getUserNickname(writerNumber);
//						nickname[i] = writer;
//					}
//					
//					request.setAttribute("writer", nickname);
					request.setAttribute("freeboardlist", list);
					
					//------------------------------------------------------
								
					String pageNavi = fbdao.getPageNavi(currentPage, searchTerm);
					request.setAttribute("pageNavi", pageNavi);
					request.setAttribute("currentPage", currentPage);
					
					isForward = true;
					dst="freeboard/freeBoardList.jsp?currentPage="+currentPage;
				}catch(NumberFormatException e) {
					dst = "numberError.bo";
				}
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
			
					if((title == null || title == "") && (contents == null || contents == "")) {
						title = "제목없음";
					}else if(contents == null || contents == "" ) {
						contents = "내용없음";
					}else if(title == null || title == "") {
						title = "제목없음";
						contents = "내용없음";
					}
					
					int result = fbdao.insertArticle(writer, title, contents);
					dst = "freeboard.bo";
				}
			} else if(command.equals("/viewFreeArticle.bo")) {
				try {
					int seq = Integer.parseInt(request.getParameter("seq"));
					String currentPage = request.getParameter("currentPage");
					MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
					
					if(dto == null) {
						isForward = false;
						dst = "login.bo";
					}else {
						int result = fcdao.addViewCount(seq);
						FreeboardDTO boardDTO = fbdao.readFreeArticle(seq);
						int writerNumber = Integer.parseInt(boardDTO.getFree_writer());
						String nickname = mdao.getUserNickname(writerNumber);
						
						List<FreeCommentDTO> cdto = fcdao.viewCommentList(seq);
						
//						for(FreeCommentDTO tmp : cdto) {
//							System.out.println(tmp.getFree_seq());
//							System.out.println(tmp.getComment_seq());
//							System.out.println(tmp.getComment_text());
//							System.out.println(tmp.getComment_writer());
//							System.out.println(tmp.getComment_time());
//						}
						
						request.setAttribute("commentList", cdto);
						request.setAttribute("currentPage", currentPage);
						request.setAttribute("article", boardDTO);
						request.setAttribute("writer", nickname);
						
						dst = "freeboard/freeArticleView.jsp";
					}
				}catch(NumberFormatException e) {
					dst = "numberError.bo";
					isForward = false;
					e.printStackTrace();
				}
			} else if(command.equals("/login.bo")) {
				dst = "freeboard/needLogin.jsp";
				
				//---------후기 공유 게시판 보기
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
	            reviewList = rdao.getSomeReview(currentPage*10-9, currentPage*10, searchTerm);
	            request.setAttribute("reviewList", reviewList);
	         
	            String pageNavi = rdao.getPageNavi(currentPage, searchTerm);
	            request.setAttribute("pageNavi", pageNavi);
	            request.setAttribute("currentPage", currentPage);
	            
	            isForward = true;
	            dst="share_review.jsp?currentPage"+currentPage;
	            
	         }else if(command.equals("/reviewArticle.bo")) {
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             rdao.getArticleViewCount(review_seq);
//	             int listcurrentPage =Integer.parseInt(request.getParameter("listcurrentPage"));
	             int review = rdao.reViewCount(review_seq);
	             ReviewDTO result1 = rdao.getReviewArticle(review_seq);
	             request.setAttribute("review_seq", review_seq);
	             request.setAttribute("review_title", result1.getReview_title());
	             request.setAttribute("review_contents", result1.getReview_contents());
	             request.setAttribute("review_writedate", result1.getReview_writedate());
	             request.setAttribute("review_writer", result1.getReview_writer());
	             request.setAttribute("review_writerN", result1.getReview_writerN());
	             request.setAttribute("review_viewcount", result1.getReview_viewcount());

	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
		            int bad = gbdao.reviewBadSelectData(review_seq);
		            int good =gbdao.reviewGoodSelectData(review_seq);
		            request.setAttribute("good", good);
		            request.setAttribute("bad", bad);	            
        
	             List<ReviewCommentDTO> result2 = rdao.getReviewComment(review_seq);	             
	             request.setAttribute("commentResult", result2);
	             /*request.setAttribute("currentPage", currentPage);*/
	             
	             isForward = true;            
	             /*dst = "reviewArticle.jsp?currentPage"+currentPage;*/
	             dst="reviewArticle.jsp";
	          }else if(command.equals("/addReviewComment.bo")) {
	             String comment_text = request.getParameter("comment_text");
	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             int user = dto.getSeq();
	             int result = rdao.insertReviewComment(comment_text,user,review_seq);
	             request.setAttribute("result", result);
	             request.setAttribute("review_seq", review_seq);
	  
	             isForward = true;
	             dst= "reviewCommentView.jsp";
	          }else if(command.equals("/deleteReviewArticle.bo")) {
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
	          }else if(command.equals("/deleteFreeArticle.bo")) {
	        	  try {
		        	  int seq = Integer.parseInt(request.getParameter("seq"));
		        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
		        	  
		        	  if(user.getSeq() == fbdao.writerCheck(seq)) {
		        		  fbdao.deleteArticle(seq);
		        		  dst = "freeboard.bo";
		        	  }else {
		        		  dst = "notWriter.bo";
		        		  isForward = false;
		        	  }
	        	  }catch(NumberFormatException e) {
	        		  dst = "numberError.bo";
	        		  e.printStackTrace();
	        	  }
	          }else if(command.equals("/modifyFreeArticlePage.bo")) {
	        	  try {
	        		  int articlenum = Integer.parseInt(request.getParameter("articlenum"));
	        		  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        		  request.setAttribute("articlenum", articlenum);
	        		  
	        		  if(user.getSeq() == fbdao.writerCheck(articlenum)) {
	        			  FreeboardDTO dto = fbdao.readFreeArticle(articlenum);
	        			  request.setAttribute("contents", dto);
	        			  request.setAttribute("articlenum", articlenum);
	        			  dst = "freeboard/modifyFreeArticle.jsp";
	        		  }else {
	        			  dst = "notWriter.bo";
	        			  isForward = false;
	        		  }
	        	  }catch(NumberFormatException e) {
	        		  dst =  "numberError.bo";
	        	  }
	          }else if(command.equals("/numberError.bo")) {
	        	  dst = "notNumber.jsp";
	        	  isForward = false;
	          }else if(command.equals("/notWriter.bo")) {
	        	  dst = "notWriter.jsp";
	        	  isForward = false;
	          }else if(command.equals("/modifyFreeArticle.bo")) {
	        	  try {
		        	  String title = request.getParameter("title");
		        	  String contents = request.getParameter("contents");
		        	  
		        	  if((title == null || title == "") && (contents == null || contents == "")) {
		        		  title = "제목없음";
		        	  }else if(contents == null || contents == "" ) {
		        		  contents = "내용없음";
		        	  }else if(title == null || title == "") {
		        		  title = "제목없음";
		        		  contents = "내용없음";
		        	  }
		        	  
		        	  int articlenum = Integer.parseInt(request.getParameter("articlenum"));
		        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
		        	  
		        	  if(user.getSeq() == fbdao.writerCheck(articlenum)) {
		        		  int result = fbdao.updateArticle(title, contents,articlenum);
		        		  dst = "freeboard.bo";
		        	  }else {
		        		  dst = "notWriter.bo";
		        	  }
		        	  
		        	  isForward = false;
	        	  }catch(NumberFormatException e) {
	        		  e.printStackTrace();
	        		  dst = "numberError.bo";
	        		  isForward = false;
	        	  }
	          }else if(command.equals("/procFreeComment.bo")) {
	        	  int aritcleseq = Integer.parseInt(request.getParameter("articlenum"));
	        	  String comment = request.getParameter("comment");
	        	  MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	        	  int writer = dto.getSeq();
	        	  
	        	  int result = fcdao.insertComment(aritcleseq,comment,writer);
	        	  System.out.println(aritcleseq + " : " + comment + " : " + writer);
	        	  dst = "viewFreeArticle.bo?seq="+aritcleseq;
	          }else if(command.equals("/deleteFreeComment.bo")) {
	        	  try {
		        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
		        	  
		        	  int articleseq = Integer.parseInt(request.getParameter("articleseq"));
		        	  int commentseq = Integer.parseInt(request.getParameter("commentseq"));
		        	  
		        	  if(user.getSeq() == Integer.parseInt(request.getParameter("commentwriter"))) {
		        		  int result = fcdao.deleteComment(articleseq, commentseq);
		        	  }
		        	  
		        	  isForward = false;
		        	  dst = "viewFreeArticle.bo?seq="+articleseq;
	        	  }catch(NumberFormatException e) {
	        		  dst = "numberError.bo";
	        		  isForward = false;
	        	  }
	          }else if(command.equals("/deleteReviewComment.bo")) {
	        	  int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
	        	  int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        	  int comment_writer_seq = user.getSeq();
	        	  System.out.println(comment_seq +":"+review_seq+":"+comment_writer_seq);
	        	  int result = rdao.deleteReviewComment(comment_seq, comment_writer_seq);
	        	  request.setAttribute("result", result);
	        	  request.setAttribute("review_seq", review_seq);
	        	  System.out.println(result +":"+review_seq);
	        	  isForward=true;
	        	  dst="deleteReviewCommentView.jsp";
	          }else if(command.equals("/main.bo")) {
	        	List<PlanDTO> main = gbdao.bestPlanData();
	        
	        	request.setAttribute("main", main);
	        	
	        	isForward=true;
	        	dst="main.jsp";
	          }
	        	  
			if(isForward) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
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
