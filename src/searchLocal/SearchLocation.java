package searchLocal;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class SearchLocation {
	
	public JSONArray getLocation(String keyword) throws Exception {
		String clientId = "ERlg6fkehruu5c9Oi5Z1";
		String clientSecret = "0Y3CdzH1ol";

		String text = URLEncoder.encode(keyword, "UTF-8");
		String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text+"&display=100"; // json 형식
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		
		if(responseCode==200) { 
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {  
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();
		
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonparser.parse(response.toString());
		JSONArray jsonArray = (JSONArray)jsonObj.get("items");

//		for(int i = 0; i < jsonArray.size(); i++) {
//			JSONObject object = (JSONObject)jsonArray.get(i);
//			System.out.println(object.get("address"));
//			System.out.println(object.get("mapy") + " : " + object.get("mapx"));
//		}
//		System.out.println(jsonArray);
		
		return jsonArray;
	}
	
	// 사용자로부터 받은 정보를 맵에 표시하기위해 정보를 전달 해준다.
	public JSONArray markerInfo(String visitedlocation) throws Exception {
		JSONParser jsonparser = new JSONParser();
		JSONArray jsonArray = (JSONArray)jsonparser.parse(visitedlocation);
		System.out.println(jsonArray);
		
		return jsonArray;
	}
}
