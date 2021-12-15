<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");%>
<%
	
	String id = (String) session.getAttribute("userID");
	String name = "";
	name = memberDAO.loadName(id);
	
	
	out.print(name);
	
%>