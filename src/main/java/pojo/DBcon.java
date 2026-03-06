package pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBcon {
	
	public static Connection getCon() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url = "jdbc:oracle:thin:@//localhost:1521/testdb";
		String uid = "green";
		String upw = "1234";
		Connection con = DriverManager.getConnection(url, uid, upw);
		return con;
	}
}
