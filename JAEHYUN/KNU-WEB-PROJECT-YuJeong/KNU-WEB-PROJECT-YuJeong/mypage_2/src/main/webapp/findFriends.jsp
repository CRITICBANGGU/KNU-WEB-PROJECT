<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	
	String login_id = (String) session.getAttribute("login_id");
	
%>
<%@ page import="mypage_2.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>친구 관리</title>
<style>
    .main{height: 400px;}
    #find-input{height: 25px; width: 70%;}
    #find-btn{height: 25px; width: 20%;}
    .find-wrap{margin-top: 15px; margin-bottom: 15px;}
    #result-wrap{text-align: center;}
    #add-friend{font-size: 25px; list-style: none; }
    #add-btn{width: 100%; height:30px;}
    .add-btn-wrap{text-align: center;}
</style>
<script>
	window.onload = start;
	
	var state = 0;
	var request = null;
	var request2 = null;
	
	function start(){
		var addBtnWrap = document.getElementById("add-btn-wrap");
		addBtnWrap.style.display="none";
	}
	
	function createRequest(){
		try{
			request = new XMLHttpRequest();
		} catch(failed){
			request = null;
		}
		if (request == null)
			alert("Error creating request object!");
	}
	
	function findCheck(form){
		
		createRequest();
		var findId = document.getElementById("find-input");
        
		var url = "find.jsp?id=" + findId.value;
		request.open("POST",url, true);
		var qry = "id=" + findId.value;
		
		request.onreadystatechange = updatePage;
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request.send(qry);
		
		
	}
	
	function updatePage(){
		if(request.readyState==4){
			
				var findId = document.getElementById("find-input");
				var result = document.getElementById("result-wrap");
				var addFriend = document.getElementById("add-friend");
	            addFriend.innerHTML = findId;
	            
	            var responsetext = request.responseText;
				var response = responsetext.split(",");
				
				var addBtnWrap = document.getElementById("add-btn-wrap");
				
	            var addBtn = document.createElement("button");
				if(response.length != "2"){
					addFriend.innerHTML = findId.value +"[" + responsetext + " ]";
					addFriend.setAttribute("id", "add-friend");
		            result.appendChild(addFriend);
		            if(state==0){
			        	addBtnWrap.style.display="block";
		            }
					state = 1;
				}else{
					addFriend.innerHTML = "조회 실패";
					state = 0;
					
					addBtnWrap.style.display="none";
				}
			
		}
	}
	
	

	function createRequest2(){
		try{
			request2 = new XMLHttpRequest();
		} catch(failed){
			request2 = null;
		}
		if (request2 == null)
			alert("Error creating request object!");
	}
	
	
	function requestFriend(){
		createRequest2();
		var findId = document.getElementById("find-input");
		
//login_id 값 넣기
		var url = "request.jsp?S_id=" + <%=login_id%> + "&R_id=" + findId.value;
		request2.open("POST",url, true);
		var qry = "S_id=" + <%=login_id%> + "&R_id=" + findId.value;
		
		request2.onreadystatechange = updatePage2;
		request2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request2.send(qry);
		
		
		window.close();
	}
	function updatePage2(){
		if(request2.readyState==4){
			
				var findId = document.getElementById("find-input");
	            
	            var responsetext = request.responseText;
	
		}
	}
	
    
    //검색한 아이디 검색해서 있으면 목록 불러와서 li로 추가
    //추가 버튼도 같이 생성
//     function find(){
        
//         	var findId = document.getElementById("find-input");
//             var result = document.getElementById("result-wrap");
//             var addFriend = document.getElementById("add-friend");
//             addFriend.innerHTML = findId;
            
//         if(state == 0){
//             var addBtnWrap = document.getElementById("add-btn-wrap");
//             var addBtn = document.createElement("button");
//             addBtn.setAttribute("id", "add-btn")
//             addBtn.innerText = "요청하기";
//             //요청하기 눌렀을 경우 이벤트
//             addBtn.onclick = function(e){
//                 window.close();
//             }
//             addBtnWrap.appendChild(addBtn);
//         }
//         state = 1;
//     }

</script>
</head>
<body>
    <main class="main">
        <section class="find-wrap">
	        <form name="findForm">
	            <input type="text" id="find-input">
	            <button type="button" id="find-btn" onclick="findCheck(findForm)">검색</button><br>
	        </form>
        </section>
        <hr>
        <fieldset id="result-wrap">
            <legend><img src="user.png"></legend>
            <section id="add-friend">
            
            </section>
        </fieldset><br>
        <section class="add-btn-wrap" id="add-btn-wrap">
			<button type="button" id="add-btn" onclick="requestFriend()">요청하기</button>
        </section>
    </main>
</body>
</html>