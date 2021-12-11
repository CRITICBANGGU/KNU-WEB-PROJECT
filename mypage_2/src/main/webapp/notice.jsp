<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
request.setCharacterEncoding("utf-8");
String login_id = (String) session.getAttribute("login_id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>받은 요청 목록</title>
<style>
    .request-list{list-style: none; margin:0px; padding: 0px; width: 100%;, height: auto;}
    .li{ margin-bottom:5px; padding: 5px 0px 5px 5px; border-bottom: 1px solid #cacaca; text-align: left;}
</style>
<script>
	window.onload = requestList;
	
	var request = null;
	
	function createRequest(){
		try{
			request = new XMLHttpRequest();
		} catch(failed){
			request = null;
		}
		if (request == null)
			alert("Error creating request object!");
	}
	
	function requestList(){
		//session id로 데베 검색해서 받은 요청 불러오기
		//ox에 따라서 YN값 집어넣기
		
		createRequest();
        
		var url = "requestUpdate.jsp?loginId=" + <%= login_id %>;
		request.open("POST",url, true);
		var qry = "loginId=" + <%= login_id %>;
		
		request.onreadystatechange = updatePage;
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request.send(qry);
		
	}
	
	
	function updatePage(){
		if(request.readyState==4){
			var findId = document.getElementById("find-input");
			var list = document.getElementById("request-list");
			
			var responsetext = request.responseText;
			var response = responsetext.split(" ");
            for(var i = 0; i < response.length -1; i++){
            	
    			var newList = document.createElement("li");
    			newList.setAttribute("id", "li" + i);
    			newList.setAttribute("class", "li");
    			newList.innerHTML = response[i] + '<input style="float:right;" type="button" value="X" onclick="YN(0,' + i +')">'+
    			'<input style="float:right;" type="button" value="O" onclick="YN(1,' + i + ')">';
    			list.appendChild(newList);
            }
            

		}
	}
	
	var request2 = null;
	
	function createRequest2(){
		try{
			request2 = new XMLHttpRequest();
		} catch(failed){
			request2 = null;
		}
		if (request2 == null)
			alert("Error creating request object!");
	}
	
	function YN(on, i){
		//보낸 아이디랑 받은 아이디도 같이 보내기
		createRequest2();
		var list = document.getElementById("request-list");
		var friend = document.getElementById("li" + i).innerText;
		var Dfriend = document.getElementById("li" + i);
        var yn = -1;
        if(on == 1){
        	yn = 1;
        	list.removeChild(Dfriend);
        }else if(on == 0){
        	yn = 0;
        	list.removeChild(Dfriend);
        }
        //마지막 세션 아이디
		var url = "YNUpdate.jsp?YN=" + yn + "&friend_id=" + friend + "&login_id=" + "aaa";
		request2.open("POST",url, true);
		var qry = "YN=" + yn + "&friend_id=" + friend + "&login_id=" + "aaa";
		
		request2.onreadystatechange = updatePage2;
		request2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request2.send(qry);
		
	}
	
	
	function updatePage2(){
		if(request2.readyState==4){
			
			var responsetext = request.responseText;
			var response = responsetext.split(",");
			
// 			if(response.length == 2){
				
// 			}
		}
	}

</script>
</head>
<body>
    <main class="main">
        <section id = "request-wrap">
            <h3>받은 요청 목록</h3>
            <hr>
            <ul class="request-list" id="request-list">
                
            </ul>
        </section>
    </main>
</body>
</html>