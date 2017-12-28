package biz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

public class Biz {
	public Biz() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		Connection con = null;
		Statement st = null;
		try {
			//개개인의 것으로 넣어서 test 해주세용										//db이름	//id	//pw
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mySql" , "root", "mysql");
			con.setAutoCommit(false);
			System.out.println("success!");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con){
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
