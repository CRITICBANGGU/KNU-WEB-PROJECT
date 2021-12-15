package mypage_2;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	public static int modifyPass(String id, String name, String pass) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int Prows = 0;
		try{
			con = getConnection();
			
			String sql="UPDATE test SET name=?, pass=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, pass);
			pstmt.setString(3, id);
			
			Prows = pstmt.executeUpdate();
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return Prows;
	}

	public static String findFriends(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String res = "";
		try{
			con = getConnection();
			
			String sql="SELECT * FROM test WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				res = result.getString(3);
			}
			result.close();
			
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return res;
	}
	
	public static int requestFriends(String SId, String RId, String YN) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int Rrows = 0;
		try{
			con = getConnection();
			
			String sql="INSERT INTO request VALUE (?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, SId);
			pstmt.setString(2, RId);
			
			Rrows = pstmt.executeUpdate();;
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return Rrows;
		
	}
	public static String requestLoad(String Id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String requestResult = "";
		try{
			con = getConnection();
			
			String sql="SELECT * FROM request WHERE R_request=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, Id);
			
			ResultSet result = pstmt.executeQuery();
			while(result.next()) {
				requestResult += (result.getString(1) + " ");
			}
			result.close();
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return requestResult;
	}
	public static int setYN(int yn, String friend, String login) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		int SRows = 0;
		
		try{
			con = getConnection();
			if(yn==1) {
				String sql="INSERT INTO friendList VALUE (?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, login);
				pstmt.setString(2, friend);
				SRows = pstmt.executeUpdate();
				
				String sql2="DELETE from request WHERE S_request=?;";
				
				pstmt2 = con.prepareStatement(sql2);
				
				pstmt2.setString(1, friend);
				pstmt2.executeUpdate();
				
			}else if(yn==0) {
				String sql="DELETE from request WHERE S_request=?;";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, friend);
				
				SRows = pstmt.executeUpdate();
				SRows += 1;
			}
			
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return SRows;
	}
	
	public static String friendsLoad(String Id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String resultLoad = "";
		try{
			con = getConnection();
			
			String sql="SELECT * FROM friendList WHERE id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, Id);
			
			ResultSet result = pstmt.executeQuery();
			
			
			while(result.next()) {
				resultLoad += (result.getString(2) + " ");
			}
			result.close();
			
			
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return resultLoad;
		
	}
	
	public static int friendsDelete(String login, String friend) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int DRows = 0;
		try{
			con = getConnection();
		
			String sql="DELETE from friendList WHERE id=? AND friend=?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, login);
			pstmt.setString(2, friend);
			
			DRows = pstmt.executeUpdate();
			System.out.println(DRows);
			} catch(Exception e){
				System.out.println("메소드 오류" + e.toString());
			} finally{
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if(con!=null)
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		
		return DRows;
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
