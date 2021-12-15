<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");%>

<%
	String loginId = request.getParameter("loginId");
	String friendId = request.getParameter("friendId");
	
	String result = "";
	int state = 0;
	
	if(memberDAO.friendsLoad(loginId) != ""){
		result = memberDAO.friendsLoad(loginId);
		out.print(result);
	}else{
		out.print("1");
	}
	
	
%>