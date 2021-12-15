package doit;

import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DoitDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DoitDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/LOGIN?serverTimezone=Asia/Seoul";
			String dbID="root";
			String dbPassword="root";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int printCal(String userID) {
		String SQL = "SELECT doList FROM doit WHERE userID=?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0;
			}
			return -1;//ID none
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//db ERROR
	}
	public Object getLIST(String userID) {
		String SQL = "SELECT doList FROM doit WHERE userID=?";
		//String Jsondata="";
		Object Jsondata = new JSONObject();
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Jsondata=rs.getObject(1);
			}
			//Jsondata = Jsondata.substring(0, Jsondata.length() - 1);
			return Jsondata;//Jsondata.substring(0, Jsondata.length() - 1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Jsondata;
	}
}
