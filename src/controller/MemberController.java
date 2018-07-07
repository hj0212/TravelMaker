package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import beans.SendMail;
import dao.AdminDAO;
import dao.GoodBadDAO;
import dao.MemberDAO;
import dao.PlanDAO;
import dao.ReviewDAO;
import dto.MemberDTO;
import dto.PlanDTO;
import dto.ReviewDTO;


@WebServlet("*.do")
public class MemberController extends HttpServlet { 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			PlanDAO pdao = new PlanDAO();
			ReviewDAO rdao = new ReviewDAO();
			MemberDAO mdao = new MemberDAO();
			AdminDAO adao = new AdminDAO();
			GoodBadDAO gdao = new GoodBadDAO();

			boolean isForward = true;
			String dst = null;
			System.out.println(command);

			if(command.equals("/login.do")) {

				MemberDTO dto = new MemberDTO();
				dto.setUserid(request.getParameter("id"));
				dto.setPassword(request.getParameter("pw"));
				MemberDTO user = mdao.loginMember(dto);
				user.setPart("home");
				boolean result = false;
				if(user.getSeq() > 0) {
					result = true;
					request.getSession().setMaxInactiveInterval(60*60) ;
					
					request.setAttribute("proc", "login");
					request.setAttribute("loginResult", result);
					request.getSession().setAttribute("part", "home");
					request.getSession().setAttribute("user", user);
					request.getSession().setAttribute("loginId", dto.getUserid());
					request.getSession().setAttribute("file_name", user.getPhoto_system_file_name());
					String nickname = mdao.getUserNickname(user.getSeq());
					request.getSession().setAttribute("nickname", nickname);
					if(user.getBlock().equals("y")) {
						isForward = true;
						dst="login/errorBlock.jsp";
					}
					else if(user.getBlock().equals("n") || user.getBlock().equals("x")){
						isForward = true;
						dst="main.bo";
					}
				} else {
					isForward = false;
					dst="login/newlogin.jsp";
				}

			} else if(command.equals("/join.do")) {
				MemberDTO dto = new MemberDTO();
				dto.setUserid(request.getParameter("idcheck"));
				dto.setPassword(request.getParameter("pwcheck"));
				dto.setNickname(request.getParameter("nickname"));
				dto.setEmail(request.getParameter("email"));
				int result=mdao.addMember(dto);	
				request.setAttribute("proc", "join");
				request.setAttribute("joinResult", result);	
				isForward = true;
				dst="login/newlogin.jsp";

			} else if(command.equals("/navlogin.do")) {				
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				MemberDTO dto = new MemberDTO();
				dto.setNaver_id(id);
				dto.setNaver_nickname(name);
				dto.setNaver_email(email);

				MemberDTO user = mdao.addNaverMember(dto);
				user.setPart("naver");

				String nickname=mdao.getUserNickname(user.getSeq());
				request.getSession().setAttribute("nickname", nickname);
				request.getSession().setAttribute("file_name", user.getPhoto_system_file_name());
				request.getSession().setAttribute("part", "naver");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("loginId", user.getUserid());
				
				
				if(user.getBlock().equals("y")) {
					isForward = true;
					dst="login/errorBlock.jsp";
				}else {
					isForward = false;
					dst="main.bo";
				}	

			}else if(command.equals("/kakaologin.do")) {
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String img = request.getParameter("img");
				MemberDTO dto = new MemberDTO();
				dto.setKakao_id(id);
				dto.setKakao_nickname(name);
				dto.setKakao_email(email);

				MemberDTO user = mdao.addKakaoMember(dto);
				user.setPart("kakao");

				request.getSession().setAttribute("part", "kakao");
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("loginId", user.getUserid());
				request.getSession().setAttribute("img",img );

				String nickname=mdao.getUserNickname(user.getSeq());
				request.getSession().setAttribute("nickname", nickname);
				if(user.getBlock().equals("y")) {
					isForward = true;
					dst="login/errorBlock.jsp";
				}else {
					isForward = true;
					dst="main.bo";
				}


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
				dst="admin/admin.jsp";
			}else if(command.equals("/mypage.do")) {
				String part = (String)request.getSession().getAttribute("part");
				String id = (String)request.getSession().getAttribute("loginId");	
				MemberDTO user = (MemberDTO)request.getSession().getAttribute("user");
			
				/*프로필부분 출력*/
				MemberDTO mdto = mdao.newMemberInfo(user.getSeq(), part);
			

				/*mdto = mdao.getProfileInfo(part, id);*/

				/*String file_name = ((MemberDTO)request.getSession().getAttribute("user")).getPhoto_system_file_name();*/
			/*	System.out.println(file_name);*/
				
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
				/*request.getSession().setAttribute("file_name", "/TravelMaker/file/"+mdto.getPhoto_system_file_name());*/
				System.out.println(request.getSession().getAttribute("file_name"));
			/*리뷰와 망가진 네비*/
				
				/*List<ReviewDTO> MyReviewResult = rdao.getMyReview(user.getSeq());
		        request.setAttribute("MyReviewResult", MyReviewResult);*/

				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");

				if(currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}

				List<ReviewDTO> MyReviewResult = rdao.getMyReview(user.getSeq(), currentPage*12-11, currentPage*12);
				request.setAttribute("MyReviewResult", MyReviewResult);

				String MyReviewPageNavi = rdao.getMyReviewPageNavi(user.getSeq(), currentPage);
				request.setAttribute("MyReviewPageNavi", MyReviewPageNavi);
				
				List<PlanDTO> MyPlanResult = pdao.getMyPlans(user.getSeq(), currentPage*12-11, currentPage*12);
				request.setAttribute("MyPlanResult", MyPlanResult);

				String MyPlanPageNavi = pdao.getMyPlanPageNavi(user.getSeq(), currentPage);
				request.setAttribute("MyPlanPageNavi", MyPlanPageNavi);

				/*planList*/
				
				int seq = user.getSeq();
				List<PlanDTO> list = new ArrayList<>();
				list = pdao.getMyTmpPlan(seq);
				request.setAttribute("planList", list);
				
				
				/*좋아요누른글*/
				List<PlanDTO> flist = new ArrayList<>();
				flist = gdao.favoriteData(seq);
				request.setAttribute("flist", flist);
				
				
				isForward = true;
				dst="mypage.jsp";
			}else if(command.equals("/logout.do")) {
				request.getSession().invalidate();

				isForward = true;
				dst="main.bo";	


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
			}else if(command.equals("/editInfoNK.do")){
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				String part = user.getPart();
				
				if(part.equals("naver")) {
					request.setAttribute("id", user.getNaver_id());
					request.setAttribute("nickname", user.getNaver_nickname());
					request.setAttribute("email", user.getNaver_email());
				}else if(part.equals("kakao")) {
					request.setAttribute("id", user.getKakao_id());
					request.setAttribute("nickname", user.getKakao_nickname());
					request.setAttribute("email", user.getKakao_email());
				}
				isForward=true;
				dst="editInfoNK.jsp";

			}else if(command.equals("/modiNKMemInfo.do")) {
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				String part = user.getPart();
				int seq = user.getSeq();
				String id = request.getParameter("id");
				String nickname = request.getParameter("nickname");
				String email = request.getParameter("email");
				int result  = mdao.updateNKMemberInfo(id, nickname, email, seq, part);
				request.setAttribute("result", result);
				
				isForward= true;
				dst = "editInfoNKView.jsp";
			}else if(command.equals("/toEditInfoNK.do")) {
				
				isForward=true;
				dst="toEditInfoNK.jsp";
				//////////////비밀번호 찾기 기능 ->입력받은 이메일 확인
			}else if(command.equals("/checkEmail.do")){
				String id=request.getParameter("id");
				String email = request.getParameter("email");
				int result =mdao.getEmail(id, email);
				request.setAttribute("checkEmailResult",result);
				if(result==10) {
					request.setAttribute("inputId",id);
					if(result==11) {
						request.setAttribute("inputEmail", email);			
					}			
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
				int changeResult = mdao.changePw(id, pw);
				if(changeResult==1) {
					smail.send(id, email, pw);			
					request.setAttribute("mailResult", true);		
				}else {
					request.setAttribute("mailResult", false);
				}

				isForward = true;
				dst = "sendtmpPwResult";
			}else if(command.equals("/profileImg.do")) {
				// 이미지를 업로드할 경로
				String uploadPath = request.getServletContext().getRealPath("file");
				
				int size = 10 * 1024 * 1024;	// 업로드 사이즈 10M 이하,

				// 경로가 없을 경우 결로 생성
				File f = new File(uploadPath);
				if(!f.exists()) {
					f.mkdir();
				}

				// 원래 파일명, 시스템에 저장되는 파일명
				String ofileName ="";
				String sfileName ="";

				try {
					// 파일 업로드 및 업로드 후 파일명을 가져옴
					MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
					Enumeration<String> files = mr.getFileNames();
					String file = files.nextElement();
					ofileName = mr.getOriginalFileName(file);
					sfileName = mr.getFilesystemName(file);

				}catch(Exception e) {
					e.printStackTrace();
				}

				uploadPath = contextPath +"/file/"+ sfileName;
				System.out.println(uploadPath);
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				int user_seq = user.getSeq();
				System.out.println("user_seq :"+user_seq);
				int result = mdao.updateProfileImg(user_seq, sfileName);
				request.setAttribute("result", result);
				String file_name =user.getPhoto_system_file_name();
				String part = user.getPart();
				user = mdao.newMemberInfo(user_seq, part);
				request.getSession().setAttribute("file_name",uploadPath);
				request.setAttribute("user_seq", user_seq);

				request.setAttribute("uploadPath", uploadPath);


				isForward=true;
				dst = "mypage.do";
			}

			//-----------------------admin.jsp > 모든 회원 리스트보기
			else if(command.equals("/showMembers.do")) {
				List<MemberDTO> mlist = new ArrayList<>(); 
				mlist=adao.getAllMembers();
				request.setAttribute("memberList", mlist);

				isForward = true;
				dst = "admin/admin.jsp";
			}

			//-----------------------admin.jsp > 회원계정 차단
			else if(command.equals("/blockMember.do")) {
				int seq = Integer.parseInt(request.getParameter("sequence"));
				String isBlocked = adao.checkBlock(seq);

				int result = adao.changeBlock(seq,isBlocked);
				request.setAttribute("blockResult", result);
				isForward = true;
				dst = "admin/admin.jsp";
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
