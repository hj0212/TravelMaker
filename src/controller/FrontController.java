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

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import dao.FreeCommentDAO;
import dao.FreeboardDAO;
import dao.GoodBadDAO;
import dao.MemberDAO;
import dao.ReviewDAO;
import dao.ReviewPhotoDAO;
import dto.FreeCommentDTO;
import dto.FreeboardDTO;
//import dto.GoodAllDTO;
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
			ReviewPhotoDAO rpdao = new ReviewPhotoDAO();

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
					
					dst="freeboard/freeBoardList.jsp?currentPage="+currentPage;
				}catch(NumberFormatException e) {
					isForward = false;
					dst = "freeNumberError.bo";
				}catch(Exception e1) {
					isForward = false;
					dst = "freeboardError.bo";
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
						int result = fbdao.addViewCount(seq);
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
						  int bad = gbdao.freeBadSelectData(seq);
					      int good =gbdao.freeGoodSelectData(seq);
					      request.setAttribute("good", good);
					      request.setAttribute("bad", bad);	      
						
						
						request.setAttribute("seq", seq);
						request.setAttribute("commentList", cdto);
						request.setAttribute("currentPage", currentPage);
						request.setAttribute("article", boardDTO);
						request.setAttribute("writer", nickname);
						
						dst = "freeboard/freeArticleView.jsp";
					}
				}catch(NumberFormatException e) {
					dst = "freeNumberError.bo";
					isForward = false;
					e.printStackTrace();
				}catch(Exception e1) {
					isForward = false;
					dst = "freeboardError.bo";
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
	            dst="reviewboard/share_review.jsp?currentPage"+currentPage;
	            
	         }else if(command.equals("/reviewArticle.bo")) {
	        	 try {
		             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
		             rdao.reViewCount(review_seq);
		             
		             ReviewDTO result1 = rdao.getReviewArticle(review_seq);
		             request.setAttribute("dto", result1);
		             request.setAttribute("review_seq", review_seq);
	
		             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
			         int bad = gbdao.reviewBadSelectData(review_seq);
			         int good =gbdao.reviewGoodSelectData(review_seq);
			         request.setAttribute("good", good);
			         request.setAttribute("bad", bad);	            
	        
		             List<ReviewCommentDTO> result2 = rdao.getReviewComment(review_seq);	             
		             request.setAttribute("commentResult", result2);
		             
		             isForward = true;            
		             dst="reviewboard/reviewArticle.jsp";
	        	 }catch(NumberFormatException e) {
	        		 isForward = false;
	        		 dst = "numberError.bo";
	        	 }
	          }else if(command.equals("/addReviewComment.bo")) {
	             String comment_text = request.getParameter("comment_text");
	             MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
	             int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	             int user = dto.getSeq();
	             
	             int result = rdao.insertReviewComment(comment_text,user,review_seq);
	             request.setAttribute("result", result);
	             request.setAttribute("review_seq", review_seq);
	  
	             isForward = true;
	             dst= "reviewboard/reviewCommentView.jsp";
	          }else if(command.equals("/deleteFreeCheck.bo")) {
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
		        		  dst = "freenotWriter.bo";
		        		  isForward = false;
		        	  }
	        	  }catch(NumberFormatException e) {
	        		  isForward = false;
	        		  dst = "freeNumberError.bo";
	        		  e.printStackTrace();
	        	  }catch(Exception e1) {
	        		  isForward = false;
	        		  dst = "freeboardError.bo";
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
	        			  dst = "freenotWriter.bo";
	        			  isForward = false;
	        		  }
	        	  }catch(NumberFormatException e) {
	        		  dst =  "freeNumberError.bo";
	        		  isForward = false;
	        	  }catch(Exception e1) {
	        		  dst = "freeboardError.bo";
	        		  isForward = false;
	        	  }
	          }else if(command.equals("/freeNumberError.bo")) {
	        	  dst = "notNumber.jsp";
	          }else if(command.equals("/freenotWriter.bo")) {
	        	  dst = "notWriter.jsp";
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
		        		  dst = "viewFreeArticle.bo?seq="+articlenum;
		        	  }else {
		        		  dst = "freenotWriter.bo";
		        	  }
		        	  
		        	  isForward = false;
	        	  }catch(NumberFormatException e) {
	        		  e.printStackTrace();
	        		  dst = "freeNumberError.bo";
	        		  isForward = false;
	        	  }catch(Exception e1) {
	        		  isForward = false;
	        		  dst = "freeboardError.bo";
	        	  }
	          }else if(command.equals("/procFreeComment.bo")) {
		        	  int aritcleseq = Integer.parseInt(request.getParameter("articlenum"));
		        	  String comment = request.getParameter("comment");
		        	  MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
		        	  int writer = dto.getSeq();
		        	  
		        	  int result = fcdao.insertComment(aritcleseq,comment,writer);
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
	        		  dst = "freeNumberError.bo";
	        		  isForward = false;
	        	  }catch(Exception e1) {
	        		  dst = "freeboardError.bo";
	        		  isForward = false;
	        	  }
	          }else if(command.equals("/deleteReviewComment.bo")) {
	        	  int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
	        	  int review_seq = Integer.parseInt(request.getParameter("review_seq"));
	        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        	  
	        	  int comment_writer_seq = user.getSeq();
	        	  
	        	  int result = rdao.deleteReviewComment(comment_seq, comment_writer_seq);
	        	  request.setAttribute("result", result);
	        	  request.setAttribute("review_seq", review_seq);
	        	  
	        	  isForward=true;
	        	  dst="deleteReviewCommentView.jsp";
	          }else if(command.equals("/writeReview.bo")) {
	        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        	  
	        	  if(user == null) {
	        		  dst = "reviewboard.bo";
	        		  isForward = false;
	        	  }else {
	        		  dst = "reviewboard/writeReviewArticle.jsp";
	        	  }
	          }else if(command.equals("/writeReviewArticle.bo")) {
	        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
	        	  String title = request.getParameter("title");
	        	  String contents = request.getParameter("contents");
	        	  String list = request.getParameter("imageList");
	        	  String[] imageList = null;
	        	  
	        	  if(user == null) {
	        		  isForward = false;
	        	  }else {
	        		  if(contents.length() > 65535) {
	        			  isForward = false;
	        		  }else {
		  				if((title == null || title == "") && (contents == null || contents == "")) {
							title = "제목없음";
						}else if(contents == null || contents == "" ) {
							contents = "내용없음";
						}else if(title == null || title == "") {
							title = "제목없음";
							contents = "내용없음";
						}
		  				
		  				JSONArray array = (JSONArray)new JSONParser().parse(list);
		  				
		  				imageList = new String[array.size()];
		  				
		  				for(int i = 0; i < array.size(); i++) {
		  					imageList[i] = (String)array.get(i);
		  				}
		  				
		  				int result = rdao.insertReview(title, contents, user.getSeq(), imageList);
	        		  }
	        	  }
	        	  dst = "reviewboard.bo";
	          }else if(command.equals("/main.bo")) {
	        	List<PlanDTO> main = gbdao.bestPlanData();
	        	
	        	if(request.getSession().getAttribute("user") != null) {
	        		//파일경로인데 권혜진씨 부탁드립니다
		        	MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
		        	String part = (String)request.getSession().getAttribute("part");
								
					MemberDTO mdto = mdao.newMemberInfo(user.getSeq(), part);
					
					/*mdto = mdao.getProfileInfo(part, id);*/
					
					/*String file_name = ((MemberDTO)request.getSession().getAttribute("user")).getPhoto_system_file_name();*/
					 request.setAttribute("file_name", mdto.getPhoto_system_file_name());
		        	
		        	
	        	}
	        	request.setAttribute("main", main);
	        	
	        	isForward=true;
	        	dst="main.jsp";
	          }else if(command.equals("/freeboardError.bo")) {
	        	  isForward = false;
	        	  dst = "freeboard.bo";
	          }else if(command.equals("/deleteReviewCheck.bo")) {
	        	  request.setAttribute("articlenum", request.getParameter("reviewnum"));
	        	  dst = "reviewboard/deleteCheck.jsp";
	          }else if(command.equals("/deleteFreeReview.bo")) {
	        	  try {
		        	  int seq = Integer.parseInt(request.getParameter("seq"));
		        	  MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
		        	  
		        	  if(user.getSeq() == rdao.writerCheck(seq)) {
		        		  rdao.deleteReview(seq, user.getSeq());
		        		  dst = "reviewboard.bo";
		        	  }else {
		        		  dst = "reviewnotWriter.bo";
		        		  isForward = false;
		        	  }
	        	  }catch(NumberFormatException e) {
	        		  isForward = false;
	        		  dst = "reviewNumberError.bo";
	        		  e.printStackTrace();
	        	  }catch(Exception e1) {
	        		  isForward = false;
	        		  dst = "reviewError.bo";
	        	  }
	          }else if(command.equals("/reviewnotWriter.bo")) {
	        	  dst = "notWriter.jsp";
	          }else if(command.equals("/reviewNumberError.bo")) {
	        	  dst = "notNumber.jsp";
	          }else if(command.equals("/reviewError.bo")) {
	        	  isForward = false;
	        	  dst = "reviewborad.bo";
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
