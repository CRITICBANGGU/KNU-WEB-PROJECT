<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	session.setAttribute("login_id", id);
	String name = request.getParameter("name");
	session.setAttribute("login_name", name);
	String pass = request.getParameter("pass");
	session.setAttribute("login_pass", pass);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 예제</title>
</head>
<body>
	<form method="post" action="mypage.jsp">
		<input type="submit" value="마이페이지">
	</form>
</body>
</html>