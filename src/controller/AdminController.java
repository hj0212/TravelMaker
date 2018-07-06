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

import dao.AdminDAO;
import dao.MemberDAO;
import dao.ReviewDAO;
import dto.MemberDTO;
import dto.ReportFreeDTO;


@WebServlet("*.ad")
public class AdminController extends HttpServlet { 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			ReviewDAO rdao = new ReviewDAO();
			MemberDAO mdao = new MemberDAO();
			AdminDAO adao = new AdminDAO();

			boolean isForward = true;
			String dst = null;

			//-----------------------admin.jsp > 모든 회원 목록 보기
			if(command.equals("/showMembers.ad")) {
				List<MemberDTO> mlist = new ArrayList<>(); 
				mlist=adao.getAllMembers();
				request.setAttribute("memberList", mlist);			
				isForward = true;
				dst = "admin/admin.jsp";
			}
			
			//-----------------------admin.jsp > 회원차단 /해제 기능
			else if(command.equals("/blockMember.ad")) {
				int seq = Integer.parseInt(request.getParameter("sequence"));
				String isBlocked = adao.checkBlock(seq);
				
				int result = adao.changeBlock(seq,isBlocked);
				System.out.println("블락성공");
				request.setAttribute("blockResult", result);
				isForward = true;
				dst = "admin/admin.jsp";
			}
			
			//--------------------------admin_free > 신고당한 자유게시판 글 보기
			else if(command.equals("/admin_free.ad")) {
				/*System.out.println("신고글확인ctrl들어옴");*/
				List<ReportFreeDTO> flist = new ArrayList<>();
				flist = adao.getAllReport_f();
				request.setAttribute("freereport", flist);
	
				isForward = true;
				dst = "admin/admin_free.jsp";
			}
			
			//---------------------------admin_free >정렬 바꾸기..할지말지 고민중.
			else if(command.equals("/admin_free_count.ad")) {
				List<ReportFreeDTO> flist = new ArrayList<>();
				flist = adao.getReportAlign_f();
				request.setAttribute("freecountreport", flist);
	
				isForward = true;
				dst = "admin/admin_freeCount.jsp";
				
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