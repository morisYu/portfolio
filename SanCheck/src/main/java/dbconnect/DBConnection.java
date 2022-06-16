package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Connection conn = null;
		
		String connect_url = "jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul";
		String connect_user = "root";
		String connect_password = "1234";
		String connect_driver = "com.mysql.cj.jdbc.Driver";
		
		Class.forName(connect_driver);
		conn = DriverManager.getConnection(connect_url, connect_user, connect_password);
		
		return conn;
	}
}
