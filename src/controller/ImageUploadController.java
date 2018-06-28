package controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.iu")
public class ImageUploadController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		
		if(command.equals("/freeboard/imageUpload.iu")) {
			// 이미지를 업로드할 경로
			String uploadPath = request.getServletContext().getRealPath("/files/");
			int size = 10 * 1024 * 1024;	// 업로드 사이즈 10M 이하,
			System.out.println(command);
			
			// 경로가 없을 경우 결로 생성
			File f = new File(uploadPath);
			if(!f.exists()) {
				f.mkdir();
			}
			
			// 원래 파일명, 시스템에 저장되는 파일명
			String ofileName = "";
			String sfileName = "";
			
			try {
				// 파일 업로드 및 업로드 후 파일명을 가져옴
				MultipartRequest mr = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
				Enumeration<String> files = mr.getFileNames();
				String file = files.nextElement();
				ofileName = mr.getOriginalFileName(file);
				sfileName = mr.getFilesystemName(file);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			uploadPath = contextPath + "/files/" + sfileName;
			
			// 생성된 경로를 JSON 형식으로 보내주기 위한 설정
			JSONObject jobj = new JSONObject();
			jobj.put("url", uploadPath);
			
			response.setContentType("application/json");
			response.getWriter().print(jobj.toJSONString());
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
