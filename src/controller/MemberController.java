package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SendMail;
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
				MemberDTO dto = new MemberDTO();
				dto.setUserid(request.getParameter("id"));
				dto.setPassword(request.getParameter("pw"));
				MemberDTO user = mdao.loginMember(dto);
				user.setPart("home");
				boolean result = false;
				if(user.getSeq() > 0) {
					result = true;
				}
				request.setAttribute("proc", "login");
				request.setAttribute("loginResult", result);
				request.getSession().setAttribute("part", "home");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("loginId", dto.getUserid());
				
				String nickname=	mdao.getUserNickname(user.getSeq());
				request.getSession().setAttribute("nickname", nickname);
				
				isForward = true;
				dst="userResult.jsp";
				

			} else if(command.equals("/join.do")) {
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

			} else if(command.equals("/navlogin.do")) {				
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				MemberDTO dto = new MemberDTO();
				dto.setNaver_id(id);
				dto.setNaver_nickname(name);
				dto.setNaver_email(email);
				
				MemberDTO user = mdao.loginMember(dto);
				user.setPart("naver");
				
				String nickname=mdao.getUserNickname(user.getSeq());
				request.getSession().setAttribute("nickname", nickname);
				
				request.getSession().setAttribute("part", "naver");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("loginId", user.getUserid());
				
				isForward = false;
				dst="main.jsp";		

			}else if(command.equals("/kakaologin.do")) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				MemberDTO dto = new MemberDTO();
				dto.setKakao_id(id);
				dto.setKakao_nickname(name);
				dto.setKakao_email(email);
				
				MemberDTO user = mdao.addKakaoMember(dto);
				user.setPart("kakao");
				
				request.getSession().setAttribute("part", "kakao");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("loginId", user.getUserid());

				String nickname=mdao.getUserNickname(user.getSeq());
				request.getSession().setAttribute("nickname", nickname);

				isForward = false;
				dst="main.jsp";		

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
			}else if(command.equals("/logout.do")) {
				request.getSession().invalidate();

				isForward = true;
				dst="main.jsp";	


			//////////////비밀번호 찾기 기능 ->입력받은 이메일 확인
			}else if(command.equals("/checkEmail.do")){
				String id=request.getParameter("id");				
				String email = request.getParameter("email");
				int result =mdao.getEmail(id, email);
				request.setAttribute("checkEmailResult",result);
				if(result==10) {
					request.setAttribute("inputId",id);
				}else if(result==11) {			
					request.setAttribute("inputId",id);
					request.setAttribute("inputEmail", email);			
				}
				isForward = true;
				dst="findPwresult.jsp";
			}
			//////////////임시비밀번호 전송 기능	
			else if(command.equals("/sendtmpPw.do")) {
				String id=request.getParameter("id");
				String email=request.getParameter("email");
				SendMail smail = new SendMail();
				String pw =smail.maketmpPw();
				System.out.println(pw);
				int changeResult = mdao.changePw(id, pw);
				if(changeResult==1) {
					smail.send(id, email, pw);			
					request.setAttribute("mailResult", true);		
				}else {
					request.setAttribute("mailResult", false);
				}

				isForward = true;
				dst = "sendtmpPwResult.jsp";
			}else if(command.equals("/homeMemInfo.do")) {
				String part = (String)request.getSession().getAttribute("part");
				String id = (String)request.getSession().getAttribute("loginId");
				if(part.equals("home")) {
					MemberDTO mdto = new MemberDTO();
					mdto = mdao.getHomeMemberInfo(id, part);
					request.setAttribute("id", mdto.getUserid());
					request.setAttribute("pw", mdto.getPassword());
					request.setAttribute("nickname", mdto.getNickname());
					request.setAttribute("email", mdto.getEmail());
				}
				isForward = true;
				dst="editInfo.jsp";
			}else if(command.equals("/updateEmail.do")) {
				String part = (String)request.getSession().getAttribute("part");
				String id = (String)request.getSession().getAttribute("loginId");
				String email = request.getParameter("email");
				int result = mdao.updateEmail(id, part, email);
				request.setAttribute("result", result);
				
				isForward = true;
				dst="updateEmailView.jsp";
			}else if(command.equals("/toUpdateEmail.do")) {
				isForward=true;
				dst="updateEmail.jsp";
			}else if(command.equals("/toPwCheck.do")) {
				isForward=true;
				dst="pwCheck.jsp";
			
			}else if(command.equals("/pwCheck.do")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String pw = request.getParameter("pw");
				boolean result = mdao.isHomeMemberPW(id, pw);
				request.setAttribute("result", result);		
				isForward = true;
				dst="pwCheckView.jsp";
			}else if(command.equals("/modiHomeMemInfo.do")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String email = request.getParameter("email");
				String nickname = request.getParameter("nickname");
				String pw = request.getParameter("pw");
				int result = mdao.updateHomeMemberInfo(id, pw, email, nickname);
				request.setAttribute("result", result);
				
				isForward = true;
				dst = "editInfoView.jsp";
			}else if(command.equals("/toPwTrueCheck.do")) {
				isForward=true;
				dst="pwTrueCheck.jsp";
			}else if(command.equals("/pwTrueCheck.do")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String pw = request.getParameter("pw");
				boolean result = mdao.isHomeMemberPW(id, pw);
				request.setAttribute("result", result);		
				isForward = true;
				dst="pwTrueCheckView.jsp";
			}else if(command.equals("/toModiPw.do")) {			
				isForward=true;
				dst="modiPw.jsp";
			}else if(command.equals("/modiPw.do")) {
				String id = (String)request.getSession().getAttribute("loginId");
				String pw = request.getParameter("pw");
				String repw = request.getParameter("repw");
				if(pw.equals(repw)) {
				int result = mdao.updatePw(id, repw);
				request.setAttribute("result", result);
				isForward = true;
				dst="modiPwView.jsp";
				}else {
					isForward = false;
				}
			}else if(command.equals("/toLogin.do")) {
				isForward=true;
				dst="newlogin.jsp";
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
