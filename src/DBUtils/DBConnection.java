package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private Connection getConnection() throws Exception {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      String dbURL = "jdbc:oracle:thin:@59.10.249.73:1521:XE";
	      String dbId = "kh";
	      String dbPw = "kh";
	      return DriverManager.getConnection(dbURL,dbId,dbPw);
	   }
}
