import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int insertCount = 0;
		Connection conn = null;
		Statement state = null;
		PreparedStatement ps = null;
		try {
			
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login_db?serverTimezone=UTC", 
					"root","rhkgkr!@");
			System.out.println("success");
			state = conn.createStatement();
			String sql = "INSERT INTO member(id, name, password, age, gender, email) VALUES(?, ?, ?, ?, ?, ?);";
			//String sql = "insert into role(role_id, description) values (?, ?)";1, '김태하', '1234', 33, 'male', 'wer@gmail.com'
			ps = conn.prepareStatement(sql);
			ps.setInt(1, 1);
			ps.setString(2, "김회하");
			ps.setInt(3, 33);
			ps.setString(4, "1234");
			ps.setString(5,"male");
			ps.setString(6, "wer@gmail.com");
			insertCount = ps.executeUpdate();
			
			sql = "SELECT * FROM member";
			ResultSet rs = state.executeQuery(sql);
			while (rs.next()) {                            
			     String id = rs.getString("id");                         
			     String name = rs.getString("name");                             
			     String password = rs.getString("password");                             
			     String age = rs.getString("age");                             
			     String gender = rs.getString("gender");                             
			     String email = rs.getString("email");                             
			     System.out.printf("id : %s\nname : %s\npassword : %s\nage : %s\ngender : %s\nemail : %s\n----\n",id, name, password, age, gender, email);
			}
			     rs.close();
			     state.close();                      
			     conn.close();
		} catch (SQLException ex) {
			System.out.println("SQLException" + ex);
		} finally {                      
		    try {                             
		        if (conn != null && !conn.isClosed()) {                                     
		                       conn.close();                             
		     }                      
		 }
		 catch (SQLException e) {
		          e.printStackTrace();                      
		     }              
		 }
	}
}
