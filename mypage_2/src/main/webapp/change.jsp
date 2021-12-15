<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%
	String login_id = (String) session.getAttribute("userID");
	String newName = request.getParameter("name");
	String newPass = request.getParameter("newPass");
	int state = 0;
	state = memberDAO.modifyPass(login_id, newName, newPass);
	
	if(state != 0){
		out.print("1");
	}
%>