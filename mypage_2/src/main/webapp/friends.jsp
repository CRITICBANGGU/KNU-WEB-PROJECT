<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String login_id = (String) session.getAttribute("login_id");
%>
<html>
<head>
<meta charset="UTF-8">
<title>친구 관리</title>
<style>
    .content-wrap{width: 400px;position: absolute; left:50%; top:25%; transform: translate(-50%, -50%); text-align:center;}
    #lbl-friends{font-size:30px; text-align: center;}
    #find-btn{height: 40px; width: 100%;}
    .friends-list{list-style: none; margin:0px; padding: 0px; width: 100%;}
    .friend{ margin-bottom:5px; padding: 5px 0px 5px 5px; border: 1px solid #cacaca; text-align: left;}
</style>
<script>
	window.onload = loadFriend;
	
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
	
	function loadFriend(){
		//session id로 데베 검색해서 친구목록 불러오기
		
		createRequest();
	    //login_id로 바꾸기
		var url = "loadFriend.jsp?loginId=" + "aaa" ;
		request.open("POST",url, true);
		var qry = "loginId=" + "aaa" ;
		
		request.onreadystatechange = updatePage;
		request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request.send(qry);
		
	}
	
	
	function updatePage(){
		if(request.readyState==4){
			
			var friendList = document.getElementById("friends-list");
			
			var responsetext = request.responseText;
			var response = responsetext.split(" ");
	        
			for(var i = 0; i < response.length -1; i++){
	        	
				var newfriend = document.createElement("li");
				newfriend.setAttribute("id", "friend" + i);
				newfriend.setAttribute("class", "friend");
				
				
				newfriend.innerHTML = response[i] + "<img style='float:right;' src='delete.png' onclick='deleteFriend(" + i + ")'>";
				friendList.appendChild(newfriend);
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
	
	function deleteFriend(i){
		createRequest2();
		
		var friend = document.getElementById("friend" + i).innerText;
        //마지막 세션 아이디
		var url = "deleteFriend.jsp?loginId=" + "aaa" + "&friendId=" + friend ;
		request2.open("POST",url, true);
		var qry = "loginId=" + "aaa" + "&friendId=" + friend ;
		
		request2.onreadystatechange = updatePage2;
		request2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		request2.send(qry);
	}
	
	function updatePage2(){
		if(request2.readyState==4){
			
			var responsetext = request.responseText;
			//var response = responsetext.split(",");
			
// 			if(response.length == 2){
				
// 			}
		}
	}
	
    function findFriends(){
        window.open("findFriends.jsp", "childForm", "width=300, height=220, left=600, top=100");
    }
</script>
</head>
<body>
    <main class="main">
        <h1 id="lbl-friends">친구 관리</h2>
        <hr>
        <section class="content-wrap">
            <button type="button" id="find-btn" onclick="findFriends()">친구 검색</button><br><br>
            <section>
                <ul class="friends-list" id="friends-list">
                
                </ul>
            </section>
        </section>
      </main>
</body>
</html>