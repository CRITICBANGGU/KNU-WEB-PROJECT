<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="doit.DoitDAO" %>
<%@ page import="doit.Doit"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import= "org.json.simple.JSONObject"  %>
<!DOCTYPE html>
<html>

<head>
    <script>
        <%
        DoitDAO doitDAO = new DoitDAO();
        String userID = (String) session.getAttribute("userID");

        ArrayList < HashMap < String, List < Object >>> list = new ArrayList < HashMap < String, List < Object >>> ();
        list = doitDAO.getLIST(userID);
        Object json = new Object();
        int sizeJson = 0;
        sizeJson = list.get(0).get("jsondata").size(); 
        %>
    </script>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>

<body>
    <h2>일정 수정하기</h2>
    <ul>
        		<%
                	for(int i =0;i<((int)sizeJson);i++){
                		json = list.get(0).get("jsondata").get(i);
                %>
    	<li><%= json%>
    			<%
                	}
                %>
    </ul>
    
</body>

</html>