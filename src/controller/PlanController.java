package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.PlanDAO;
import dto.BudgetDTO;
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
			Gson gson = new Gson();

			boolean isForward = true;
			String dst = null;

			if(command.equals("/addSchedule.plan")) {
				ScheduleDTO tmp = new ScheduleDTO();
				int plan = Integer.parseInt(request.getParameter("plan"));
				int day = Integer.parseInt(request.getParameter("day"));
				tmp.setPlan_seq(plan);
				tmp.setDay_seq(day);
				tmp.setSchedule_starttime(request.getParameter("starttime"));
				tmp.setSchedule_endtime(request.getParameter("endtime"));
				tmp.setLocation_id(request.getParameter("place")); 
				tmp.setSchedule_plan(request.getParameter("schedule"));
				tmp.setSchedule_ref(request.getParameter("reference"));
				int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
				
				BudgetDTO btmp = new BudgetDTO();
				btmp.setBudget_plan(request.getParameter("budget_plan"));
				btmp.setBudget_amount(Integer.parseInt(request.getParameter("money")));

				if(schedule_seq > 0) {	// 수정
					tmp.setSchedule_seq(schedule_seq);
					int result = pdao.updateSchedule(tmp);
					
					btmp.setSchedule_seq(schedule_seq);
					result += pdao.addBudget(btmp);
					if(result > 1) {
						System.out.println("수정성공");
					} else {
						System.out.println("수정실패");
					}
				} else {
					int result = pdao.addSchedule(tmp);
					btmp.setSchedule_seq(pdao.getScheduleseq());
					result += pdao.addBudget(btmp);
					if(result > 1) {
						System.out.println("성공");
					} else {
						System.out.println("실패");
					}
				}
				
				
				isForward = true;
				dst="selectSchedule.plan?plan="+plan+"&day="+day+"&create=f";

			} else if(command.equals("/selectSchedule.plan")) {
				
				int plan = Integer.parseInt(request.getParameter("plan"));
				int day = Integer.parseInt(request.getParameter("day"));
				String create = request.getParameter("create");
				
				if(create.equals("f")) {
					List<ScheduleDTO> list = pdao.selectSchedule(plan, day);
					List<BudgetDTO> blist = pdao.selectBudget(plan, day);
					request.setAttribute("create", create);
					request.setAttribute("scheduleList", list);
					request.setAttribute("budgetList", blist);
				} else {
					
					request.setAttribute("create", create);
				}
				String plan_title = pdao.getPlantitle(plan);
				request.setAttribute("plan_title", plan_title);
				
				isForward = true;
				dst="plan_write.jsp?plan="+plan+"&day="+day+"&create="+create;
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
