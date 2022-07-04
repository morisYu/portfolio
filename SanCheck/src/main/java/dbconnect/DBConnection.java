package dbconnect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection {

	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		/* Servers 의 context.xml 에 DB 연결 resource 설정한 경우 DB 연결 코드
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			// web.xml 에 있는 resource-ref 에서 res-ref-name 사용
			DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
			Connection conn = ds.getConnection();
			System.out.println("DB 연결 성공");
			return conn;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		*/
		/* DriverManager로 DB 연결방법 */
		Connection conn = null;
		
		String connect_url = "jdbc:mysql://localhost:3306/sancheck?useSSL=false&serverTimezone=Asia/Seoul";
		String connect_user = "user";
		String connect_password = "user1234";
		String connect_driver = "com.mysql.cj.jdbc.Driver";
		Class.forName(connect_driver);
		conn = DriverManager.getConnection(connect_url, connect_user, connect_password);
		return conn;
	}
}
