<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="user" class="user.User" scope="page"/>
    <jsp:setProperty name="user" property="userID"/>
    <jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>넌 뭐하고 사니? - 친구와의 일정을 편리하게</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		if(userID!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result==1){
			session.setAttribute("userID", user.getUserID());
			session.setAttribute("userName", user.getUserName());
			session.setAttribute("userPassword", user.getUserPassword());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('"+user.getUserID()+"')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		//password error
		else if(result==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//id none
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		// database error
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>  