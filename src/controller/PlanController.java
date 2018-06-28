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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import dao.PlanDAO;
import dto.PlanDTO;
import dto.ScheduleDTO;

/**
 * Servlet implementation class PlanController
 */
@WebServlet("*.plan")
public class PlanController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI= request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("utf8");

			PlanDAO pdao = new PlanDAO();
		
			boolean isForward = true;
			String dst = null;

			if(command.equals("/saveschedule.plan")) {
				Gson gson = new Gson();
				JsonParser parser = new JsonParser();
				JsonArray arr = (JsonArray) parser.parse(request.getReader());
				
				List<ScheduleDTO> list = new ArrayList<>();
				for(int i = 0; i < arr.size(); i++) {
					ScheduleDTO tmp = new ScheduleDTO();
					String timestr = arr.get(i).getAsJsonObject().get("시간").getAsString();
					String starttime = timestr.split("~")[0];
					String endtime = timestr.split("~")[1];
					tmp.setSchedule_starttime(starttime);
					tmp.setSchedule_endtime(endtime);
					tmp.setLocation_id(arr.get(i).getAsJsonObject().get("장소").getAsString());
					tmp.setSchedule_plan(arr.get(i).getAsJsonObject().get("일정").getAsString());
					tmp.setSchedule_budget(arr.get(i).getAsJsonObject().get("예산").getAsString());
					tmp.setSchedule_ref(arr.get(i).getAsJsonObject().get("참조").getAsString());
					list.add(tmp);
				}
				int result = pdao.addSchedule(list);
				if(result > 0) {
					System.out.println("성공");
				} else {
					System.out.println("실패");
				}
				isForward = false;
				dst="plan_write.jsp?day=2";
				
			} else if(command.equals("/selectSchedule.plan")) {
				
				isForward = true;
				dst="userResult.jsp";

			} else if(command.equals("/createPlan.plan")) {
				int plan_writer = 17;//Integer.parseInt((String)request.getSession().getAttribute("seq"));
				String plan_startdate = request.getParameter("plan_startdate");
				String plan_enddate = request.getParameter("plan_enddate");
				String plan_title = request.getParameter("plan_title");
				PlanDTO pdto = new PlanDTO(0,plan_writer,plan_startdate,plan_enddate,plan_title,0,0,0,0);
				int result =pdao.startPlanInsertData(pdto);
				
				if(result>0) {
					System.out.println("입력성공");
				}else {
					System.out.println("입력실패");
				}
				
				request.setAttribute("result", result);
				isForward=true;
				dst="createPlan.jsp";
				
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
