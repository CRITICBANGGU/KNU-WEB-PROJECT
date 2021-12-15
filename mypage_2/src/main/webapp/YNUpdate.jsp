<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%
	int yn = Integer.parseInt(request.getParameter("YN"));
	String friendId = request.getParameter("friend_id");
	String loginId = request.getParameter("login_id");
	//오류나면loginId 세션으로 변경
	int state = 0;
	if(yn==1){
		state = memberDAO.setYN(1, friendId, loginId);
	}else if(yn == 0){
		state = memberDAO.setYN(0, friendId, loginId);
	}
	

%>