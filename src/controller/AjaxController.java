package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.FreeReportDAO;
import dao.MemberDAO;
import dao.PlanDAO;
import dao.ReviewReportDAO;
import dto.LocationDTO;
import dto.MemberDTO;
import dto.ScheduleDTO;

/**
 * Servlet implementation class IdcheckAjax
 */
@WebServlet("*.Ajax")
public class AjaxController extends HttpServlet {
	ReviewReportDAO rrdao = new ReviewReportDAO();
	FreeReportDAO frdao = new FreeReportDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			MemberDAO mdao = new MemberDAO();
			PlanDAO pdao = new PlanDAO();

			if(command.equals("/idcheck.Ajax")) {				
				String userid = request.getParameter("userid");
				boolean idcheck = mdao.check(userid);
				PrintWriter pw = response.getWriter();
				System.out.println(idcheck);
				if(userid.equals("")) {
					pw.println("id");
					return;
				}

				if(userid.length()>45) {
					pw.println("<font color=red>id(최대48글자입니다)</font>");
					return;
				}
				if(userid.length()<8) {
					pw.println("<font color=red>id(최소8글자이상입니다)</font>");
					return;
				}

				if(idcheck) {
					pw.println("<font color=red>id(사용중인 아이디입니다)</font>");
				}else{
					pw.println("<font color=blue>id(사용가능한아이디입니다)</font>");
				}
			} else if(command.equals("/planviewlist.Ajax")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				List<LocationDTO> locationlist = pdao.selectLocation(plan_seq);
				List<ScheduleDTO> timelinelist = pdao.selectTimeline(plan_seq);
				JsonObject obj = new JsonObject();
				JsonArray jLocationList = new Gson().toJsonTree(locationlist).getAsJsonArray();
				JsonArray jTimeLine = new Gson().toJsonTree(timelinelist).getAsJsonArray();
				obj.add("jLocationList", jLocationList);
				obj.add("jTimeLine", jTimeLine);
				PrintWriter pw = response.getWriter();
				pw.print(obj.toString());
				pw.flush();
				pw.close();
				return;
			} else if(command.equals("/reviewReport.Ajax")) {
				try {
					int seq = Integer.parseInt(request.getParameter("value"));
					MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
					
					if(dto == null) {
						response.sendRedirect("reviewArticle.bo?review_seq="+seq);
					}else {
						int result = rrdao.reviewReport(dto.getSeq(), seq);
						response.getWriter().print(result);
					}
				}catch(Exception e) {
					response.sendRedirect("reviewboard.bo");
				}
			} else if(command.equals("/freeReport.Ajax")) {
				try {
					int seq = Integer.parseInt(request.getParameter("value"));
					MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
					
					if(dto == null) {
						response.sendRedirect("viewFreeArticle.bo?seq="+seq);
					}else {
						int result = frdao.freeReport(dto.getSeq(), seq);
						response.getWriter().print(result);
					}
				}catch(Exception e) {
					response.sendRedirect("freeboard.bo");
				}
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
