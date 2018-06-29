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
import dto.FreeboardDTO;
import dto.MemberDTO;

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
				
//				System.out.println("검색어: " + searchTerm);
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
					String nickname = MemberDAO.getUserNickname(dto.getSeq());
					
					FreeboardDTO boardDTO = fbdao.readFreeArticle(seq);
					
					request.setAttribute("article", boardDTO);
					request.setAttribute("writer", nickname);
					dst = "freeboard/freeArticleView.jsp";
				}
			} else if(command.equals("/login.bo")) {
				dst = "freeboard/needLogin.jsp";
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
