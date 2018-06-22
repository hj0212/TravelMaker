package websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

//PDJO - Plain old Java Object

@ServerEndpoint("/websocket")
public class MakerChat {
	public static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	
	private static int connectorCount=1;
	
	@OnOpen  //클라이언트가 접속했을때 실행되는 매서드
	public void handleOpen(Session session) {
		
		System.out.println(connectorCount++ +"사용자가 접속 했습니다");
		clients.add(session); //연결되어온 세션값을 저장하겠다 
	}
	
	@OnMessage
	public void handleMessage(String message)throws Exception{
		System.out.println(message);
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message);
		String id = element.getAsJsonObject().get("id").getAsString();
		String msg = element.getAsJsonObject().get("msg").getAsString();
		System.out.println(id + " : " + msg);
		for(Session tmp : clients) {
			//tmp.getBasicRemote().sendText(message);
		}
	}
	
	@OnClose
	public void handleClose(Session session) {
		clients.remove(session); //누군가 연결을 끊으면 그 세션값을 지우겠다 
	}
	
	public void handleError(Throwable t) {//뒤에 able이 붙으면 인터페이스일경우가 대부분이다 
		t.printStackTrace();
	}

}











