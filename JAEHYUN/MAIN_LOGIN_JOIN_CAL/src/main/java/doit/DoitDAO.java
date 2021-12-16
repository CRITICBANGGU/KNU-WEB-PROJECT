package doit;

import org.json.simple.JSONObject; 
import java.util.*;
import org.json.simple.parser.JSONParser; 
import org.json.simple.parser.ParseException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.google.gson.Gson;


public class DoitDAO {
	private Connection conn;
	//private PreparedStatement pstmt;
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
	
	public int getNext() {
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap<String, List<Object>>>();
		Object json = new Object();
		//list=getFriendList(userID);
		//json = list.get(0).get("jsondata").get(1);
		String SQL = "SELECT doitNum FROM doit ORDER BY doitNum DESC";
		String maxNum = "select max(doitNum) from doit";
		
		int maxNumint=0;
		try {
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
					return rs.getInt(1)+1;
			}
			return 1;//first doit
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int printCal(String userID) {
		String SQL = "SELECT doList FROM doit WHERE userID=?";
		try {
			PreparedStatement pstmt;
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
	public ArrayList<HashMap <String, List<Object>>> getLIST(String userID){
		String SQL = "SELECT doList FROM doit WHERE userID=?";
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap<String, List<Object>>>();
		HashMap<String, List<Object>> Json = new HashMap<String, List<Object>>();
		List<Object> json = new ArrayList<Object>();
		try {
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			Object Jsondata = new Object();
			while(rs.next()) {
				Jsondata = rs.getObject(1);
				json.add(Jsondata);
			}
			Json.put("jsondata", json);
			list.add(Json);
			//Jsondata = Jsondata.substring(0, Jsondata.length() - 1);
			return list;//Jsondata.substring(0, Jsondata.length() - 1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public ArrayList<HashMap <String, List<Object>>> getFriendList(String userID){
		String SQL = "SELECT friends FROM doit WHERE userID=?";
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap<String, List<Object>>>();
		HashMap<String, List<Object>> Json = new HashMap<String, List<Object>>();
		List<Object> json = new ArrayList<Object>();
		try {
			int count=0;
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			Object Jsondata = new Object();
			while(rs.next()) {
				Jsondata = rs.getObject(1);
				json.add(Jsondata);
				count++;
			}
			if(count==0||Jsondata==null) {
				return null;
			}
			Json.put("jsondata", json);
			list.add(Json);
			//Jsondata = Jsondata.substring(0, Jsondata.length() - 1);
			return list;//Jsondata.substring(0, Jsondata.length() - 1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	public Object getFriendsDB(String userID) {
		String getFriends="SELECT friends FROM doit WHERE userID=?";
		try {
		PreparedStatement pstmt2;
		pstmt2=conn.prepareStatement(getFriends);
		ResultSet rs2;
		pstmt2.setString(1,userID);
		rs2=pstmt2.executeQuery();
		Object friendsJSON = new Object();
		friendsJSON = rs2.getObject(1);
		return friendsJSON;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;//db ERROR
	}
	public int addDB(String userID, String json) {
		String SQL = "insert into doit values(?, ? ,?,?)";
		//DoitDAO dao = new DoitDAO();
		Object friendsJSON = new Object();
		friendsJSON=getFriendList(userID);
		int num =getNext();
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap <String, List<Object>>>(); 
	    list = getFriendList(userID);
	    if(list !=null) {friendsJSON=list.get(0).get("jsondata").get(1);}
	    else {friendsJSON=null;}
		
		//System.out.println(jsonString);
		
		//makeJson employee = gson.fromJson(jsonString, makeJson.class);
		//System.out.println(employee);
		try {
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,json);
			pstmt.setObject(3,friendsJSON);
			pstmt.setInt(4, getNext());
			pstmt.executeUpdate();
			return 0;//success
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//num-=20;
		}
		return -1;//db ERROR
	}
	
	public int eventChange(String userID, JSONObject oldjson, JSONObject newjson ) {
		String select = "SELECT doList FROM doit WHERE userID=?";
		try {
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(select);
			pstmt.setString(1,userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getObject(1).equals(oldjson)) {
					return 100;
				}
			}
			return -1;//ID none
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;//db ERROR
	}
	public int deletDB(String userID, String json) {
		String SQL = "insert into doit values(?, ? ,?,?)";
		//DoitDAO dao = new DoitDAO();
		Object friendsJSON = new Object();
		friendsJSON=getFriendList(userID);
		int num =getNext();
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap <String, List<Object>>>(); 
	    list = getFriendList(userID);
	    if(list !=null) {friendsJSON=list.get(0).get("jsondata").get(1);}
	    else {friendsJSON=null;}
		
		//System.out.println(jsonString);
		
		//makeJson employee = gson.fromJson(jsonString, makeJson.class);
		//System.out.println(employee);
		try {
			PreparedStatement pstmt;
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			pstmt.setString(2,json);
			pstmt.setObject(3,friendsJSON);
			pstmt.setInt(4, getNext());
			pstmt.executeUpdate();
			return 0;//success
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			//num-=20;
		}
		return -1;//db ERROR
	}
}
