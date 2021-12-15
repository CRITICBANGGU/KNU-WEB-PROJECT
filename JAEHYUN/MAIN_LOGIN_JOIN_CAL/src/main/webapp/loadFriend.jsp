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
		//""안에 세션으로 값 바꾸기
	if(memberDAO.friendsLoad(loginId) != ""){
		result = memberDAO.friendsLoad(loginId);
		//값이 안넘어옴
		out.print(result);
	}else{
		//필요없으면 지우기
		out.print("1");
	}
	
	
%>