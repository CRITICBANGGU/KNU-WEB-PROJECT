package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CommentDAO {
	private Connection conn;	//db�뿉 �젒洹쇳븯�뒗 媛앹껜
	private ResultSet rs;
	
	public CommentDAO() {
		try {
			conn = getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	public int getNext() {
		String SQL = "SELECT commentID FROM comment ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //泥ル쾲吏� �뙎湲��씤 寃쎌슦
	}
	public int write(int boardID, int bbsID, String userID, String commentText) {
		String SQL = "INSERT INTO comment VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, getNext());
			pstmt.setInt(3, bbsID);
			pstmt.setString(4, userID);
			pstmt.setString(5, getDate());
			pstmt.setString(6, commentText);
			pstmt.setInt(7, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	public String getUpdateComment(int commentID) {
		String SQL = "SELECT commentText FROM comment WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�삤瑜�
	}
	public ArrayList<Comment> getList(int boardID, int bbsID){
		String SQL = "SELECT * FROM comment WHERE boardID = ? AND bbsID= ? AND commentAvailable = 1 ORDER BY bbsID DESC"; 
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  bbsID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setBbsID(rs.getInt(3));
				cmt.setUserID(rs.getString(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setCommentText(rs.getString(6));
				cmt.setCommentAvailable(rs.getInt(7));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	
	public int update(int commentID, String commentText) {
		String SQL = "UPDATE comment SET commentText = ? WHERE commentID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentText);
			pstmt.setInt(2, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
	}
	public Comment getComment(int commentID) {
		String SQL = "SELECT * FROM comment WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setBoardID(rs.getInt(1));
				cmt.setCommentID(rs.getInt(2));
				cmt.setBbsID(rs.getInt(3));
				cmt.setUserID(rs.getString(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setCommentText(rs.getString(6));
				cmt.setCommentAvailable(rs.getInt(7));
				return cmt;
			}
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int commentID) {
		String SQL = "DELETE FROM comment WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �뜲�씠�꽣踰좎씠�뒪 �삤瑜�
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