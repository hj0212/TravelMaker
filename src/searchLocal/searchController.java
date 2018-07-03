package searchLocal;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import searchLocal.SearchLocation;

@WebServlet("*.sl")
public class searchController extends HttpServlet{
	SearchLocation search = new SearchLocation();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());

		boolean isForward = false;
		boolean isAjax = false;
		String dst = null;

		if(command.equals("/searchLocal.sl")) {
			try {
				String value = req.getParameter("value");
				// 검색된 장소의 정보
				JSONArray arr = search.getLocation(value);
				resp.setCharacterEncoding("utf8");
				resp.setContentType("application/json");

				resp.getWriter().print(arr);
			}catch(Exception e) {
				resp.getWriter().print("정보 가져오는데 실패");
			}

		}

		// 데이터 베이스에 저장하기 위해 ... 일단 나중에
		//			for(int i = 0; i < markerInfo.size(); i++) {
		//				JSONObject object = (JSONObject)markerInfo.get(i);
		//				System.out.println(object.get("locationname"));
		//				System.out.println(object.get("mapx"));
		//				System.out.println(object.get("mapy"));
		//			}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
}
