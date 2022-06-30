package post;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// Servers 에 있는 context.xml 파일에 dbms 연결 resource 설정 후 dbms 연결
public class DBConn {
	
	public static Connection getConnection(){
		
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
	}
}
