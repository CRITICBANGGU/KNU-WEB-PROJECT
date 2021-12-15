<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>
String login_id = (String) session.getAttribute("login_id");
<%
	int yn = Integer.parseInt(request.getParameter("YN"));
	String friendId = request.getParameter("friend_id");
	System.out.println(friendId);
	//login id 파라메타 받은거
	int state = 0;
	if(yn==1){
		state = memberDAO.setYN(1, friendId, "aaa");
	}else if(yn == 0){
		state = memberDAO.setYN(0, friendId, "aaa");
	}
	
	
// 	if(state == 2){
// 		out.print("2,삭제");
// 	}

	
%>