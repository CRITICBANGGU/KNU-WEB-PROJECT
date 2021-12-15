package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	//Connection is access to DATABASE object
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
//			String dbURL = "jdbc:mysql://localhost:3306/LOGIN?serverTimezone=Asia/Seoul";
//			String dbID="root";
//			String dbPassword="root";
//			Class.forName("com.mysql.jdbc.Driver");
			conn=getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;//login success
				}
				else
					return 0;//login fail password not equals
			}
			return -1;//ID none
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//db ERROR
	}
	
	public int join(User user) {
		String SQL="INSERT INTO USER VALUES(?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public static Connection getConnection() {
		
		Connection conn = null;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
		}catch (Exception e){
			e.printStackTrace();
		}
		return conn;
	}

}
