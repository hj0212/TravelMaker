package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() throws Exception {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      String dbURL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	      String dbId = "kh";
	      String dbPw = "kh";
	      return DriverManager.getConnection(dbURL,dbId,dbPw);
	   }
}
