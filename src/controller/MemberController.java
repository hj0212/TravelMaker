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
		response.setCharacterEncoding("utf8");
		
		MemberDAO mdao = new MemberDAO();
	
		boolean isForward = true;
		String dst = null;
		
		if(command.equals("/login.do")) {
			String id = request.getParameter("id");
			MemberDTO dto = new MemberDTO();
			dto.setUserid(request.getParameter("id"));
			dto.setPassword(request.getParameter("pw"));
			boolean result = mdao.loginMember(dto);
			request.setAttribute("proc", "login");
			request.setAttribute("loginResult", result);
			request.getSession().setAttribute("part", "home");
			request.getSession().setAttribute("loginId", id);
			isForward = true;
			dst="userResult.jsp";
			System.out.println("통과1");
			
		}else if(command.equals("/join.do")) {
			MemberDTO dto = new MemberDTO();
			dto.setUserid(request.getParameter("id"));
			dto.setPassword(request.getParameter("pw"));
			dto.setNickname(request.getParameter("nickname"));
			dto.setEmail(request.getParameter("email"));
			int result=mdao.addMember(dto);	
			request.setAttribute("proc", "join");
			request.setAttribute("joinResult", result);	
			isForward = true;
			dst="userResult.jsp";
			
		}else if(command.equals("/navlogin.do")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			MemberDTO dto = new MemberDTO();
			dto.setNaver_id(id);
			dto.setNaver_nickname(name);
			dto.setNaver_email(email);
			
			request.getSession().setAttribute("loginId", id);
			request.getSession().setAttribute("part", "naver");
			int result=mdao.addNaverMember(dto);

			isForward = false;
			dst="index.jsp";		

		}else if(command.equals("/logout.do")) {
			request.getSession().invalidate();
		
			isForward = true;
			dst="newlogin.jsp";	

		}else if(command.equals("/kakao.do")) {
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			String nickname = request.getParameter("nickname");
			
			System.out.println(id);
			System.out.println(email);
			System.out.println(nickname);
			MemberDTO dto = new MemberDTO();
			dto.setKakao_id(id);
			dto.setKakao_email(email);
			dto.setNaver_nickname(nickname);
			
			

		}else if(command.equals("/admin.do")) {
			String part = (String)request.getSession().getAttribute("part");
			String id = (String)request.getSession().getAttribute("loginId");
			MemberDTO mdto = new MemberDTO();
			mdto = mdao.getProfileInfo(part, id);
			if(part.equals("home")) {
			request.setAttribute("part", mdto.getPart());
			request.setAttribute("nickname", mdto.getNickname());
			request.setAttribute("email", mdto.getEmail());
			}else if(part.equals("naver")) {
				request.setAttribute("part", mdto.getPart());
				request.setAttribute("nickname", mdto.getNaver_nickname());
				request.setAttribute("email", mdto.getNaver_email());
			}else if(part.equals("kakao")) {
				request.setAttribute("part", mdto.getPart());
				request.setAttribute("nickname", mdto.getKakao_nickname());
				request.setAttribute("email", mdto.getKakao_email());
			}
			
			isForward = true;
			dst="admin.jsp";
		}else if(command.equals("/mypage.do")) {
			String part = (String)request.getSession().getAttribute("part");
			String id = (String)request.getSession().getAttribute("loginId");
			MemberDTO mdto = new MemberDTO();
			mdto = mdao.getProfileInfo(part, id);
			if(part.equals("home")) {
			request.setAttribute("nickname", mdto.getNickname());
			request.setAttribute("email", mdto.getEmail());
			}else if(part.equals("naver")) {
				request.setAttribute("nickname", mdto.getNaver_nickname());
				request.setAttribute("email", mdto.getNaver_email());
			}else if(part.equals("kakao")) {
				request.setAttribute("nickname", mdto.getKakao_nickname());
				request.setAttribute("email", mdto.getKakao_email());
			}
			
			isForward = true;
			dst="mypage.jsp";

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
