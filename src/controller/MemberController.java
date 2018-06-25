package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.user")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 request.setCharacterEncoding("utf8");
			 String requestURI = request.getRequestURI();
			 String contextPath = request.getContextPath();
			 String command =  requestURI.substring(contextPath.length());
			 boolean isRedirect = true;
			 String dst ="";
			 if(command.equals("/login.user")) {
				 
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
