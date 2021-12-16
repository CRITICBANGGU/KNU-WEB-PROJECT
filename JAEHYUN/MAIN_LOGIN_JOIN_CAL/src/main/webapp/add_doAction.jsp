<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="doit.DoitDAO" %>
    <%@ page import="doit.makeJson" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import= "com.google.gson.Gson" %>
<%@ page import= "org.json.simple.JSONObject"  %>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="doit" class="doit.Doit" scope="page"/>
    <jsp:setProperty name="doit" property="doIT"/>
    <jsp:setProperty name="doit" property="date"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
		DoitDAO doitDAO = new DoitDAO();
		//Object addJson = new JSONObject();
		String date = request.getParameter("date");
    	String startT = request.getParameter("startT");
    	String endT = request.getParameter("endT");
    	String doIT = request.getParameter("doIT");
    	String dateNtimeS = date+"T"+startT+":00";
    	String dateNtimeE = date+"T"+endT+":00";
    	%>
    	<script>alert("<%= dateNtimeS%>");</script>
    	<%
    	//addJson.add("title",doIT);
    	PrintWriter script = response.getWriter();
		
    	makeJson addJson = new makeJson();
    	addJson.setJson(doIT, dateNtimeS, dateNtimeE);
    	//Object k = new Object();
    	//doitDAO.addDB(userID, addJson);
    	//userID=(String)session.getAttribute("userID");
    	Gson gson = new Gson();
    	String jsonString = gson.toJson(addJson);
    	int num=doitDAO.addDB(userID, jsonString);
    	//doitDAO.addDB(userID, addJson);
    	if(num==0){
    	script.println("<script>");
		script.println("alert('저장되었습니다')");
		script.println("location.href='calAction.jsp'");
		script.println("</script>");
    	}
    	else{
    		script.println("<script>");
    		script.println("alert('"+num+"')");
    		script.println("</script>");
    	}
    	//if(done==0){
		//	script.println("<script>");
		//	script.println("alert('저장성공')");
		//	script.println("location.href='calAction.jsp'");
		//	script.println("</script>");
    	//}
    	//else{
		//	script.println("<script>");
		//	script.println("alert('"+done+"')");
		//	script.println("</script>");}
	%>
</body>
</html>