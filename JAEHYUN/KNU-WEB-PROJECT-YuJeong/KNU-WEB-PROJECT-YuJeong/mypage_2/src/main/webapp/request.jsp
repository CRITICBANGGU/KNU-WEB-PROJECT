<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%
	String sendId = request.getParameter("S_id");
	String receiveId = request.getParameter("R_id");
	System.out.println(sendId + receiveId);
	int state = 0;
	String result = "";
	
	state = memberDAO.requestFriends("test", receiveId, "");
	
	if(state != 0){
		out.print("1");
	}
	
%>