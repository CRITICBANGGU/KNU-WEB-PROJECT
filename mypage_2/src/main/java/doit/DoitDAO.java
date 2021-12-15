package doit;

import org.json.simple.JSONObject; 
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DoitDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DoitDAO() {
		try {
			conn=getConnection();
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
