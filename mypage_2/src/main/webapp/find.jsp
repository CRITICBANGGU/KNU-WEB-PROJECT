<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%
	
	String findId = request.getParameter("id");
	System.out.println(findId);
	String result = "";
	if(memberDAO.findFriends(findId) != ""){
		result = memberDAO.findFriends(findId);
		out.print(result);
	}else{
		out.print("1,2");
	}
	
%>