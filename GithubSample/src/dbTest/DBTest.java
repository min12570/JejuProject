package dbTest;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import biz.Biz;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBTest extends Biz {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con = (Connection) getConnection();//mySql ¿¬°á
		
		Statement st = (Statement) con.createStatement();
		 
        String sql;
        sql = "select * FROM people;";

        ResultSet rs = st.executeQuery(sql);
        String sqlRecipeProcess = "";
        while (rs.next()) {
            sqlRecipeProcess = rs.getString("firstname");
        }
        System.out.println(sqlRecipeProcess);
        
		close(con);//connection end		
		
	}

}