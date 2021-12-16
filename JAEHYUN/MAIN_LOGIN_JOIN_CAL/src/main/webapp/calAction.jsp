<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="doit.DoitDAO" %>
<%@ page import="doit.Doit"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import= "org.json.simple.JSONObject"  %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="doit" class="doit.Doit" scope="page"/>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
  </head>
  <body>
  <% 
  DoitDAO doitDAO = new DoitDAO();
  String userID=null;
  if(session.getAttribute("userID")!=null){
		PrintWriter script = response.getWriter();
		userID=(String)session.getAttribute("userID");
		script.println("<script>");
		script.println("</script>");
	}
  int result = doitDAO.printCal(userID);
  if(result==0){
		PrintWriter script = response.getWriter();
		
		ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap <String, List<Object>>>(); 
	    list = doitDAO.getLIST(userID);
	    
	    Object jsondata =new Object();
	    Object json = new Object();
	    json = list.get(0).get("jsondata").get(0);

	    int sizeJsondata =0;
		script.println("<script>");
		//script.println("var hello3 = 'sibal hello'");
		script.println("alert('일정불러오기 성공.')");
		script.println("location.href='cal.jsp'");
		//script.println("var jsonDone = JSON.parse(jsonText[0])");
		script.println("</script>");
		
		
	}
  else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('첫가입 환영합니다')");
		script.println("location.href='cal.jsp'");
		script.println("</script>");
	}
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