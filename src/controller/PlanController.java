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
import com.google.gson.JsonObject;

import dao.GoodBadDAO;
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
			GoodBadDAO gbdao = new GoodBadDAO();
			

			boolean isForward = true;
			String dst = null;

			if(command.equals("/addSchedule.plan")) {
				LocationDTO ldto = new LocationDTO();
				ldto.setLocation_name(request.getParameter("place"));
				ldto.setLocation_x(Integer.parseInt(request.getParameter("mapx")));
				ldto.setLocation_y(Integer.parseInt(request.getParameter("mapy")));
				int location_id = pdao.addLocation(ldto);

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

				List<BudgetDTO> list = new ArrayList<>();
				System.out.println("budget_plan: " + request.getParameter("budget_plan"));
				System.out.println("budget_amount: " + request.getParameter("budget_amount"));
				String[] budget_plan = request.getParameter("budget_plan").split("/");
				String[] budget_amount = request.getParameter("budget_amount").split("/");
				for(int i = 0; i < budget_plan.length; i++) {
					BudgetDTO btmp = new BudgetDTO();
					btmp.setPlan_seq(plan);
					btmp.setDay_seq(day);
					btmp.setBudget_plan(budget_plan[i]);
					btmp.setBudget_amount(Integer.parseInt(budget_amount[i]));
					list.add(btmp);
				}

				int schedule_seq = pdao.addSchedule(tmp);
				for(BudgetDTO btmp : list) {
					btmp.setSchedule_seq(schedule_seq);
				}

				int result = pdao.addBudget(list);
				if(result > 0) {
					System.out.println("등록성공");
				} else {
					System.out.println("등록실패");
				}	

				isForward = false;
				dst="selectSchedule.plan?plan="+plan+"&day="+day+"&create=f";
			} else if(command.equals("/modiSchedule.plan")) {
				//				세 값 다 넘어옵니다.
				LocationDTO ldto = new LocationDTO();
				System.out.println("place:"+request.getParameter("place"));
				ldto.setLocation_name(request.getParameter("place"));
				ldto.setLocation_id(Integer.parseInt(request.getParameter("location_id")));
				ldto.setLocation_x(Integer.parseInt(request.getParameter("mapx")));
				ldto.setLocation_y(Integer.parseInt(request.getParameter("mapy")));
				int location_id = pdao.addLocation(ldto);

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
				System.out.println("schedule_Seq:" + schedule_seq);
				int result = 0;
				List<BudgetDTO> remolist = new ArrayList<>();
				List<BudgetDTO> modilist = new ArrayList<>();
				List<BudgetDTO> addlist = new ArrayList<>();
				System.out.println("budget_seq: " + request.getParameter("budget_seq"));
				System.out.println("budget_plan: " + request.getParameter("budget_plan"));
				System.out.println("budget_amount: " + request.getParameter("budget_amount"));
				System.out.println("del_budget_seq: " + request.getParameter("delbudseq"));
				String budgetseqstr = request.getParameter("budget_seq");
				String budgetplanstr = request.getParameter("budget_plan");
				String delbudseqstr = request.getParameter("delbudseq");
				String[] budget_seq = request.getParameter("budget_seq").split("/");
				String[] budget_plan = request.getParameter("budget_plan").split("/");
				String[] budget_amount = request.getParameter("budget_amount").split("/");
				String[] del_budget_seq = request.getParameter("delbudseq").split("/");

				if(!delbudseqstr.equals("")) {	// 삭제
					for(int i = 0; i < del_budget_seq.length; i++) {
						BudgetDTO btmp = new BudgetDTO();
						btmp.setBudget_seq(Integer.parseInt(del_budget_seq[i]));
						remolist.add(btmp);
					}
					result = pdao.deleteBudget(remolist);
					if(result > 0) {
						System.out.println("삭제성공");
					} else {
						System.out.println("삭제실패");
					}
				}

				int count = budget_plan.length - budget_seq.length;
				if(budgetseqstr.equals("")) {
					for(int i = 0; i < budget_seq.length; i++) {	//추가
						BudgetDTO btmp = new BudgetDTO();
						btmp.setPlan_seq(plan);
						btmp.setDay_seq(day);
						System.out.println("저기:"+schedule_seq);
						btmp.setSchedule_seq(schedule_seq);
						btmp.setBudget_plan(budget_plan[i]);
						btmp.setBudget_amount(Integer.parseInt(budget_amount[i]));
						addlist.add(btmp);
					}
				} else if(!budgetseqstr.equals("")) {	//수정
					for(int i = 0; i < budget_seq.length; i++) {
						BudgetDTO btmp = new BudgetDTO();
						btmp.setBudget_seq(Integer.parseInt(budget_seq[i]));
						btmp.setPlan_seq(plan);
						btmp.setDay_seq(day);
						System.out.println("여기:" + btmp.getBudget_seq());
						btmp.setSchedule_seq(schedule_seq);
						btmp.setBudget_plan(budget_plan[i]);
						btmp.setBudget_amount(Integer.parseInt(budget_amount[i]));
						modilist.add(btmp);
					}
					result = pdao.modiBudget(modilist);
					if(result > budget_seq.length) {
						System.out.println("수정성공");
					} else {
						System.out.println("수정실패");
					}
				}

				if(count > 0) {
					for(int j = budget_seq.length-1; j<budget_plan.length; j++) {
						BudgetDTO btmp = new BudgetDTO();
						btmp.setPlan_seq(plan);
						btmp.setDay_seq(day);
						System.out.println("추가:"+schedule_seq);
						btmp.setSchedule_seq(schedule_seq);
						btmp.setBudget_plan(budget_plan[j]);
						btmp.setBudget_amount(Integer.parseInt(budget_amount[j]));
						addlist.add(btmp);
					}
				}
				result = pdao.addBudget(addlist);
				if(result > 0) {
					System.out.println("추가성공");
				} else {
					System.out.println("추가실패");
				}

				tmp.setSchedule_seq(schedule_seq);
				result = pdao.updateSchedule(tmp);

				if(result > 0) {
					System.out.println("스케줄수정성공");
				} else {
					System.out.println("스케줄수정실패");
				}

				isForward = false;
				dst="selectSchedule.plan?plan="+plan+"&day="+day+"&create=f";
			} else if(command.equals("/selectSchedule.plan")) {
				MemberDTO dto = (MemberDTO)request.getSession().getAttribute("user");
				
				int plan = Integer.parseInt(request.getParameter("plan"));
				int day = Integer.parseInt(request.getParameter("day"));
				String create = request.getParameter("create");
				int plan_period = pdao.getPlanperiod(plan);
				request.setAttribute("plan_period", plan_period);
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
				if(dto == null) {
					isForward=false;
					dst="login.bo";
				}else {					
					isForward = true;
					dst="plan_write.jsp?plan="+plan+"&day="+day+"&create="+create;
				}
				
			} else if(command.equals("/deleteSchedule.plan")) {
				int plan = Integer.parseInt(request.getParameter("plan"));
				int day = Integer.parseInt(request.getParameter("day"));
				int delseq = Integer.parseInt(request.getParameter("delseq"));
				int result = pdao.deleteBudget(delseq);
				result += pdao.deleteSchedule(delseq);

				if(result>0) {
					System.out.println("삭제성공");
				}else {
					System.out.println("삭제실패");
				}

				isForward=false;
				dst="selectSchedule.plan?plan="+plan+"&day="+day+"&create=f";
			} else if(command.equals("/createPlan.plan")) {
				int plan_writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();
				String plan_startdate = request.getParameter("plan_startdate");
				String plan_enddate = request.getParameter("plan_enddate");
				String plan_title = request.getParameter("plan_title");
				PlanDTO pdto = new PlanDTO(0,plan_writer,"",plan_startdate,plan_enddate,plan_title,0,0,0,0,"");
				int plan_seq = pdao.startPlanInsertData(pdto);
				int plan_period = pdao.getPlanperiod(plan_seq);
				if(plan_seq>0) {
					System.out.println("플랜생성완료");
				}else {
					System.out.println("플랜생성실패");
				}
				request.setAttribute("plan_period", plan_period);
				isForward=true;

				dst="selectSchedule.plan?plan="+plan_seq+"&day=1&create=t";
			}
			//----------------------------------planList 가져오기
			else if(command.equals("/planboard.plan")) {
				MemberDTO dto = ((MemberDTO)request.getSession().getAttribute("user"));
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
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("user", dto);
				//------------------------------------------------------

				String pageNavi = pdao.getPageNavi(currentPage, searchTerm);
				request.setAttribute("pageNavi", pageNavi);

				isForward = true;
				dst="share_plan.jsp";
			}else if(command.equals("/planArticle.plan")) {
				int currentPage = 0;
				String currentPageString = request.getParameter("currentPage");
				MemberDTO dto = ((MemberDTO)request.getSession().getAttribute("user"));
				
				if(currentPageString == null || currentPageString == "") {
					currentPage = 1;
				} else {
					currentPage = Integer.parseInt(currentPageString);
				}

				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				List<PlanCommentDTO> result1 = pdao.getAllPlanComments(plan_seq);
				int viewcount = pdao.planViewCount(plan_seq);
				int bad = gbdao.planBadSelectData(plan_seq);
				int good = gbdao.planGoodSelectData(plan_seq);
				PlanDTO plan = pdao.getPlandata(plan_seq);
				request.setAttribute("good", good);
				request.setAttribute("bad", bad);

				request.setAttribute("result1", result1);
				request.setAttribute("plan_seq", plan_seq);
				request.setAttribute("plan", plan);
				request.setAttribute("currentPage", currentPage);

				int plan_period = pdao.getPlanperiod(plan_seq);
				request.setAttribute("plan_period", plan_period);

				List<ScheduleDTO> list = new ArrayList<>();
				List<BudgetDTO> blist = new ArrayList<>();
				List<Integer> daytotalBudget = new ArrayList<>();
				int totalBudget = 0;
				for(int i = 0; i < plan_period; i++) {
					list = pdao.selectSchedule(plan_seq, i+1, list);
					blist = pdao.selectBudget(plan_seq, i+1, blist);
					int daybudget = pdao.getTotalBudget(plan_seq, i+1);
					daytotalBudget.add(daybudget);
					totalBudget += daybudget;
					request.setAttribute("scheduleList", list);
					request.setAttribute("budgetList", blist);
					request.setAttribute("daytotalBudget", daytotalBudget);
					request.setAttribute("totalBudget", totalBudget);
				}
				System.out.println(totalBudget);
				String plan_title = pdao.getPlantitle(plan_seq);
				request.setAttribute("plan_title", plan_title);
				
				if(dto == null) {
					isForward=false;
					dst="login.bo";
				}else {
				isForward=true;
				dst="planView.jsp?plan_seq="+plan_seq+"&currentPage="+currentPage;
				}

			}else if(command.equals("/insertPlanComment.plan")) {
				String comment_text = request.getParameter("comment_text");
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				int comment_writer = user.getSeq();
				int result = pdao.insertPlanComment(plan_seq, comment_text, comment_writer);
				request.setAttribute("result", result);
				request.setAttribute("plan_seq", plan_seq);

				isForward= true;
				dst="planCommentView.jsp";
			}else if(command.equals("/deletePlanComment.plan")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan_seq"));
				int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
				MemberDTO user = (MemberDTO) request.getSession().getAttribute("user");
				int writer = user.getSeq();
				int result = pdao.deletePlanComment(comment_seq, writer);
				request.setAttribute("result", result);
				request.setAttribute("plan_seq", plan_seq);

				isForward= true;
				dst = "deletePlanCommentView.jsp";
			}else if(command.equals("/removePlan.plan")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan"));
				int result = pdao.removePlan(plan_seq);
				if(result > 0) {
					System.out.println("삭제성공");
				} else {
					System.out.println("삭제실패");
				}

				isForward = false;
				dst = "planboard.plan";
			}else if(command.equals("/savePlan.plan")) {
				int plan_seq = Integer.parseInt(request.getParameter("plan"));
				int result = pdao.savePlan(plan_seq);
				if(result > 0) {
					System.out.println("등록성공");
				} else {
					System.out.println("등록실패");
				}

				isForward = false;
				dst = "planboard.plan";
			}


			if(isForward) {
				RequestDispatcher rd = request.getRequestDispatcher(dst);
				rd.forward(request, response);
			} else {
				response.sendRedirect(dst);
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
