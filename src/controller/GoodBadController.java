package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GoodBadDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class GoodBadController
 */
@WebServlet("*.btns")
public class GoodBadController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			request.setCharacterEncoding("utf8");
			response.setCharacterEncoding("utf8");
			GoodBadDAO gbdao = new GoodBadDAO();

			if(command.equals("/reGoodbtn.btns")) {

				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();		
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.reviewGoodBtnCheck(article, user_seq);
				int count =0;
				if(check) {
					count =gbdao.reviewGoodSelectData(article);
					pw.println(count);

				}else {
					int result = gbdao.reviewGoodInsertData(article, user_seq);//인설트
					if(result>0) {	
						count =	gbdao.reviewGoodSelectData(article);
						pw.println(count);

					}
				}

			}else if(command.equals("/reBadbtn.btns")) {
				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();	
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.reviewBadCheck(article, user_seq);
				int count =0;
				if(check) {					
					count =gbdao.reviewBadSelectData(article);
					pw.println(count);

				}else {
					int result = gbdao.reviewBadInsertData(article, user_seq);
					if(result>0) {
						count = gbdao.reviewBadSelectData(article);
						pw.println(count);
					}
				}

			}else if(command.equals("/frGoodbtn.btns")) {
				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();		
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.freeGoodBtnCheck(article, user_seq);
				int count =0;
				if(check) {				
					count =gbdao.freeGoodSelectData(article);
					pw.println(count);

				}else {
					int result = gbdao.freeGoodInsertData(article, user_seq);//인설트
					if(result>0) {	
						count =	gbdao.freeGoodSelectData(article);
						pw.println(count);

					}
				}
			}else if(command.equals("/frBadbtn.btns")) {
				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();	
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.freeBadCheck(article, user_seq);
				int count =0;
				if(check) {
					count =gbdao.freeBadSelectData(article);
					pw.println(count);
				}else {
					int result = gbdao.freeBadInsertData(article, user_seq);
					if(result>0) {
						 count = gbdao.freeBadSelectData(article);
						pw.println(count);
					}
				}
			}else if(command.equals("/plangood.btns")) {
				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();		
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.planGoodBtnCheck(article, user_seq);
				int count =0;
				if(check) {
					count =gbdao.planGoodSelectData(article);
					pw.println(count);
				}else {
					int result = gbdao.planGoodInsertData(article, user_seq);//인설트
					if(result>0) {	
						 count =gbdao.planGoodSelectData(article);
						pw.println(count);

					}
				}

			}else if(command.equals("/planbad.btns")) {
				int article = Integer.parseInt(request.getParameter("article")) ;
				int user_seq =((MemberDTO) request.getSession().getAttribute("user")).getSeq();	
				PrintWriter pw = response.getWriter();
				boolean check = gbdao.planBadCheck(article, user_seq);
				int count =0;
				if(check) {
					
					count = gbdao.planBadSelectData(article);
					pw.println(count);
				}else {
					int result = gbdao.planBadInsertData(article, user_seq);
					if(result>0) {
						count = gbdao.planBadSelectData(article);
						pw.println(count);
					}
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
