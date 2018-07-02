package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoodBadController
 */
@WebServlet("*.btns")
public class GoodBadController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String requestURI = request.getRequestURI();
			String contextPath = request.getContextPath();
			String command = requestURI.substring(contextPath.length());
			System.out.println(command);
			request.setCharacterEncoding("utf8");
			response.setCharacterEncoding("utf8");
			//좋아요 버튼시
			if(command.equals("/goodbtn.btns")) {
				String good = request.getParameter("good");
				System.out.println(good);
				PrintWriter pw = response.getWriter();
				pw.println(good);
				
			}
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
