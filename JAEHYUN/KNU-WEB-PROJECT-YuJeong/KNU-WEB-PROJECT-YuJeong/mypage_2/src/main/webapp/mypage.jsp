<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
	*{margin: 0; padding: 0;}
	body{padding:30px;}
	header{padding: 5px;}
	header a{text-decoration: none;}
	nav{margin-top: 10px; margin-bottom:20px;}
	nav ul{
		list-style: none;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		text-align: center;
	}
	nav ul li{
		display: inline;
	}
	nav ul li a{
		text-decoration: none;
		color: black;
		line-height: 3em;
		text-transform: uppercase;
	}
	nav ul li a: hover{text-decoration: underline;}
	#left{
		float: left;
		width: 10em;
		margin-right: 1em;
	}
	#left ul{list-style:none;}
	#left ul li{
		background-color: #3f3f3f;
		padding: 5px 10px;
		border-bottom: 1px solid black;
	}
	#left ul li a{
	color: white;
	text-decoration: none;}
	#left ul li:hover{
		background-color: red;
	}
	#main{
	float: left;
	}
	
    /*
    .content-wrap{position: absolute; left:50%; top:30%; transform: translate(-50%, -50%); text-align:center;}
    #lbl-mypage{font-size:30px; text-align: center;}
    #privacy-btn{height: 50px; width: 100%;}
    #friends-btn{height: 50px; width: 100%;}
    .friends-btn-wrap{margin-top: 5px;}
    */
</style>
<script>
    function clickNotice(){
        //window.open("findFriends.html", "childForm", "width=300, height=220, left=600, top=100");
        window.open("notice.jsp", "PopupWin", "width=300,height=400, left=600, top=100");
    }
</script>
</head>
<body>
	<header>
		<h1>
			<!--  a로 첫 시작 화면 가도록 -->
			<a href="privacy.jsp">시작 화면으로 이동</a>
		</h1>
	</header>
	<nav>
		<ul>
			<!--  다른 기능들 -->
			<li><a href="privacy.jsp">기능1</a>
			<li><a href="privacy.jsp">기능2</a>
		</ul>
	</nav>
	<aside id="left">
		<ul>
			<li><a href="privacy.jsp" target="iframe">정보 변경</a>
			<li><a href="friends.jsp" target="iframe">친구 목록</a>
			<li><a href="notice.jsp" target="iframe">받은 요청</a>
		</ul>
	</aside>
	<section id="main">
		<article>
			<iframe name="iframe" src="privacy.jsp" frameborder="0" width="440" height="800"></iframe>
		</article>
	</section>
	
	
	
	
	<!-- 
    <main class="main">
        <h1 id="lbl-mypage">마이페이지</h2>
            <hr>
        <section class="content-wrap">
            
            <section class="notice-wrap">
                <img class="notice-img" id="notice-img" src="no_notice.png" onclick="clickNotice()">
                <span class="notice-count" id="notice-count" onclick="clickNotice()">(0)</span>
                <span class="notice-text" id="notice-text" onclick="clickNotice()">새로운 알림이 없습니다.</span>
            </section><br>
            <section class="privacy-btn-wrap">
                <button type="button" id="privacy-btn" onclick="location.href='privacy.jsp'">정보 변경</button>
            </section>
            <section class="friends-btn-wrap">
                <button type="button" id="friends-btn" onclick="location.href='friends.jsp'">친구 관리</button>
            </section>
        </section>
      </main>
      -->
      
</body>
</html>