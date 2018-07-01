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

import dao.MemberDAO;
import dao.PlanDAO;
import dto.BudgetDTO;
import dto.LocationDTO;
import dto.MemberDTO;
import dto.PlanCommentDTO;
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
			MemberDAO mdao = new MemberDAO();
		

			boolean isForward = true;
			String dst = null;

			if(command.equals("/addSchedule.plan")) {
//				세 값 다 넘어옵니다.
				LocationDTO ldto = new LocationDTO();
				ldto.setLocation_name(request.getParameter("place"));
				ldto.setLocation_x(Integer.parseInt(request.getParameter("mapx")));
				ldto.setLocation_y(Integer.parseInt(request.getParameter("mapy")));
				int location_id = pdao.addLocation(ldto);
				System.out.println("locaitonid: " + location_id);
				
				ScheduleDTO tmp = new ScheduleDTO();
				int plan = Integer.parseInt(request.getParameter("plan"));
				int day = Integer.parseInt(request.getParameter("day"));
				tmp.setPlan_seq(plan);
				tmp.setDay_seq(day);
				tmp.setSchedule_starttime(request.getParameter("starttime"));
				tmp.setSchedule_endtime(request.getParameter("endtime"));
				tmp.setLocation_id(location_id); 
				tmp.setSchedule_plan(request.getParameter("schedule"));
				tmp.setSchedule_ref(request.getParameter("reference"));
				int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
				
				List<BudgetDTO> list = new ArrayList<>();
				/*String[] budget_plan = request.getParameter("budget_plan").split("/");
				String[] budget_amount = request.getParameter("budget_amount").split("/");
				for(int i = 0; i < budget_plan.length; i++) {
					BudgetDTO btmp = new BudgetDTO();
					btmp.setPlan_seq(plan);
					btmp.setDay_seq(day);
					btmp.setBudget_plan(budget_plan[i]);
					btmp.setBudget_amount(Integer.parseInt(budget_amount[i]));
					list.add(btmp);
				}*/
				
				
				if(schedule_seq > 0) {	// 수정
					tmp.setSchedule_seq(schedule_seq);
					int result = pdao.updateSchedule(tmp);

					for(BudgetDTO btmp : list) {
						btmp.setSchedule_seq(schedule_seq);
					}
					result += pdao.addBudget(list);
					if(result > 1) {
						System.out.println("수정성공");
					} else {
						System.out.println("수정실패");
					}
				} else {
					schedule_seq = pdao.addSchedule(tmp);
					for(BudgetDTO btmp : list) {
						btmp.setSchedule_seq(schedule_seq);
					}
					
					int result = pdao.addBudget(list);
					if(result > 0) {
						System.out.println("등록성공");
					} else {
						System.out.println("등록실패");
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
					int totalBudget = pdao.getTotalBudget(plan, day);
					request.setAttribute("totalBudget", totalBudget);
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
			} else if(command.equals("/createPlan.plan")) {
				int plan_writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();
				String plan_startdate = request.getParameter("plan_startdate");
				String plan_enddate = request.getParameter("plan_enddate");
				String plan_title = request.getParameter("plan_title");
				PlanDTO pdto = new PlanDTO(0,plan_writer,"",plan_startdate,plan_enddate,plan_title,0,0,0,0);
				int plan_seq = pdao.startPlanInsertData(pdto);
				if(plan_seq>0) {
					System.out.println("플랜생성완료");
				}else {
					System.out.println("플랜생성실패");
				}
				System.out.println(plan_seq);
//				request.setAttribute("result", result);
				isForward=true;

				dst="selectSchedule.plan?plan="+plan_seq+"&day=1&create=t";
			}

//----------------------------------planList 가져오기
			else if(command.equals("/planboard.plan")) {

				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				if(currentPageString == null) {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}
				String searchTerm = request.getParameter("search");
				List<PlanDTO>list = new ArrayList<>();
				list = pdao.getSomePlan(currentPage*12-11, currentPage*12, searchTerm);
				request.setAttribute("planList", list);
				//------------------------------------------------------

				String pageNavi = pdao.getPageNavi(currentPage, searchTerm);
				request.setAttribute("pageNavi", pageNavi);

				isForward = true;
				dst="share_plan.jsp";
			}else if(command.equals("/planArticle.plan")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				List<PlanCommentDTO> result1 = pdao.getAllPlanComments(plan_seq);
				request.setAttribute("result1", result1);
				request.setAttribute("plan_seq", plan_seq);
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				request.setAttribute("user", user.getSeq());

				isForward=true;
				dst="hoogi.jsp";
			}else if(command.equals("/insertPlanComment.plan")) {
				String comment_text = request.getParameter("comment_text");
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				int comment_writer = user.getSeq();
				int result = pdao.insertPlanComment(plan_seq, comment_text, comment_writer);
				request.setAttribute("result", result);
				request.setAttribute("plan_seq", plan_seq);
				
				System.out.println("user.getSeq() : "+ user.getSeq());
				System.out.println("planComment.plan - comment_text :"+ comment_text);
				
				isForward= true;
				dst="planCommentView.jsp";
			}else if(command.equals("deletePlanComment.plan")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				int writer = user.getSeq();
				
				System.out.println("deletePlanComment.plan :"+plan_seq +":"+writer);

				int result = pdao.deletePlanComment(comment_seq, writer);
				request.setAttribute("result", result);
				request.setAttribute("plan_seq", plan_seq);
				
				
				isForward= true;
				dst = "deletePlanCommentView.jsp";
				
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
