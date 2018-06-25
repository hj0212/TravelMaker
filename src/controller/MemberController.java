package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;


@WebServlet("*.do")
public class MemberController extends HttpServlet { 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		String requestURI= request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO mdao = new MemberDAO();

		boolean isForward = true;
		String dst = null;
		
		if(command.equals("/login.do")) {
			MemberDTO dto = new MemberDTO();
			dto.setUserid(request.getParameter("id"));
			dto.setPassword(request.getParameter("pw"));
			boolean result = mdao.loginMember(dto);
			request.setAttribute("loginResult", result);	
			isForward = true;
			dst="userResult.jsp?proc=login";
			
		}else if(command.equals("/join.do")) {
			MemberDTO dto = new MemberDTO();
			dto.setUserid(request.getParameter("id"));
			dto.setPassword(request.getParameter("pw"));
			dto.setNickname(request.getParameter("nickname"));
			dto.setEmail(request.getParameter("email"));
			int result=mdao.addMember(dto);	
			request.setAttribute("joinResult", result);	
			isForward = true;
			dst="userResult.jsp?proc=join";
		}else if(command.equals("/navlogin.do")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberDTO dto = new MemberDTO();
			dto.setNaver_id(id);
			dto.setNaver_nickname(name);
			dto.setNaver_email(email);
			
			request.getSession().setAttribute("loginId", id);
			int result=mdao.addNaverMember(dto);

			isForward = false;
			dst="index.jsp";		

		}else if(command.equals("/logout.do")) {
			request.getSession().invalidate();
		
			isForward = true;
			dst="login.html";	
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
